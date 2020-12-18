import 'package:flutter/material.dart';
import 'AbstractLayer.dart';
import 'package:get/get.dart';
import '../../models/sketch/SketchModel.dart' as SketchModel;

import './AbstractGroup.dart';
import './Contants.dart' as Constants;

class SKListItem extends AbstractGroup {
  SKListItem(SketchModel.AbstractGroup model) : super(model) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_ABSTRACTGROUP;
    buildChildren();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: model.frame.width + model.tick * 0.0,
      height: model.frame.height,
      child: Style(model: model, child: child, stylePainter: stylePainter),
    );
  }
}
