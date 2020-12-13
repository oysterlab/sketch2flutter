import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/sketch/SketchModel.dart' as SketchModel;
import 'dart:math';
import '../../Controllers/LayerModelController.dart';

abstract class AbstractLayer extends StatelessWidget {
  final SketchModel.AbstractLayer model;
  StylePainter stylePainter;
  LayerModelController controller = Get.find();

  @protected
  Widget child;

  AbstractLayer(this.model, {StylePainter stylePainter}) {
    this.child = null;

    if (stylePainter == null) {
      this.stylePainter = StylePainter(model);
    } else {
      this.stylePainter = stylePainter;
    }
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
    return Obx(() => Visibility(
          visible: model.isVisible,
          child: Positioned(
              left: model.frame.x + model.tick * 0.0,
              top: model.frame.y,
              width: model.frame.width,
              height: model.frame.height,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: hasTapEvent ? onTap : null,
                child: Style(model: model, child: child, stylePainter: stylePainter),
              )),
        ));
  }
}

class Style extends StatelessWidget {
  Widget child;
  SketchModel.AbstractLayer model;
  StylePainter stylePainter;

  Style({SketchModel.AbstractLayer model, Widget child, StylePainter stylePainter}) {
    this.child = child;
    this.model = model;
    this.stylePainter = stylePainter;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: model.style.contextSettings.opacity,
        child: CustomPaint(key: Key(model.do_objectID + '_paint'), painter: stylePainter, child: child));
  }
}

class StylePainter extends CustomPainter {
  SketchModel.AbstractLayer model;

  StylePainter(SketchModel.AbstractLayer model) {
    this.model = model;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Color bgColor = Colors.grey[200];

    // if (model.style.fills.length > 0) {
    //   bgColor = model.style.fills[0].color.asMaterialColor();
    //   Paint fillPaint = Paint()..color = bgColor;
    //   Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    //   canvas.drawRect(rect, fillPaint);
    // }

    // var fillPaint = Paint()
    //   ..strokeCap = StrokeCap.round
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 0.2
    //   ..color = Colors.grey[400];

    // Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // canvas.drawRect(rect, fillPaint);
  }

  fills(Path path, List<SketchModel.Fill> fills, Canvas canvas) {
    fills.forEach((SketchModel.Fill fill) {
      if (!fill.isEnabled) return;

      if (fill.fillType == SketchModel.FillType.Color.index) {
        Color bgColor = fill.color.asMaterialColor();
        bgColor = bgColor.withAlpha((fill.contextSettings.opacity * 255.0).toInt());

        Paint fillPaint = Paint()..color = bgColor;
        fillPaint.blendMode = getBlendMode(fill.contextSettings.blendMode);
        canvas.drawPath(path, fillPaint);
      } else if (fill.fillType == SketchModel.FillType.Gradient.index) {
      } else if (fill.fillType == SketchModel.FillType.Pattern.index) {}
    });
  }

  getBlendMode(int sketchBlandMode) {
    if (SketchModel.BlendMode.Normal.index == sketchBlandMode) {
      return BlendMode.srcOver;
    } else if (SketchModel.BlendMode.Darken.index == sketchBlandMode) {
      return BlendMode.darken;
    } else if (SketchModel.BlendMode.Multiply.index == sketchBlandMode) {
      return BlendMode.multiply;
    } else if (SketchModel.BlendMode.ColorBurn.index == sketchBlandMode) {
      return BlendMode.colorBurn;
    } else if (SketchModel.BlendMode.Lighten.index == sketchBlandMode) {
      return BlendMode.lighten;
    } else if (SketchModel.BlendMode.Screen.index == sketchBlandMode) {
      return BlendMode.screen;
    } else if (SketchModel.BlendMode.ColorDodge.index == sketchBlandMode) {
      return BlendMode.colorDodge;
    } else if (SketchModel.BlendMode.Overlay.index == sketchBlandMode) {
      return BlendMode.overlay;
    } else if (SketchModel.BlendMode.SoftLight.index == sketchBlandMode) {
      return BlendMode.softLight;
    } else if (SketchModel.BlendMode.HardLight.index == sketchBlandMode) {
      return BlendMode.hardLight;
    } else if (SketchModel.BlendMode.Difference.index == sketchBlandMode) {
      return BlendMode.difference;
    } else if (SketchModel.BlendMode.Exclusion.index == sketchBlandMode) {
      return BlendMode.exclusion;
    } else if (SketchModel.BlendMode.Hue.index == sketchBlandMode) {
      return BlendMode.hue;
    } else if (SketchModel.BlendMode.Saturation.index == sketchBlandMode) {
      return BlendMode.saturation;
    } else if (SketchModel.BlendMode.Color.index == sketchBlandMode) {
      return BlendMode.color;
    } else if (SketchModel.BlendMode.Luminosity.index == sketchBlandMode) {
      return BlendMode.luminosity;
    } else if (SketchModel.BlendMode.PlusDarker.index == sketchBlandMode) {
      return BlendMode.plus;
    } else if (SketchModel.BlendMode.PlusLighter.index == sketchBlandMode) {
      return BlendMode.plus;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
