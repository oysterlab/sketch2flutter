import './BorderOptions.dart';
import './Blur.dart';
import './TextStyle.dart';
import './GraphicsContextSettings.dart';
import './ColorControls.dart';
import './Border.dart';
import './Fill.dart';
import './Shadow.dart';
import './InnerShadow.dart';

class Style {
  final String _class = "style";
  String do_objectID;
  List borders;
  BorderOptions borderOptions;
  Blur blur;
  List fills;
  int startMarkerType;
  int endMarkerType;
  int miterLimit;
  int windingRule;
  TextStyle textStyle;
  List shadows;
  List innerShadows;
  GraphicsContextSettings contextSettings;
  ColorControls colorControls;

  dynamic noneFilteredValue;

  Style();

  static setModelWithMap(Map<String, dynamic> map, Style model) {
    model.do_objectID = map['do_objectID'];

    if (map['borders'] != null) {
       model.borders = map['borders'].map((d) => new Border.fromMap(d)).toList();
    }

	  if (map['borderOptions'] is Map) {
		  model.borderOptions = map['borderOptions'] != null ? new BorderOptions.fromMap(map['borderOptions']) : null;
	  } else {
		  model.borderOptions = BorderOptions.fromValue(map['borderOptions']);
	  }

	  if (map['blur'] is Map) {
		  model.blur = map['blur'] != null ? new Blur.fromMap(map['blur']) : null;
	  } else {
		  model.blur = Blur.fromValue(map['blur']);
	  }

    if (map['fills'] != null) {
       model.fills = map['fills'].map((d) => new Fill.fromMap(d)).toList();
    }

    model.startMarkerType = map['startMarkerType'];

    model.endMarkerType = map['endMarkerType'];

    model.miterLimit = map['miterLimit'];

    model.windingRule = map['windingRule'];

	  if (map['textStyle'] is Map) {
		  model.textStyle = map['textStyle'] != null ? new TextStyle.fromMap(map['textStyle']) : null;
	  } else {
		  model.textStyle = TextStyle.fromValue(map['textStyle']);
	  }

    if (map['shadows'] != null) {
       model.shadows = map['shadows'].map((d) => new Shadow.fromMap(d)).toList();
    }

    if (map['innerShadows'] != null) {
       model.innerShadows = map['innerShadows'].map((d) => new InnerShadow.fromMap(d)).toList();
    }

	  if (map['contextSettings'] is Map) {
		  model.contextSettings = map['contextSettings'] != null ? new GraphicsContextSettings.fromMap(map['contextSettings']) : null;
	  } else {
		  model.contextSettings = GraphicsContextSettings.fromValue(map['contextSettings']);
	  }

	  if (map['colorControls'] is Map) {
		  model.colorControls = map['colorControls'] != null ? new ColorControls.fromMap(map['colorControls']) : null;
	  } else {
		  model.colorControls = ColorControls.fromValue(map['colorControls']);
	  }

	}

  factory Style.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Style model = Style();
	  Style.setModelWithMap(map, model);
    return model;
  }

    factory Style.fromValue(dynamic v) {
	    Style model = Style();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Style()';
  }

} 
