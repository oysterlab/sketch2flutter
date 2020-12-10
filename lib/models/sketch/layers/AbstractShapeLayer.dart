import './AbstractLayer.dart';
import '../objects/CurvePoint.dart';

class AbstractShapeLayer extends AbstractLayer {
  bool edited;
  bool isClosed;
  int pointRadiusBehaviour;
  List points;

  dynamic noneFilteredValue;

  AbstractShapeLayer();

  static setModelWithMap(Map<String, dynamic> map, AbstractShapeLayer model) {
    AbstractLayer.setModelWithMap(map, model);

    model.edited = map['edited'];

    model.isClosed = map['isClosed'];

    model.pointRadiusBehaviour = map['pointRadiusBehaviour'];

    if (map['points'] != null) {
       model.points = map['points'].map((d) => new CurvePoint.fromMap(d)).toList();
    }

	}

  factory AbstractShapeLayer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AbstractShapeLayer model = AbstractShapeLayer();
	  AbstractShapeLayer.setModelWithMap(map, model);
    return model;
  }

    factory AbstractShapeLayer.fromValue(dynamic v) {
	    AbstractShapeLayer model = AbstractShapeLayer();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AbstractShapeLayer()';
  }

} 
