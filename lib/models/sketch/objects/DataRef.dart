
class DataRef {
  final String _class = "MSJSONOriginalDataReference";
  String _ref_class;
  String _ref;
  DataRef_Data data;
  DataRef_Sha1 sha1;

  dynamic noneFilteredValue;

  DataRef();

  static setModelWithMap(Map<String, dynamic> map, DataRef model) {
    model._ref_class = map['_ref_class'];

    model._ref = map['_ref'];
    if (map['data'] != null) {
      model.data = DataRef_Data.fromMap(map['data']);
    }
    if (map['sha1'] != null) {
      model.sha1 = DataRef_Sha1.fromMap(map['sha1']);
    }

	}

  factory DataRef.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataRef model = DataRef();
	  DataRef.setModelWithMap(map, model);
    return model;
  }

    factory DataRef.fromValue(dynamic v) {
	    DataRef model = DataRef();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'DataRef()';
  }

} 
class DataRef_Data {
  String _data;

  dynamic noneFilteredValue;

  DataRef_Data();

  static setModelWithMap(Map<String, dynamic> map, DataRef_Data model) {
    model._data = map['_data'];

	}

  factory DataRef_Data.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataRef_Data model = DataRef_Data();
	  DataRef_Data.setModelWithMap(map, model);
    return model;
  }

    factory DataRef_Data.fromValue(dynamic v) {
	    DataRef_Data model = DataRef_Data();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'DataRef_Data()';
  }

} 
class DataRef_Sha1 {
  String _data;

  dynamic noneFilteredValue;

  DataRef_Sha1();

  static setModelWithMap(Map<String, dynamic> map, DataRef_Sha1 model) {
    model._data = map['_data'];

	}

  factory DataRef_Sha1.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataRef_Sha1 model = DataRef_Sha1();
	  DataRef_Sha1.setModelWithMap(map, model);
    return model;
  }

    factory DataRef_Sha1.fromValue(dynamic v) {
	    DataRef_Sha1 model = DataRef_Sha1();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'DataRef_Sha1()';
  }

} 
