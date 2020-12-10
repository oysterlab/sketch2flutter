
class Rect {
  final String _class = "rect";
  bool constrainProportions;
  double height;
  double width;
  double x;
  double y;

  dynamic noneFilteredValue;

  Rect();

  static setModelWithMap(Map<String, dynamic> map, Rect model) {
    model.constrainProportions = map['constrainProportions'];

    model.height = map['height'] != null ? map['height'].toDouble() : 0.0;

    model.width = map['width'] != null ? map['width'].toDouble() : 0.0;

    model.x = map['x'] != null ? map['x'].toDouble() : 0.0;

    model.y = map['y'] != null ? map['y'].toDouble() : 0.0;

	}

  factory Rect.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Rect model = Rect();
	  Rect.setModelWithMap(map, model);
    return model;
  }

    factory Rect.fromValue(dynamic v) {
	    Rect model = Rect();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Rect()';
  }

} 
