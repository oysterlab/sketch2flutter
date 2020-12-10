import './AbstractGroup.dart';
import '../objects/RulerData.dart';
import '../objects/RulerData.dart';
import '../objects/LayoutGrid.dart';
import '../objects/SimpleGrid.dart';
import '../objects/Color.dart';

class Artboard extends AbstractGroup {
  final String _class = "artboard";
  bool includeInCloudUpload;
  bool includeBackgroundColorInExport;
  RulerData horizontalRulerData;
  RulerData verticalRulerData;
  LayoutGrid layout;
  SimpleGrid grid;
  Color backgroundColor;
  bool hasBackgroundColor;
  bool isFlowHome;
  bool resizesContent;
  dynamic presetDictionary;

  dynamic noneFilteredValue;

  Artboard();

  static setModelWithMap(Map<String, dynamic> map, Artboard model) {
    AbstractGroup.setModelWithMap(map, model);

    model.includeInCloudUpload = map['includeInCloudUpload'];

    model.includeBackgroundColorInExport = map['includeBackgroundColorInExport'];

	  if (map['horizontalRulerData'] is Map) {
		  model.horizontalRulerData = map['horizontalRulerData'] != null ? new RulerData.fromMap(map['horizontalRulerData']) : null;
	  } else {
		  model.horizontalRulerData = RulerData.fromValue(map['horizontalRulerData']);
	  }

	  if (map['verticalRulerData'] is Map) {
		  model.verticalRulerData = map['verticalRulerData'] != null ? new RulerData.fromMap(map['verticalRulerData']) : null;
	  } else {
		  model.verticalRulerData = RulerData.fromValue(map['verticalRulerData']);
	  }

	  if (map['layout'] is Map) {
		  model.layout = map['layout'] != null ? new LayoutGrid.fromMap(map['layout']) : null;
	  } else {
		  model.layout = LayoutGrid.fromValue(map['layout']);
	  }

	  if (map['grid'] is Map) {
		  model.grid = map['grid'] != null ? new SimpleGrid.fromMap(map['grid']) : null;
	  } else {
		  model.grid = SimpleGrid.fromValue(map['grid']);
	  }

	  if (map['backgroundColor'] is Map) {
		  model.backgroundColor = map['backgroundColor'] != null ? new Color.fromMap(map['backgroundColor']) : null;
	  } else {
		  model.backgroundColor = Color.fromValue(map['backgroundColor']);
	  }

    model.hasBackgroundColor = map['hasBackgroundColor'];

    model.isFlowHome = map['isFlowHome'];

    model.resizesContent = map['resizesContent'];

    model.presetDictionary = map['presetDictionary'];

	}

  factory Artboard.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Artboard model = Artboard();
	  Artboard.setModelWithMap(map, model);
    return model;
  }

    factory Artboard.fromValue(dynamic v) {
	    Artboard model = Artboard();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Artboard()';
  }

} 
class Artboard_PresetDictionary {

  dynamic noneFilteredValue;

  Artboard_PresetDictionary();

  static setModelWithMap(Map<String, dynamic> map, Artboard_PresetDictionary model) {
	}

  factory Artboard_PresetDictionary.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Artboard_PresetDictionary model = Artboard_PresetDictionary();
	  Artboard_PresetDictionary.setModelWithMap(map, model);
    return model;
  }

    factory Artboard_PresetDictionary.fromValue(dynamic v) {
	    Artboard_PresetDictionary model = Artboard_PresetDictionary();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Artboard_PresetDictionary()';
  }

} 
