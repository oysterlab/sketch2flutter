import './AbstractLayer.dart';
import '../objects/Color.dart';

class Slice extends AbstractLayer {
  final String _class = "slice";
  bool hasBackgroundColor;
  Color backgroundColor;

  dynamic noneFilteredValue;

  Slice();

  static setModelWithMap(Map<String, dynamic> map, Slice model) {
    AbstractLayer.setModelWithMap(map, model);

    model.hasBackgroundColor = map['hasBackgroundColor'];

	  if (map['backgroundColor'] is Map) {
		  model.backgroundColor = map['backgroundColor'] != null ? new Color.fromMap(map['backgroundColor']) : null;
	  } else {
		  model.backgroundColor = Color.fromValue(map['backgroundColor']);
	  }

	}

  factory Slice.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Slice model = Slice();
	  Slice.setModelWithMap(map, model);
    return model;
  }

    factory Slice.fromValue(dynamic v) {
	    Slice model = Slice();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Slice()';
  }

} 
