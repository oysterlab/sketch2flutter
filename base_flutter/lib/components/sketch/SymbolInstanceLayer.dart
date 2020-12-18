import 'package:flutter/material.dart';
import 'AbstractLayer.dart';
import 'package:get/get.dart';
import '../../models/sketch/SketchModel.dart' as SketchModel;

import './Contants.dart' as Constants;

class SymbolInstanceLayer extends AbstractLayer {
  SymbolInstanceLayer(model) : super(model) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_SIMBOLINSTANCELAYER;
  }
}
