import 'package:flutter/material.dart';
import './Sketch.dart';
import './Contants.dart' as Constants;

import '../../models/sketch/SketchModel.dart' as SketchModel;
import './AbstractLayer.dart';
import './AbstractShapeLayer.dart';
import './TextLayer.dart';
import './BitmapLayer.dart';
import './ShapeGroup.dart';
import './SKListView.dart';

class AbstractGroup extends AbstractLayer {
  AbstractGroup(SketchModel.AbstractGroup model) : super(model) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_ABSTRACTGROUP;

    buildChildren();
  }

  @protected
  buildChildren() {
    child = Stack(
      children: createChildren(),
    );
  }

  @protected
  createChildren() {
    SketchModel.AbstractGroup model = this.model;

    List<Widget> children = [];

    model.layers.forEach((layerModel) {
      if (layerModel is SketchModel.AbstractGroup) {
        if (layerModel.name == 'ListView') {
          children.add(new SKListView(layerModel));
        } else if (layerModel is SketchModel.ShapeGroup) {
          children.add(new ShapeGroup(layerModel));
        } else {
          children.add(new AbstractGroup(layerModel));
        }
      } else if (layerModel is SketchModel.AbstractShapeLayer) {
        children.add(new AbstractShapeLayer(layerModel));
      } else if (layerModel is SketchModel.Text) {
        children.add(new TextLayer(layerModel));
      } else if (layerModel is SketchModel.Bitmap) {
        children.add(new BitmapLayer(layerModel));
      } else if (layerModel is SketchModel.SymbolInstance) {
        children.add(new SymbolInstanceLayer(layerModel));
      } else if (layerModel is SketchModel.Hotspot) {
        children.add(new HotspotLayer(layerModel));
      } else if (layerModel is SketchModel.Slice) {
        children.add(new SliceLayer(layerModel));
      }
    });

    return children;
  }
}
