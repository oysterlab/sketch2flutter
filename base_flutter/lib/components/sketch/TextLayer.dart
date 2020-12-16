import 'package:flutter/material.dart';
import 'AbstractLayer.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import '../../models/sketch/SketchModel.dart' as SketchModel;

import 'package:uxcatch_flutter/components/sketch/Contants.dart' as Constants;

class TextLayer extends AbstractLayer {
  TextLayer(model) : super(model, stylePainter: TextStylePainter(model)) {
    model.wireframeColor = Constants.WIREFRAME_COLOR_TEXTLAYER;
  }
}

class TextStylePainter extends StylePainter {
  SketchModel.Text textModel;
  ui.ParagraphStyle paragraphStyle;
  ui.ParagraphBuilder paragraphBuilder;
  ui.Paragraph paragraph;

  TextStylePainter(SketchModel.AbstractLayer model) : super(model) {
    textModel = (model as SketchModel.Text);

    buildParagraph();
  }

  _getTextAlign(alignment) {
    if (alignment == null) {
      alignment = 0;
    }

    if (alignment == 0) {
      return TextAlign.left;
    } else if (alignment == 1) {
      return TextAlign.right;
    } else if (alignment == 2) {
      return TextAlign.center;
    } else if (alignment == 3) {
      return TextAlign.justify;
    }
  }

  _getTextStyles() {
    List<Map> textStyles = [];

    String fullText = textModel.attributedString.string;

    if (textModel.attributedString.attributes.length > 1) {
      print(textModel);
    }

    textModel.attributedString.attributes.forEach((element) {
      SketchModel.StringAttribute strAttr = element as SketchModel.StringAttribute;
      Color fontColor = strAttr.attributes.MSAttributedStringColorAttribute.asMaterialColor();
      double fontSize = strAttr.attributes.MSAttributedStringFontAttribute.attributes.size;
      String fontName = strAttr.attributes.MSAttributedStringFontAttribute.attributes.name;

      String text = fullText.substring(strAttr.location, strAttr.location + strAttr.length);

      ui.TextStyle textStyle = ui.TextStyle(color: fontColor, fontSize: fontSize);

      textStyles.add({"text": text, "textStyle": textStyle});
    });

    return textStyles;
  }

  buildParagraph() {
    SketchModel.TextStyle textStyleModel = textModel.style.textStyle;
    double fontSize = textStyleModel.encodedAttributes.MSAttributedStringFontAttribute.attributes.size;
    String fontFamilyName = textStyleModel.encodedAttributes.MSAttributedStringFontAttribute.attributes.name;

    Color fontColor = textStyleModel.encodedAttributes.MSAttributedStringColorAttribute.asMaterialColor();

    paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
      fontFamily: 'Helvetica',
      textAlign: _getTextAlign(textStyleModel.encodedAttributes.paragraphStyle.alignment),
    );

    paragraphBuilder = ui.ParagraphBuilder(paragraphStyle);

    _getTextStyles().forEach((textStyleSet) {
      ui.TextStyle textStyle = textStyleSet['textStyle'];
      String text = textStyleSet['text'];

      paragraphBuilder.pushStyle(textStyle);
      paragraphBuilder.addText(text);
    });

    paragraph = paragraphBuilder.build();

    ui.ParagraphConstraints constraints = ui.ParagraphConstraints(width: textModel.frame.width);
    paragraph.layout(constraints);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset offset = Offset(0, 0);
    Paint fillPaint = Paint();
    fillPaint.color = Colors.blue[400].withAlpha(100);

    canvas.drawParagraph(paragraph, offset);
  }
}
