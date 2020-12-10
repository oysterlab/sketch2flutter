import './OverrideName.dart';

class OverrideProperty {
  final String _class = "MSImmutableOverrideProperty";
  OverrideName overrideName;
  bool canOverride;

  dynamic noneFilteredValue;

  OverrideProperty();

  static setModelWithMap(Map<String, dynamic> map, OverrideProperty model) {
	  if (map['overrideName'] is Map) {
		  model.overrideName = map['overrideName'] != null ? new OverrideName.fromMap(map['overrideName']) : null;
	  } else {
		  model.overrideName = OverrideName.fromValue(map['overrideName']);
	  }

    model.canOverride = map['canOverride'];

	}

  factory OverrideProperty.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    OverrideProperty model = OverrideProperty();
	  OverrideProperty.setModelWithMap(map, model);
    return model;
  }

    factory OverrideProperty.fromValue(dynamic v) {
	    OverrideProperty model = OverrideProperty();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'OverrideProperty()';
  }

} 
