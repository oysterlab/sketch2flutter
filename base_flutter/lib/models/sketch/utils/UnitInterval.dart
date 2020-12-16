class UnitInterval {
    dynamic noneFilteredValue;

    UnitInterval();

    factory UnitInterval.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      UnitInterval model = UnitInterval();
      model.noneFilteredValue = map;
      return model;
    }

    factory UnitInterval.fromValue(dynamic v) {
	    UnitInterval model = UnitInterval();
	    model.noneFilteredValue = v;
	    return model;
	  }
}
