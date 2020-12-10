import 'package:flutter/material.dart';
import '../../models/sketch/SketchModel.dart' as SketchModel;
import './AbstractLayer.dart';
import './AbstractShapeLayer.dart';

class AbstractGroup extends AbstractLayer {
  AbstractGroup(SketchModel.AbstractGroup model) : super(model) {
    createChildren();
  }

  createChildren() {
    SketchModel.AbstractGroup model = this.model;

    List<Widget> children = [];

    model.layers.forEach((layerModel) {
      if (layerModel is SketchModel.AbstractGroup) {
        children.add(new AbstractGroup(layerModel));
      } else if (layerModel is SketchModel.AbstractShapeLayer) {
        children.add(new AbstractShapeLayer(layerModel));
      }
    });

    childWidget = Stack(
      children: children,
    );
  }
}
