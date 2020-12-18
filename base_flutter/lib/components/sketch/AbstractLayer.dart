import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/sketch/SketchModel.dart' as SketchModel;
import 'dart:math';
import '../../Controllers/LayerModelController.dart';
import "dart:math" show pi;
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'dart:ui' as ui;
import 'package:image/image.dart' as IMG;
import 'package:flutter/services.dart' show rootBundle;

abstract class AbstractLayer extends StatelessWidget {
  final SketchModel.AbstractLayer model;
  StylePainter stylePainter;
  LayerModelController controller = Get.find();

  @protected
  Widget child;

  AbstractLayer(this.model, {StylePainter stylePainter}) {
    this.child = null;

    if (stylePainter == null) {
      this.stylePainter = StylePainter(model);
    } else {
      this.stylePainter = stylePainter;
    }
  }

  @protected
  onTap() {
    String artboardId = model.flow.destinationArtboardID;

    SketchModel.Artboard artboard = controller.layers[artboardId];
    var rand = new Random();
    if (artboard != null) {
      SketchModel.Artboard prevArtboard = controller.layers[controller.currentArtboarId];
      prevArtboard.tick = rand.nextDouble();
      prevArtboard.frame.x = prevArtboard.frame.width * 4;
      prevArtboard.frame.y = 0;

      controller.currentArtboarId = artboard.do_objectID;

      artboard.tick = rand.nextDouble();
      artboard.frame.x = 0;
      artboard.frame.y = 0;
    }
  }

  get hasTapEvent {
    return model.flow.destinationArtboardID != null;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: model.isVisible,
          child: Positioned(
              left: model.frame.x + model.tick * 0.0,
              top: model.frame.y,
              width: model.frame.width,
              height: model.frame.height,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: hasTapEvent ? onTap : null,
                child: Style(model: model, child: child, stylePainter: stylePainter),
              )),
        ));
  }
}

class Style extends StatelessWidget {
  Widget child;
  SketchModel.AbstractLayer model;
  StylePainter stylePainter;

  Style({SketchModel.AbstractLayer model, Widget child, StylePainter stylePainter}) {
    this.child = child;
    this.model = model;
    this.stylePainter = stylePainter;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: model.style.contextSettings.opacity,
        child: CustomPaint(key: Key(model.do_objectID + '_paint'), painter: stylePainter, child: child));
  }
}

class StylePainter extends CustomPainter {
  SketchModel.AbstractLayer model;

  StylePainter(SketchModel.AbstractLayer model) {
    this.model = model;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Color bgColor = Colors.grey[200];

    // if (model.style.fills.length > 0) {
    //   bgColor = model.style.fills[0].color.asMaterialColor();
    //   Paint fillPaint = Paint()..color = bgColor;
    //   Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    //   canvas.drawRect(rect, fillPaint);
    // }

    // var fillPaint = Paint()
    //   ..strokeCap = StrokeCap.round
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 0.2
    //   ..color = Colors.grey[400];

    // Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // canvas.drawRect(rect, fillPaint);
  }

  fills(Path path, List<SketchModel.Fill> fills, Canvas canvas) {
    fills.forEach((SketchModel.Fill fill) {
      if (!fill.isEnabled) return;

      if (fill.fillType == SketchModel.FillType.Color.index) {
        Color bgColor = fill.color.asMaterialColor();
        bgColor = bgColor.withAlpha((fill.contextSettings.opacity * 255.0).toInt());

        Paint fillPaint = Paint()..color = bgColor;
        fillPaint.blendMode = getBlendMode(fill.contextSettings.blendMode);
        canvas.drawPath(path, fillPaint);
      } else if (fill.fillType == SketchModel.FillType.Gradient.index) {
      } else if (fill.fillType == SketchModel.FillType.Pattern.index) {}
    });
  }

