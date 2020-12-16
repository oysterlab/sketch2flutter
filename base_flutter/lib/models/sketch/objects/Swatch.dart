import './Color.dart';

class Swatch {
  final String _class = "swatch";
  String do_objectID;
  String name;
  Color value;

  dynamic noneFilteredValue;

  Swatch();

  static setModelWithMap(Map<String, dynamic> map, Swatch model) {
    model.do_objectID = map['do_objectID'];

    model.name = map['name'];

	  if (map['value'] is Map) {
		  model.value = map['value'] != null ? new Color.fromMap(map['value']) : null;
	  } else {
		  model.value = Color.fromValue(map['value']);
	  }

	}

  factory Swatch.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Swatch model = Swatch();
	  Swatch.setModelWithMap(map, model);
    return model;
  }

    factory Swatch.fromValue(dynamic v) {
	    Swatch model = Swatch();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Swatch()';
  }

} 
