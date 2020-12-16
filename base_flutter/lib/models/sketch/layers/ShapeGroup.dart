import './AbstractGroup.dart';

class ShapeGroup extends AbstractGroup {
  final String _class = "shapeGroup";
  int windingRule;

  dynamic noneFilteredValue;

  ShapeGroup();

  static setModelWithMap(Map<String, dynamic> map, ShapeGroup model) {
    AbstractGroup.setModelWithMap(map, model);

    model.windingRule = map['windingRule'];

	}

  factory ShapeGroup.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ShapeGroup model = ShapeGroup();
	  ShapeGroup.setModelWithMap(map, model);
    return model;
  }

    factory ShapeGroup.fromValue(dynamic v) {
	    ShapeGroup model = ShapeGroup();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ShapeGroup()';
  }

} 
