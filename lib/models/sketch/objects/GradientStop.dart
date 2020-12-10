import './Color.dart';

class GradientStop {
  final String _class = "gradientStop";
  Color color;
  double position;

  dynamic noneFilteredValue;

  GradientStop();

  static setModelWithMap(Map<String, dynamic> map, GradientStop model) {
	  if (map['color'] is Map) {
		  model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;
	  } else {
		  model.color = Color.fromValue(map['color']);
	  }

    model.position = map['position'].toDouble();

	}

  factory GradientStop.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GradientStop model = GradientStop();
	  GradientStop.setModelWithMap(map, model);
    return model;
  }

    factory GradientStop.fromValue(dynamic v) {
	    GradientStop model = GradientStop();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'GradientStop()';
  }

} 
