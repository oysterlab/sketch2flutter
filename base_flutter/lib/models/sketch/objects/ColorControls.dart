
class ColorControls {
  final String _class = "colorControls";
  bool isEnabled;
  double brightness;
  double contrast;
  double hue;
  double saturation;

  dynamic noneFilteredValue;

  ColorControls();

  static setModelWithMap(Map<String, dynamic> map, ColorControls model) {
    model.isEnabled = map['isEnabled'];

    model.brightness = map['brightness'] != null ? map['brightness'].toDouble() : 0.0;

    model.contrast = map['contrast'] != null ? map['contrast'].toDouble() : 0.0;

    model.hue = map['hue'] != null ? map['hue'].toDouble() : 0.0;

    model.saturation = map['saturation'] != null ? map['saturation'].toDouble() : 0.0;

	}

  factory ColorControls.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ColorControls model = ColorControls();
	  ColorControls.setModelWithMap(map, model);
    return model;
  }

    factory ColorControls.fromValue(dynamic v) {
	    ColorControls model = ColorControls();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ColorControls()';
  }

} 
