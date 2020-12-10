import './AbstractShapeLayer.dart';

class ShapePath extends AbstractShapeLayer {
  final String _class = "shapePath";

  dynamic noneFilteredValue;

  ShapePath();

  static setModelWithMap(Map<String, dynamic> map, ShapePath model) {
    AbstractShapeLayer.setModelWithMap(map, model);

	}

  factory ShapePath.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ShapePath model = ShapePath();
	  ShapePath.setModelWithMap(map, model);
    return model;
  }

    factory ShapePath.fromValue(dynamic v) {
	    ShapePath model = ShapePath();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ShapePath()';
  }

} 
