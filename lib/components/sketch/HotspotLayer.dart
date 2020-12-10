import 'package:flutter/material.dart';
import 'AbstractLayer.dart';
import 'package:get/get.dart';
import '../../models/sketch/SketchModel.dart' as SketchModel;

import 'package:uxcatch_flutter/components/sketch/Contants.dart' as Constants;

class HotspotLayer extends AbstractLayer {
  HotspotLayer(model) : super(model) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_HOTSPOTLAYER;
  }
}
