import './AbstractShapeLayer.dart';

class Polygon extends AbstractShapeLayer {
  final String _class = "polygon";
  int numberOfPoints;

  dynamic noneFilteredValue;

  Polygon();

  static setModelWithMap(Map<String, dynamic> map, Polygon model) {
    AbstractShapeLayer.setModelWithMap(map, model);

    model.numberOfPoints = map['numberOfPoints'];

	}

  factory Polygon.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Polygon model = Polygon();
	  Polygon.setModelWithMap(map, model);
    return model;
  }

    factory Polygon.fromValue(dynamic v) {
	    Polygon model = Polygon();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Polygon()';
  }

} 
