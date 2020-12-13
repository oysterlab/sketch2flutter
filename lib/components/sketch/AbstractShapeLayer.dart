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
}
