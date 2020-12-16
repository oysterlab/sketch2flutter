
class Blur {
  final String _class = "blur";
  bool isEnabled;
  String center;
  double motionAngle;
  double radius;
  double saturation;
  int type;

  dynamic noneFilteredValue;

  Blur();

  static setModelWithMap(Map<String, dynamic> map, Blur model) {
    model.isEnabled = map['isEnabled'];

    model.center = map['center'];

    model.motionAngle = map['motionAngle'] != null ? map['motionAngle'].toDouble() : 0.0;

    model.radius = map['radius'] != null ? map['radius'].toDouble() : 0.0;

    model.saturation = map['saturation'] != null ? map['saturation'].toDouble() : 0.0;

    model.type = map['type'];

	}

  factory Blur.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Blur model = Blur();
	  Blur.setModelWithMap(map, model);
    return model;
  }

    factory Blur.fromValue(dynamic v) {
	    Blur model = Blur();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Blur()';
  }

} 
