class PointListString {
    dynamic noneFilteredValue;

    PointListString();

    factory PointListString.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      PointListString model = PointListString();
      model.noneFilteredValue = map;
      return model;
    }

    factory PointListString.fromValue(dynamic v) {
	    PointListString model = PointListString();
	    model.noneFilteredValue = v;
	    return model;
	  }
}
