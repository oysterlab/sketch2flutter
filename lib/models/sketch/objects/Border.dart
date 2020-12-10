import './Color.dart';
import './GraphicsContextSettings.dart';
import './Gradient.dart';

class Border {
  final String _class = "border";
  bool isEnabled;
  Color color;
  int fillType;
  int position;
  double thickness;
  GraphicsContextSettings contextSettings;
  Gradient gradient;

  dynamic noneFilteredValue;

  Border();

  static setModelWithMap(Map<String, dynamic> map, Border model) {
    model.isEnabled = map['isEnabled'];

	  if (map['color'] is Map) {
		  model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;
	  } else {
		  model.color = Color.fromValue(map['color']);
	  }

    model.fillType = map['fillType'];

    model.position = map['position'];

    model.thickness = map['thickness'] != null ? map['thickness'].toDouble() : 0.0;

	  if (map['contextSettings'] is Map) {
		  model.contextSettings = map['contextSettings'] != null ? new GraphicsContextSettings.fromMap(map['contextSettings']) : null;
	  } else {
		  model.contextSettings = GraphicsContextSettings.fromValue(map['contextSettings']);
	  }

	  if (map['gradient'] is Map) {
		  model.gradient = map['gradient'] != null ? new Gradient.fromMap(map['gradient']) : null;
	  } else {
		  model.gradient = Gradient.fromValue(map['gradient']);
	  }

	}

  factory Border.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Border model = Border();
	  Border.setModelWithMap(map, model);
    return model;
  }

    factory Border.fromValue(dynamic v) {
	    Border model = Border();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Border()';
  }

} 
