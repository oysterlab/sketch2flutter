import './Gradient.dart';

class GradientAsset {
  final String _class = "MSImmutableGradientAsset";
  String do_objectID;
  String name;
  Gradient gradient;

  dynamic noneFilteredValue;

  GradientAsset();

  static setModelWithMap(Map<String, dynamic> map, GradientAsset model) {
    model.do_objectID = map['do_objectID'];

    model.name = map['name'];

	  if (map['gradient'] is Map) {
		  model.gradient = map['gradient'] != null ? new Gradient.fromMap(map['gradient']) : null;
	  } else {
		  model.gradient = Gradient.fromValue(map['gradient']);
	  }

	}

  factory GradientAsset.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GradientAsset model = GradientAsset();
	  GradientAsset.setModelWithMap(map, model);
    return model;
  }

    factory GradientAsset.fromValue(dynamic v) {
	    GradientAsset model = GradientAsset();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'GradientAsset()';
  }

} 
