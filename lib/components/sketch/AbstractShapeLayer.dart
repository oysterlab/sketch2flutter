import 'package:flutter/material.dart';
import '../sketch/AbstractLayer.dart';
import 'dart:math';
import '../../models/sketch/SketchModel.dart' as SketchModel;

import 'package:uxcatch_flutter/components/sketch/Contants.dart' as Constants;

class AbstractShapeLayer extends AbstractLayer {
  AbstractShapeLayer(model) : super(model) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_ABSTRACTSHAPELAYER;
    stylePainter = ShapeStylePainter(model);
  }
}

class ShapeStylePainter extends StylePainter {
  ShapeStylePainter(SketchModel.AbstractLayer model) : super(model);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getShapePath(size);

    fills(path, model.style.fills, canvas);
  }

  Point scale(Point point, Size size, {scaledByPixel: 0}) {
    return Point(point.x * (size.width + scaledByPixel), point.y * (size.height + scaledByPixel));
  }

  Path getShapePath(Size size) {
    Path path = Path();
    SketchModel.AbstractShapeLayer shapeModel = model as SketchModel.AbstractShapeLayer;
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
    path.close();
    return path;
  }
}
