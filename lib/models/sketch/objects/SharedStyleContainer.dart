import './SharedStyle.dart';

class SharedStyleContainer {
  String do_objectID;
  final String _class = "sharedStyleContainer";
  List objects;

  dynamic noneFilteredValue;

  SharedStyleContainer();

  static setModelWithMap(Map<String, dynamic> map, SharedStyleContainer model) {
    model.do_objectID = map['do_objectID'];

    if (map['objects'] != null) {
       model.objects = map['objects'].map((d) => new SharedStyle.fromMap(d)).toList();
    }

	}

  factory SharedStyleContainer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SharedStyleContainer model = SharedStyleContainer();
	  SharedStyleContainer.setModelWithMap(map, model);
    return model;
  }

    factory SharedStyleContainer.fromValue(dynamic v) {
	    SharedStyleContainer model = SharedStyleContainer();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SharedStyleContainer()';
  }

} 
