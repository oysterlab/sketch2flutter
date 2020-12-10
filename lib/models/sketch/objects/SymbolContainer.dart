
class SymbolContainer {
  String do_objectID;
  final String _class = "symbolContainer";
  List objects;

  dynamic noneFilteredValue;

  SymbolContainer();

  static setModelWithMap(Map<String, dynamic> map, SymbolContainer model) {
    model.do_objectID = map['do_objectID'];

    model.objects = List.from(map['objects']);

	}

  factory SymbolContainer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SymbolContainer model = SymbolContainer();
	  SymbolContainer.setModelWithMap(map, model);
    return model;
  }

    factory SymbolContainer.fromValue(dynamic v) {
	    SymbolContainer model = SymbolContainer();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SymbolContainer()';
  }

} 
