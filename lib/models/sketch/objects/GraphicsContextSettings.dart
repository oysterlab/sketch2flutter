
class GraphicsContextSettings {
  final String _class = "graphicsContextSettings";
  int blendMode;
  double opacity;

  dynamic noneFilteredValue;

  GraphicsContextSettings();

  static setModelWithMap(Map<String, dynamic> map, GraphicsContextSettings model) {
    model.blendMode = map['blendMode'];

    model.opacity = map['opacity'] != null ? map['opacity'].toDouble() : 0.0;

	}

  factory GraphicsContextSettings.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GraphicsContextSettings model = GraphicsContextSettings();
	  GraphicsContextSettings.setModelWithMap(map, model);
    return model;
  }

    factory GraphicsContextSettings.fromValue(dynamic v) {
	    GraphicsContextSettings model = GraphicsContextSettings();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'GraphicsContextSettings()';
  }

} 
