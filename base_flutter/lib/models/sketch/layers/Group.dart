import './AbstractGroup.dart';

class Group extends AbstractGroup {
  final String _class = "group";

  dynamic noneFilteredValue;

  Group();

  static setModelWithMap(Map<String, dynamic> map, Group model) {
    AbstractGroup.setModelWithMap(map, model);

	}

  factory Group.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Group model = Group();
	  Group.setModelWithMap(map, model);
    return model;
  }

    factory Group.fromValue(dynamic v) {
	    Group model = Group();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Group()';
  }

} 
