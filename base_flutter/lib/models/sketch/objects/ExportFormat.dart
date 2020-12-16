
class ExportFormat {
  final String _class = "exportFormat";
  int absoluteSize;
  String fileFormat;
  String name;
  int namingScheme;
  double scale;
  int visibleScaleType;

  dynamic noneFilteredValue;

  ExportFormat();

  static setModelWithMap(Map<String, dynamic> map, ExportFormat model) {
    model.absoluteSize = map['absoluteSize'];

    model.fileFormat = map['fileFormat'];

    model.name = map['name'];

    model.namingScheme = map['namingScheme'];

    model.scale = map['scale'] != null ? map['scale'].toDouble() : 0.0;

    model.visibleScaleType = map['visibleScaleType'];

	}

  factory ExportFormat.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ExportFormat model = ExportFormat();
	  ExportFormat.setModelWithMap(map, model);
    return model;
  }

    factory ExportFormat.fromValue(dynamic v) {
	    ExportFormat model = ExportFormat();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ExportFormat()';
  }

} 
