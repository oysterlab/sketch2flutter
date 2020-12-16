import './AbstractGroup.dart';
import '../objects/Color.dart';
import '../objects/RulerData.dart';
import '../objects/RulerData.dart';
import '../objects/OverrideProperty.dart';

class SymbolMaster extends AbstractGroup {
  final String _class = "symbolMaster";
  Color backgroundColor;
  bool hasBackgroundColor;
  RulerData horizontalRulerData;
  bool includeBackgroundColorInExport;
  bool includeInCloudUpload;
  bool isFlowHome;
  bool resizesContent;
  RulerData verticalRulerData;
  bool includeBackgroundColorInInstance;
  String symbolID;
  bool allowsOverrides;
  List overrideProperties;
  dynamic presetDictionary;

  dynamic noneFilteredValue;

  SymbolMaster();

  static setModelWithMap(Map<String, dynamic> map, SymbolMaster model) {
    AbstractGroup.setModelWithMap(map, model);

	  if (map['backgroundColor'] is Map) {
		  model.backgroundColor = map['backgroundColor'] != null ? new Color.fromMap(map['backgroundColor']) : null;
	  } else {
		  model.backgroundColor = Color.fromValue(map['backgroundColor']);
	  }

    model.hasBackgroundColor = map['hasBackgroundColor'];

	  if (map['horizontalRulerData'] is Map) {
		  model.horizontalRulerData = map['horizontalRulerData'] != null ? new RulerData.fromMap(map['horizontalRulerData']) : null;
	  } else {
		  model.horizontalRulerData = RulerData.fromValue(map['horizontalRulerData']);
	  }

    model.includeBackgroundColorInExport = map['includeBackgroundColorInExport'];

    model.includeInCloudUpload = map['includeInCloudUpload'];

    model.isFlowHome = map['isFlowHome'];

    model.resizesContent = map['resizesContent'];

	  if (map['verticalRulerData'] is Map) {
		  model.verticalRulerData = map['verticalRulerData'] != null ? new RulerData.fromMap(map['verticalRulerData']) : null;
	  } else {
		  model.verticalRulerData = RulerData.fromValue(map['verticalRulerData']);
	  }

    model.includeBackgroundColorInInstance = map['includeBackgroundColorInInstance'];

    model.symbolID = map['symbolID'];

    model.allowsOverrides = map['allowsOverrides'];

    if (map['overrideProperties'] != null) {
       model.overrideProperties = map['overrideProperties'].map((d) => new OverrideProperty.fromMap(d)).toList();
    }

    model.presetDictionary = map['presetDictionary'];

	}

  factory SymbolMaster.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SymbolMaster model = SymbolMaster();
	  SymbolMaster.setModelWithMap(map, model);
    return model;
  }

    factory SymbolMaster.fromValue(dynamic v) {
	    SymbolMaster model = SymbolMaster();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SymbolMaster()';
  }

} 
class SymbolMaster_PresetDictionary {

  dynamic noneFilteredValue;

  SymbolMaster_PresetDictionary();

  static setModelWithMap(Map<String, dynamic> map, SymbolMaster_PresetDictionary model) {
	}

  factory SymbolMaster_PresetDictionary.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SymbolMaster_PresetDictionary model = SymbolMaster_PresetDictionary();
	  SymbolMaster_PresetDictionary.setModelWithMap(map, model);
    return model;
  }

    factory SymbolMaster_PresetDictionary.fromValue(dynamic v) {
	    SymbolMaster_PresetDictionary model = SymbolMaster_PresetDictionary();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SymbolMaster_PresetDictionary()';
  }

} 
