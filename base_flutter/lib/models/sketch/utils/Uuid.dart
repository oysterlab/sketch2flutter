class Uuid {
    dynamic noneFilteredValue;

    Uuid();

    factory Uuid.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      Uuid model = Uuid();
      model.noneFilteredValue = map;
      return model;
    }

    factory Uuid.fromValue(dynamic v) {
	    Uuid model = Uuid();
	    model.noneFilteredValue = v;
	    return model;
	  }
}
