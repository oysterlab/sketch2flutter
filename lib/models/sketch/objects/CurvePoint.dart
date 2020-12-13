import 'dart:math' as Math;

Math.Point parseSketchPointToPoint(String sketchPoint) {
  var point = sketchPoint.replaceAll('{', '').replaceAll('}', '').split(',');

  return Math.Point(double.parse(point[0]), double.parse(point[1]));
}

class CurvePoint {
  final String _class = "curvePoint";
  double cornerRadius;
  Math.Point curveFrom;
  Math.Point curveTo;
  bool hasCurveFrom;
  bool hasCurveTo;
  int curveMode;
  Math.Point point;

  dynamic noneFilteredValue;

  CurvePoint();

  static setModelWithMap(Map<String, dynamic> map, CurvePoint model) {
    model.cornerRadius = map['cornerRadius'] != null ? map['cornerRadius'].toDouble() : 0.0;

    model.curveFrom = map['curveFrom'].runtimeType == String ? parseSketchPointToPoint(map['curveFrom']) : map['curveFrom'];

    model.curveTo = map['curveTo'].runtimeType == String ? parseSketchPointToPoint(map['curveTo']) : map['curveTo'];

    model.hasCurveFrom = map['hasCurveFrom'];

    model.hasCurveTo = map['hasCurveTo'];

    model.curveMode = map['curveMode'];

    model.point = map['point'].runtimeType == String ? parseSketchPointToPoint(map['point']) : map['point'];
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
    return {};
  }

  @override
  String toString() {
    return 'CurvePoint()';
  }
}
