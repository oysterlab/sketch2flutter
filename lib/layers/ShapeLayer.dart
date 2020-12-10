import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../models/model.dart' as Sketch;
import 'package:get/get.dart';
import '../Controllers/LayerModelController.dart';

import '../enums/ActionType.dart';

class Controller extends GetxController {
  final Sketch.Layer layer;
  final List<Sketch.Layer> layers;

  Controller(this.layer, this.layers);

  Timer setTimeout(callback, [int duration = 1000]) {
    return Timer(Duration(milliseconds: duration), callback);
  }

  animKeyframe(Map<String, dynamic> keyframe) {
    String layerId = keyframe['layerId'];
    int duration = keyframe['duration'] * 3;
    int delay = keyframe['delay'] * 3;

    setTimeout(() {
      if (layers.where((layer) => layer.doObjectID == layerId).toList().length == 0) return;

      Sketch.Layer layer = layers.where((layer) => layer.doObjectID == layerId).toList()[0];
      Sketch.Layer fromLayer = Sketch.Layer.fromJson(layer.toJson());
      Sketch.Layer toLayer = Sketch.Layer.fromJson(keyframe['state']);

      Sketch.Layer diff = toLayer - fromLayer;
      int startTime = DateTime.now().millisecondsSinceEpoch;

      Timer.periodic(new Duration(milliseconds: 16), (timer) {
        int currentTime = DateTime.now().millisecondsSinceEpoch;
        double r = (currentTime - startTime) / duration;

        if (r >= 1.0) {
          r = 1.0;
          timer.cancel();
        }

        diff.style.fills.asMap().entries.forEach((entry) {
          int index = entry.key;
          layer.style.fills[index].color.alpha = fromLayer.style.fills[index].color.alpha + diff.style.fills[index].color.alpha * r;
          layer.style.fills[index].color.red = fromLayer.style.fills[index].color.red + diff.style.fills[index].color.red * r;
          layer.style.fills[index].color.green = fromLayer.style.fills[index].color.green + diff.style.fills[index].color.green * r;
          layer.style.fills[index].color.blue = fromLayer.style.fills[index].color.blue + diff.style.fills[index].color.blue * r;
        });

        diff.points.asMap().entries.forEach((entry) {
          int index = entry.key;
          layer.points[index].curveTo = fromLayer.points[index].curveTo + diff.points[index].curveTo;
          layer.points[index].curveFrom = fromLayer.points[index].curveFrom + diff.points[index].curveFrom;
          layer.points[index].point = fromLayer.points[index].point + diff.points[index].point;
        });

        layer.rotation = fromLayer.rotation + diff.rotation * r;
        layer.frame.x = fromLayer.frame.x + diff.frame.x * r;
        layer.frame.y = fromLayer.frame.y + diff.frame.y * r;
        layer.frame.width = fromLayer.frame.width + diff.frame.width * r;
        layer.frame.height = fromLayer.frame.height + diff.frame.height * r;
      });
    }, delay);
  }
}

class ShapeLayer extends StatelessWidget {
  final Sketch.Layer layer;
  final Map imageAssets;
  ShapePainter shapePainter;
  Controller c;
  LayerModelController layerModelController = Get.find();

  ShapeLayer(this.layer, this.imageAssets) {
    c = new Controller(layer, layerModelController.layers);
  }

  @override
  Widget build(BuildContext context) {
    print('build ' + layer.doObjectID);
    shapePainter = ShapePainter(layer, imageAssets);
    return CustomPaint(
      key: Key(layer.doObjectID),
      painter: ShapePainter(layer, imageAssets),
    );
  }

  hit(double x, double y, ActionType actionType) {
    if (layer.userInfo == null) return;

    List<dynamic> keyframeActions =
        layer.userInfo.keyframeActions.where((keyframeAction) => keyframeAction['actionType'] == actionType.index).toList();
    if (keyframeActions.length == 0) return;

    Map<String, dynamic> keyframeAction = keyframeActions[0];
    Offset point = Offset(x, y);

    Sketch.Frame frame = layer.frame;

    if ((frame.x < x && x < frame.x + frame.width) && (frame.y < y && y < frame.y + frame.height)) {
      point = point.translate(-frame.x, -frame.y);
      if (shapePainter.hitTest(point)) {
        print("hit " + layer.doObjectID);

        if (layer.userInfo != null && layer.userInfo.keyframeActions.length > 0) {
          List keyframes = keyframeAction['keyframes'];

          if (keyframes != null) {
            keyframes.forEach((keyframe) => c.animKeyframe(keyframe));
          }
        }
      }
    }
  }
}

