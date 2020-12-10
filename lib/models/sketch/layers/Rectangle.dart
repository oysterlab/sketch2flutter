import './AbstractShapeLayer.dart';

class Rectangle extends AbstractShapeLayer {
  final String _class = "rectangle";
  double fixedRadius;
  bool hasConvertedToNewRoundCorners;
  bool needsConvertionToNewRoundCorners;

  dynamic noneFilteredValue;

  Rectangle();

  static setModelWithMap(Map<String, dynamic> map, Rectangle model) {
    AbstractShapeLayer.setModelWithMap(map, model);

    model.fixedRadius = map['fixedRadius'] != null ? map['fixedRadius'].toDouble() : 0.0;

    model.hasConvertedToNewRoundCorners = map['hasConvertedToNewRoundCorners'];

    model.needsConvertionToNewRoundCorners = map['needsConvertionToNewRoundCorners'];

	}

  factory Rectangle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Rectangle model = Rectangle();
	  Rectangle.setModelWithMap(map, model);
    return model;
  }

    factory Rectangle.fromValue(dynamic v) {
	    Rectangle model = Rectangle();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Rectangle()';
  }

} 
