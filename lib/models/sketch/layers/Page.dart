import './AbstractGroup.dart';
import '../objects/RulerData.dart';
import '../objects/RulerData.dart';
import '../objects/LayoutGrid.dart';
import '../objects/SimpleGrid.dart';

class Page extends AbstractGroup {
  final String _class = "page";
  bool includeInCloudUpload;
  RulerData horizontalRulerData;
  RulerData verticalRulerData;
  LayoutGrid layout;
  SimpleGrid grid;

  dynamic noneFilteredValue;

  Page();

  static setModelWithMap(Map<String, dynamic> map, Page model) {
    AbstractGroup.setModelWithMap(map, model);

    model.includeInCloudUpload = map['includeInCloudUpload'];

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

	}

  factory Page.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Page model = Page();
	  Page.setModelWithMap(map, model);
    return model;
  }

    factory Page.fromValue(dynamic v) {
	    Page model = Page();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Page()';
  }

} 