class ShapePainter extends CustomPainter {
  Sketch.Layer layer;
  Map imageAssets;

  ShapePainter(this.layer, this.imageAssets);

  @override
  bool hitTest(ui.Offset position) {
    Path path = getShapePath();
    path.close();
    return path.contains(position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getShapePath();
    var fills = layer.style.fills;
    var borders = layer.style.borders;
    canvas.translate(layer.frame.width * 0.5, layer.frame.height * 0.5);
    canvas.rotate((360.0 - layer.rotation) / 360.0 * pi * 2.0);
    canvas.translate(-layer.frame.width * 0.5, -layer.frame.height * 0.5);

    //shadow
    // canvas.drawPath(path.shift(offset), shadow.toPaint());

    //fills
    _drawFills(canvas, path, fills);

    //borders
    _drawBorders(canvas, path, borders);
  }

  void _drawFills(Canvas canvas, Path path, List<Sketch.Fill> fills) {
    if (fills != null) {
      for (var i = 0; i < fills.length; i++) {
        Sketch.Fill fill = fills[i];
        canvas.clipPath(path);

        BoxFit fitType;
        switch (fill.patternFillType) {
          case Sketch.PatternFillType.Fit:
            fitType = BoxFit.scaleDown;
            break;
          case Sketch.PatternFillType.Stretch:
            fitType = BoxFit.fill;
            break;
          case Sketch.PatternFillType.Fill:
          default:
            fitType = BoxFit.cover;
            break;
        }

        if (fill.image != null) {
          String imageName = fill.image.sRef;
          ui.Image image = imageAssets[imageName];
          paintImage(
            canvas: canvas,
            rect: Rect.fromLTWH(0, 0, layer.frame.width, layer.frame.height),
            image: image,
            fit: fitType,
            colorFilter:
                fill.contextSettings == null ? null : new ColorFilter.mode(Colors.black.withOpacity(fill.contextSettings.opacity), BlendMode.dstATop),
          );
        } else {
          var fillPaint = Paint()
            ..color = Color.fromARGB(
                (fill.color.alpha * 255).toInt(), (fill.color.red * 255).toInt(), (fill.color.green * 255).toInt(), (fill.color.blue * 255).toInt());

          canvas.drawPaint(fillPaint);
        }
      }
    }
  }

  void _drawBorders(Canvas canvas, Path path, List<Sketch.Border> borders) {
    if (borders != null) {
      for (var i = 0; i < borders.length; i++) {
        Sketch.Border border = borders[i];

        var fillPaint = Paint()
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = border.thickness
          ..color = Color.fromARGB((border.color.alpha * 255).toInt(), (border.color.red * 255).toInt(), (border.color.green * 255).toInt(),
              (border.color.blue * 255).toInt());

        canvas.drawPath(path, fillPaint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  Point scale(Point point, var frame, {scaledByPixel: 0}) {
    return Point(point.x * (frame.width + scaledByPixel), point.y * (frame.height + scaledByPixel));
  }

  Path getShapePath() {
    Path path = Path();

    if (layer.points != null) {
      for (var i = 0; i < layer.points.length; i++) {
        var curvePoint = layer.points[i];
        var nextCurvePoint = layer.points[(i + 1) % layer.points.length];

        int curveMode = curvePoint.curveMode;
        Point curveFrom = scale(curvePoint.curveFrom, layer.frame);
        Point curveTo = scale(nextCurvePoint.curveTo, layer.frame);
        Point point1 = scale(curvePoint.point, layer.frame);
        Point point2 = scale(nextCurvePoint.point, layer.frame);

        if (i == 0) {
          path.moveTo(point1.x, point1.y);
        }

        switch (curveMode) {
          case 1:
          case 2:
          case 3:
          case 4:
            path.cubicTo(curveFrom.x, curveFrom.y, curveTo.x, curveTo.y, point2.x, point2.y);
            break;
          default:
            path.lineTo(point1.x, point1.y);
            break;
        }
      }
    }
    return path;
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }
}
