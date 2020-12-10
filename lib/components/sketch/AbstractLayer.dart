import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/sketch/SketchModel.dart' as SketchModel;
import 'dart:math';
import '../../Controllers/LayerModelController.dart';

abstract class AbstractLayer extends StatelessWidget {
  final SketchModel.AbstractLayer model;
  LayerModelController controller = Get.find();

  @protected
  Widget childWidget;

  AbstractLayer(this.model) {
    childWidget = null;
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
    return Obx(() => Positioned(
        left: model.frame.x + model.tick * 0.0,
        top: model.frame.y,
        width: model.frame.width,
        height: model.frame.height,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: hasTapEvent ? onTap : null,
          child: Container(
            child: childWidget,
            decoration: BoxDecoration(color: model.wireframeColor.asMaterialColor(), border: Border.all(color: Colors.black)),
          ),
        )));
  }
}
