import 'package:flutter/material.dart';

abstract class AbstractLayer extends StatelessWidget {
  final dynamic model;

  @protected
  Widget childWidget;

  AbstractLayer(this.model) {
    childWidget = null;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: model.frame.x,
      top: model.frame.y,
      width: model.frame.width,
      height: model.frame.height,
      child: Container(
        child: childWidget,
        decoration: BoxDecoration(color: Colors.grey[400], border: Border.all(color: Colors.black)),
      ),
    );
  }
}
