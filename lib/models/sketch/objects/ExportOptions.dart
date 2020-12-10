import './ExportFormat.dart';
import '../utils/Uuid.dart';

class ExportOptions {
  final String _class = "exportOptions";
  List exportFormats;
  List includedLayerIds;
  int layerOptions;
  bool shouldTrim;

  dynamic noneFilteredValue;

  ExportOptions();

  static setModelWithMap(Map<String, dynamic> map, ExportOptions model) {
    if (map['exportFormats'] != null) {
       model.exportFormats = map['exportFormats'].map((d) => new ExportFormat.fromMap(d)).toList();
    }

    if (map['includedLayerIds'] != null) {
       model.includedLayerIds = map['includedLayerIds'].map((d) => new Uuid.fromMap(d)).toList();
    }

    model.layerOptions = map['layerOptions'];

    model.shouldTrim = map['shouldTrim'];

	}

  factory ExportOptions.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ExportOptions model = ExportOptions();
	  ExportOptions.setModelWithMap(map, model);
    return model;
  }

    factory ExportOptions.fromValue(dynamic v) {
	    ExportOptions model = ExportOptions();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ExportOptions()';
  }

} 
