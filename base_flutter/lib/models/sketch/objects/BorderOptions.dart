
class BorderOptions {
  final String _class = "borderOptions";
  bool isEnabled;
  List dashPattern;
  int lineCapStyle;
  int lineJoinStyle;

  dynamic noneFilteredValue;

  BorderOptions();

  static setModelWithMap(Map<String, dynamic> map, BorderOptions model) {
    model.isEnabled = map['isEnabled'];

    model.dashPattern = List<double>.from(map['dashPattern'].map((d) => d.toDouble()));

    model.lineCapStyle = map['lineCapStyle'];

    model.lineJoinStyle = map['lineJoinStyle'];

	}

  factory BorderOptions.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BorderOptions model = BorderOptions();
	  BorderOptions.setModelWithMap(map, model);
    return model;
  }

    factory BorderOptions.fromValue(dynamic v) {
	    BorderOptions model = BorderOptions();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'BorderOptions()';
  }

} 
