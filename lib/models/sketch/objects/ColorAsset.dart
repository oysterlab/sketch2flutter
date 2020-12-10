import './Color.dart';

class ColorAsset {
  final String _class = "MSImmutableColorAsset";
  String do_objectID;
  String name;
  Color color;

  dynamic noneFilteredValue;

  ColorAsset();

  static setModelWithMap(Map<String, dynamic> map, ColorAsset model) {
    model.do_objectID = map['do_objectID'];

    model.name = map['name'];

	  if (map['color'] is Map) {
		  model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;
	  } else {
		  model.color = Color.fromValue(map['color']);
	  }

	}

  factory ColorAsset.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ColorAsset model = ColorAsset();
	  ColorAsset.setModelWithMap(map, model);
    return model;
  }

    factory ColorAsset.fromValue(dynamic v) {
	    ColorAsset model = ColorAsset();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ColorAsset()';
  }

} 
