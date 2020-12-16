
class FontDescriptor {
  final String _class = "fontDescriptor";
  FontDescriptor_Attributes attributes;

  dynamic noneFilteredValue;

  FontDescriptor();

  static setModelWithMap(Map<String, dynamic> map, FontDescriptor model) {    if (map['attributes'] != null) {
      model.attributes = FontDescriptor_Attributes.fromMap(map['attributes']);
    }

	}

  factory FontDescriptor.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FontDescriptor model = FontDescriptor();
	  FontDescriptor.setModelWithMap(map, model);
    return model;
  }

    factory FontDescriptor.fromValue(dynamic v) {
	    FontDescriptor model = FontDescriptor();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FontDescriptor()';
  }

} 
class FontDescriptor_Attributes {
  String name;
  double size;
  dynamic variation;

  dynamic noneFilteredValue;

  FontDescriptor_Attributes();

  static setModelWithMap(Map<String, dynamic> map, FontDescriptor_Attributes model) {
    model.name = map['name'];

    model.size = map['size'] != null ? map['size'].toDouble() : 0.0;

    model.variation = map['variation'];

	}

  factory FontDescriptor_Attributes.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FontDescriptor_Attributes model = FontDescriptor_Attributes();
	  FontDescriptor_Attributes.setModelWithMap(map, model);
    return model;
  }

    factory FontDescriptor_Attributes.fromValue(dynamic v) {
	    FontDescriptor_Attributes model = FontDescriptor_Attributes();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FontDescriptor_Attributes()';
  }

} 
