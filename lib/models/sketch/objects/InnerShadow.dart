import './Color.dart';
import './GraphicsContextSettings.dart';

class InnerShadow {
  final String _class = "innerShadow";
  bool isEnabled;
  double blurRadius;
  Color color;
  GraphicsContextSettings contextSettings;
  double offsetX;
  double offsetY;
  double spread;

  dynamic noneFilteredValue;

  InnerShadow();

  static setModelWithMap(Map<String, dynamic> map, InnerShadow model) {
    model.isEnabled = map['isEnabled'];

    model.blurRadius = map['blurRadius'] != null ? map['blurRadius'].toDouble() : 0.0;

	  if (map['color'] is Map) {
		  model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;
	  } else {
		  model.color = Color.fromValue(map['color']);
	  }

	  if (map['contextSettings'] is Map) {
		  model.contextSettings = map['contextSettings'] != null ? new GraphicsContextSettings.fromMap(map['contextSettings']) : null;
	  } else {
		  model.contextSettings = GraphicsContextSettings.fromValue(map['contextSettings']);
	  }

    model.offsetX = map['offsetX'] != null ? map['offsetX'].toDouble() : 0.0;

    model.offsetY = map['offsetY'] != null ? map['offsetY'].toDouble() : 0.0;

    model.spread = map['spread'] != null ? map['spread'].toDouble() : 0.0;

	}

  factory InnerShadow.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    InnerShadow model = InnerShadow();
	  InnerShadow.setModelWithMap(map, model);
    return model;
  }

    factory InnerShadow.fromValue(dynamic v) {
	    InnerShadow model = InnerShadow();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'InnerShadow()';
  }

} 
