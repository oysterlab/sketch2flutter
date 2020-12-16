import './GradientStop.dart';

class Gradient {
  final String _class = "gradient";
  int gradientType;
  double elipseLength;
  String from;
  String to;
  List stops;

  dynamic noneFilteredValue;

  Gradient();

  static setModelWithMap(Map<String, dynamic> map, Gradient model) {
    model.gradientType = map['gradientType'];

    model.elipseLength = map['elipseLength'] != null ? map['elipseLength'].toDouble() : 0.0;

    model.from = map['from'];

    model.to = map['to'];

    if (map['stops'] != null) {
       model.stops = map['stops'].map((d) => new GradientStop.fromMap(d)).toList();
    }

	}

  factory Gradient.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Gradient model = Gradient();
	  Gradient.setModelWithMap(map, model);
    return model;
  }

    factory Gradient.fromValue(dynamic v) {
	    Gradient model = Gradient();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Gradient()';
  }

} 
