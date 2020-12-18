import 'package:flutter/material.dart';
import './Sketch.dart';
import './Contants.dart' as Constants;

import '../../models/sketch/SketchModel.dart' as SketchModel;
import 'AbstractGroup.dart';

class ShapeGroup extends AbstractGroup {
  ShapeGroup(SketchModel.AbstractGroup model) : super(model) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_ABSTRACTGROUP;
    stylePainter = ShapeGroupStylePainter(model);
  }
}

class ShapeGroupStylePainter extends StylePainter {
  ShapeGroupStylePainter(SketchModel.AbstractLayer model) : super(model);

  Path getChildCombinedPath() {
    List<Path> paths = [];
    _getChildPath((model as SketchModel.ShapeGroup), paths);

    if (model.name == 'loc-check') {
      print(model);
    }

    Path path = Path();
    // path.addRect(Rect.fromLTWH(0, 0, model.frame.width, model.frame.height));

    for (int i = 0; i < paths.length; i++) {
      path = Path.combine(PathOperation.xor, path, paths[i]);
    }

    return path;
  }

  _getChildPath(SketchModel.ShapeGroup m, List<Path> paths) {
    m.layers.forEach((item) {
      if (item is SketchModel.AbstractGroup) {
        SketchModel.ShapeGroup shapeGroupLayer = item as SketchModel.ShapeGroup;
        _getChildPath(shapeGroupLayer, paths);
      } else {
        SketchModel.AbstractLayer shapeLayer = item as SketchModel.AbstractLayer;
        Size size = Size(shapeLayer.frame.width, shapeLayer.frame.height);
        Path path = Path();

        path.addPath(getShapePath(size, shapeModel: shapeLayer), Offset(shapeLayer.frame.x, shapeLayer.frame.y));
        path.close();
        paths.add(path);
      }
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    // _drawAllPathForDebug(canvas, size);

    Path path = getChildCombinedPath();
    fills(path, model.style.fills, canvas);
  }

  _drawAllPathForDebug(Canvas canvas, Size size) {
    List<Path> paths = [];
    _getChildPath((model as SketchModel.ShapeGroup), paths);

    if (model.name == 'loc-check') {
      print(model);
    }

    for (int i = 0; i < paths.length; i++) {
      Path path = paths[i];

      final paint = Paint();
      if (i == 0) {
        paint.color = Colors.blue[100];
      } else if (i == 1) {
        paint.color = Colors.blue[300];
      } else if (i == 2) {
        paint.color = Colors.blue[500];
      } else {
        paint.color = Colors.blue[700];
      }

      canvas.drawPath(
        path,
        paint,
      );
    }
  }
}
