class PointString {
    dynamic noneFilteredValue;

    PointString();

    factory PointString.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      PointString model = PointString();
      model.noneFilteredValue = map;
      return model;
    }

    factory PointString.fromValue(dynamic v) {
	    PointString model = PointString();
	    model.noneFilteredValue = v;
	    return model;
	  }
}
