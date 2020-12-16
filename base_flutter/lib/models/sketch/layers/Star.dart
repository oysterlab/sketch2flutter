import './AbstractShapeLayer.dart';

class Star extends AbstractShapeLayer {
  final String _class = "star";
  int numberOfPoints;
  double radius;

  dynamic noneFilteredValue;

  Star();

  static setModelWithMap(Map<String, dynamic> map, Star model) {
    AbstractShapeLayer.setModelWithMap(map, model);

    model.numberOfPoints = map['numberOfPoints'];

    model.radius = map['radius'] != null ? map['radius'].toDouble() : 0.0;

	}

  factory Star.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Star model = Star();
	  Star.setModelWithMap(map, model);
    return model;
  }

    factory Star.fromValue(dynamic v) {
	    Star model = Star();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Star()';
  }

} 
