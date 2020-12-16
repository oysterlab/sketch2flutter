import './AbstractShapeLayer.dart';

class Oval extends AbstractShapeLayer {
  final String _class = "oval";

  dynamic noneFilteredValue;

  Oval();

  static setModelWithMap(Map<String, dynamic> map, Oval model) {
    AbstractShapeLayer.setModelWithMap(map, model);

	}

  factory Oval.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Oval model = Oval();
	  Oval.setModelWithMap(map, model);
    return model;
  }

    factory Oval.fromValue(dynamic v) {
	    Oval model = Oval();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Oval()';
  }

} 
