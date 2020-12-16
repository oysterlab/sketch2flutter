import './ParagraphStyle.dart';
import './FontDescriptor.dart';
import './Color.dart';

class TextStyle {
  final String _class = "textStyle";
  int verticalAlignment;
  TextStyle_EncodedAttributes encodedAttributes;

  dynamic noneFilteredValue;

  TextStyle();

  static setModelWithMap(Map<String, dynamic> map, TextStyle model) {
    model.verticalAlignment = map['verticalAlignment'];
    if (map['encodedAttributes'] != null) {
      model.encodedAttributes = TextStyle_EncodedAttributes.fromMap(map['encodedAttributes']);
    }

	}

  factory TextStyle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    TextStyle model = TextStyle();
	  TextStyle.setModelWithMap(map, model);
    return model;
  }

    factory TextStyle.fromValue(dynamic v) {
	    TextStyle model = TextStyle();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'TextStyle()';
  }

} 
class TextStyle_EncodedAttributes {
  ParagraphStyle paragraphStyle;
  int MSAttributedStringTextTransformAttribute;
  int underlineStyle;
  final String strikethroughStyle = "0";
  double kerning;
  FontDescriptor MSAttributedStringFontAttribute;
  int textStyleVerticalAlignmentKey;
  Color MSAttributedStringColorAttribute;

  dynamic noneFilteredValue;

  TextStyle_EncodedAttributes();

  static setModelWithMap(Map<String, dynamic> map, TextStyle_EncodedAttributes model) {
	  if (map['paragraphStyle'] is Map) {
		  model.paragraphStyle = map['paragraphStyle'] != null ? new ParagraphStyle.fromMap(map['paragraphStyle']) : null;
	  } else {
		  model.paragraphStyle = ParagraphStyle.fromValue(map['paragraphStyle']);
	  }

    model.MSAttributedStringTextTransformAttribute = map['MSAttributedStringTextTransformAttribute'];

    model.underlineStyle = map['underlineStyle'];

    model.kerning = map['kerning'] != null ? map['kerning'].toDouble() : 0.0;

	  if (map['MSAttributedStringFontAttribute'] is Map) {
		  model.MSAttributedStringFontAttribute = map['MSAttributedStringFontAttribute'] != null ? new FontDescriptor.fromMap(map['MSAttributedStringFontAttribute']) : null;
	  } else {
		  model.MSAttributedStringFontAttribute = FontDescriptor.fromValue(map['MSAttributedStringFontAttribute']);
	  }

    model.textStyleVerticalAlignmentKey = map['textStyleVerticalAlignmentKey'];

	  if (map['MSAttributedStringColorAttribute'] is Map) {
		  model.MSAttributedStringColorAttribute = map['MSAttributedStringColorAttribute'] != null ? new Color.fromMap(map['MSAttributedStringColorAttribute']) : null;
	  } else {
		  model.MSAttributedStringColorAttribute = Color.fromValue(map['MSAttributedStringColorAttribute']);
	  }

	}

  factory TextStyle_EncodedAttributes.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    TextStyle_EncodedAttributes model = TextStyle_EncodedAttributes();
	  TextStyle_EncodedAttributes.setModelWithMap(map, model);
    return model;
  }

    factory TextStyle_EncodedAttributes.fromValue(dynamic v) {
	    TextStyle_EncodedAttributes model = TextStyle_EncodedAttributes();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'TextStyle_EncodedAttributes()';
  }

} 
