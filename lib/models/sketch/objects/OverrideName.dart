class OverrideName {
    dynamic noneFilteredValue;

    OverrideName();

    factory OverrideName.fromMap(Map<String, dynamic> map) {
      if (map == null) return null;
      OverrideName model = OverrideName();
      model.noneFilteredValue = map;
      return model;
    }

    factory OverrideName.fromValue(dynamic v) {
	    OverrideName model = OverrideName();
	    model.noneFilteredValue = v;
	    return model;
	  }
}
