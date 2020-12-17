import 'package:flutter/material.dart';
import 'AbstractLayer.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import '../../models/sketch/SketchModel.dart' as SketchModel;

import 'package:uxcatch_flutter/components/sketch/Contants.dart' as Constants;

class BitmapLayer extends AbstractLayer {
  BitmapLayer(model) : super(model, stylePainter: BitmapStylePainter(model)) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_BITMAPLAYER;
  }
}

class BitmapStylePainter extends StylePainter {
  SketchModel.Bitmap bitmapModel;
  ui.Image image;

  BitmapStylePainter(SketchModel.AbstractLayer model) : super(model) {
    bitmapModel = (model as SketchModel.Bitmap);
    _init();
  }

  _init() async {
    String imagePath = "assets/" + bitmapModel.image.ref;

    image = await getUiImage(imagePath, bitmapModel.frame.width.toInt(), bitmapModel.frame.height.toInt());

    model.tick = 0.1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('paint ' + model.tick.toString());
    // Path path = getShapePath(size);
    // fills(path, bitmapModel.style.fills, canvas);

    if (bitmapModel.name == 'checkBitmap') {
      print(bitmapModel);
    }

    if (image != null) {
      canvas.save();
      canvas.drawImage(image, Offset(0, 0), Paint());
      canvas.translate(bitmapModel.frame.x, bitmapModel.frame.y);
      canvas.restore();
    }
  }
}
