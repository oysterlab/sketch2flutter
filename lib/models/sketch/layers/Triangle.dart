import './AbstractShapeLayer.dart';

class Triangle extends AbstractShapeLayer {
  final String _class = "triangle";
  bool isEquilateral;

  dynamic noneFilteredValue;

  Triangle();

  static setModelWithMap(Map<String, dynamic> map, Triangle model) {
    AbstractShapeLayer.setModelWithMap(map, model);

    model.isEquilateral = map['isEquilateral'];

	}

  factory Triangle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Triangle model = Triangle();
	  Triangle.setModelWithMap(map, model);
    return model;
  }

    factory Triangle.fromValue(dynamic v) {
	    Triangle model = Triangle();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Triangle()';
  }

} 
