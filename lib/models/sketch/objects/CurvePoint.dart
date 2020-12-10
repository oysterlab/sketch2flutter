
class CurvePoint {
  final String _class = "curvePoint";
  double cornerRadius;
  String curveFrom;
  String curveTo;
  bool hasCurveFrom;
  bool hasCurveTo;
  int curveMode;
  String point;

  dynamic noneFilteredValue;

  CurvePoint();

  static setModelWithMap(Map<String, dynamic> map, CurvePoint model) {
    model.cornerRadius = map['cornerRadius'] != null ? map['cornerRadius'].toDouble() : 0.0;

    model.curveFrom = map['curveFrom'];

    model.curveTo = map['curveTo'];

    model.hasCurveFrom = map['hasCurveFrom'];

    model.hasCurveTo = map['hasCurveTo'];

    model.curveMode = map['curveMode'];

    model.point = map['point'];

	}

  factory CurvePoint.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CurvePoint model = CurvePoint();
	  CurvePoint.setModelWithMap(map, model);
    return model;
  }

    factory CurvePoint.fromValue(dynamic v) {
	    CurvePoint model = CurvePoint();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'CurvePoint()';
  }

} 
