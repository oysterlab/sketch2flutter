
class Workspace {

  dynamic noneFilteredValue;

  Workspace();

  static setModelWithMap(Map<String, dynamic> map, Workspace model) {
	}

  factory Workspace.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Workspace model = Workspace();
	  Workspace.setModelWithMap(map, model);
    return model;
  }

    factory Workspace.fromValue(dynamic v) {
	    Workspace model = Workspace();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Workspace()';
  }

} 
