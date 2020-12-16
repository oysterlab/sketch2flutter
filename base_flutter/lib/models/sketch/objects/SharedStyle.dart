import './Style.dart';

class SharedStyle {
  final String _class = "sharedStyle";
  String do_objectID;
  String name;
  Style value;

  dynamic noneFilteredValue;

  SharedStyle();

  static setModelWithMap(Map<String, dynamic> map, SharedStyle model) {
    model.do_objectID = map['do_objectID'];

    model.name = map['name'];

	  if (map['value'] is Map) {
		  model.value = map['value'] != null ? new Style.fromMap(map['value']) : null;
	  } else {
		  model.value = Style.fromValue(map['value']);
	  }

	}

  factory SharedStyle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SharedStyle model = SharedStyle();
	  SharedStyle.setModelWithMap(map, model);
    return model;
  }

    factory SharedStyle.fromValue(dynamic v) {
	    SharedStyle model = SharedStyle();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SharedStyle()';
  }

} 
