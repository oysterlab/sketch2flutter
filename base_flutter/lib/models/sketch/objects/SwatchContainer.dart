import './Swatch.dart';

class SwatchContainer {
  final String _class = "swatchContainer";
  String do_objectID;
  List objects;

  dynamic noneFilteredValue;

  SwatchContainer();

  static setModelWithMap(Map<String, dynamic> map, SwatchContainer model) {
    model.do_objectID = map['do_objectID'];

    if (map['objects'] != null) {
       model.objects = map['objects'].map((d) => new Swatch.fromMap(d)).toList();
    }

	}

  factory SwatchContainer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SwatchContainer model = SwatchContainer();
	  SwatchContainer.setModelWithMap(map, model);
    return model;
  }

    factory SwatchContainer.fromValue(dynamic v) {
	    SwatchContainer model = SwatchContainer();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SwatchContainer()';
  }

} 