  Path getShapePath(Size size, {SketchModel.AbstractShapeLayer shapeModel = null}) {
    Path path = Path();

    if (shapeModel == null) {
      shapeModel = model as SketchModel.AbstractShapeLayer;
    }

    List<SketchModel.CurvePoint> points = shapeModel.points;

    if (points != null) {
      for (var i = 0; i < points.length; i++) {
        var curvePoint = points[i];
        var nextCurvePoint = points[(i + 1) % points.length];

        int curveMode = curvePoint.curveMode;

        Point curveFrom = scale(curvePoint.curveFrom, size);
        Point curveTo = scale(nextCurvePoint.curveTo, size);
        Point point1 = scale(curvePoint.point, size);
        Point point2 = scale(nextCurvePoint.point, size);

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

    if (model.name == 'Rectangle 3') {
      print(model);
    }

    double rotation = shapeModel.rotation / 180.0 * pi;

    Vector3 p2 = Vector3(shapeModel.frame.width * 0.5, shapeModel.frame.height * 0.5, 1.0);

    path = path.transform(Matrix4.translation(-p2).storage);

    path = path.transform(Matrix4.rotationZ(rotation).storage);

    if (shapeModel.isFlippedHorizontal) {
      path = path.transform(Matrix4.rotationY(pi).storage);
    }

    if (shapeModel.isFlippedVertical) {
      path = path.transform(Matrix4.rotationX(pi).storage);
    }

    path = path.transform(Matrix4.translation(p2).storage);

    path.close();

    return path;
  }

  Point scale(Point point, Size size, {scaledByPixel: 0}) {
    return Point(point.x * (size.width + scaledByPixel), point.y * (size.height + scaledByPixel));
  }

  Future<ui.Image> getUiImage(String imageAssetPath, int width, int height) async {
    final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
    IMG.Image baseSizeImage = IMG.decodeImage(assetImageByteData.buffer.asUint8List());
    IMG.Image resizeImage = IMG.copyResize(baseSizeImage, height: height, width: width, interpolation: IMG.Interpolation.linear);
    ui.Codec codec = await ui.instantiateImageCodec(IMG.encodePng(resizeImage));
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  getBlendMode(int sketchBlandMode) {
    if (SketchModel.BlendMode.Normal.index == sketchBlandMode) {
      return BlendMode.srcOver;
    } else if (SketchModel.BlendMode.Darken.index == sketchBlandMode) {
      return BlendMode.darken;
    } else if (SketchModel.BlendMode.Multiply.index == sketchBlandMode) {
      return BlendMode.multiply;
    } else if (SketchModel.BlendMode.ColorBurn.index == sketchBlandMode) {
      return BlendMode.colorBurn;
    } else if (SketchModel.BlendMode.Lighten.index == sketchBlandMode) {
      return BlendMode.lighten;
    } else if (SketchModel.BlendMode.Screen.index == sketchBlandMode) {
      return BlendMode.screen;
    } else if (SketchModel.BlendMode.ColorDodge.index == sketchBlandMode) {
      return BlendMode.colorDodge;
    } else if (SketchModel.BlendMode.Overlay.index == sketchBlandMode) {
      return BlendMode.overlay;
    } else if (SketchModel.BlendMode.SoftLight.index == sketchBlandMode) {
      return BlendMode.softLight;
    } else if (SketchModel.BlendMode.HardLight.index == sketchBlandMode) {
      return BlendMode.hardLight;
    } else if (SketchModel.BlendMode.Difference.index == sketchBlandMode) {
      return BlendMode.difference;
    } else if (SketchModel.BlendMode.Exclusion.index == sketchBlandMode) {
      return BlendMode.exclusion;
    } else if (SketchModel.BlendMode.Hue.index == sketchBlandMode) {
      return BlendMode.hue;
    } else if (SketchModel.BlendMode.Saturation.index == sketchBlandMode) {
      return BlendMode.saturation;
    } else if (SketchModel.BlendMode.Color.index == sketchBlandMode) {
      return BlendMode.color;
    } else if (SketchModel.BlendMode.Luminosity.index == sketchBlandMode) {
      return BlendMode.luminosity;
    } else if (SketchModel.BlendMode.PlusDarker.index == sketchBlandMode) {
      return BlendMode.plus;
    } else if (SketchModel.BlendMode.PlusLighter.index == sketchBlandMode) {
      return BlendMode.plus;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
