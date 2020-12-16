
class FreeformGroupLayout {
  final String _class = "MSImmutableFreeformGroupLayout";

  dynamic noneFilteredValue;

  FreeformGroupLayout();

  static setModelWithMap(Map<String, dynamic> map, FreeformGroupLayout model) {
	}

  factory FreeformGroupLayout.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FreeformGroupLayout model = FreeformGroupLayout();
	  FreeformGroupLayout.setModelWithMap(map, model);
    return model;
  }

    factory FreeformGroupLayout.fromValue(dynamic v) {
	    FreeformGroupLayout model = FreeformGroupLayout();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FreeformGroupLayout()';
  }

} 
