import 'package:flutter/material.dart';
import './Sketch.dart';
import './Contants.dart' as Constants;

import '../../models/sketch/SketchModel.dart' as SketchModel;
import './SKListItem.dart';

class SKListView extends AbstractLayer {
  SKListView(SketchModel.AbstractGroup model) : super(model) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_ABSTRACTGROUP;
    SketchModel.AbstractLayer listSize = model.layers.where((layer) => layer.name == 'listSize').toList()[0];
    if (listSize != null) {
      model.frame.width = listSize.frame.width;
      model.frame.height = listSize.frame.height;

      model.layers.remove(listSize);
    }
    buildChildren();
  }

  createChildren() {
    SketchModel.AbstractGroup model = this.model;

    List<Widget> children = [];

    model.layers.forEach((layerModel) {
      children.add(new SKListItem(layerModel));
    });

    return children;
  }

  buildChildren() {
    List<Widget> children = createChildren();
    child = ListView(scrollDirection: Axis.horizontal, children: children);
  }
}
