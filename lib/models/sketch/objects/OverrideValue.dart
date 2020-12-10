import './OverrideName.dart';
import '../utils/Uuid.dart';
import './FileRef.dart';
import './DataRef.dart';

class OverrideValue {
  final String _class = "overrideValue";
  String do_objectID;
  OverrideName overrideName;
  dynamic value;

  dynamic noneFilteredValue;

  OverrideValue();

  static setModelWithMap(Map<String, dynamic> map, OverrideValue model) {
    model.do_objectID = map['do_objectID'];

	  if (map['overrideName'] is Map) {
		  model.overrideName = map['overrideName'] != null ? new OverrideName.fromMap(map['overrideName']) : null;
	  } else {
		  model.overrideName = OverrideName.fromValue(map['overrideName']);
	  }

    dynamic value_t = map['value'];
    if (value_t != null) {
      if (value_t is Map && value_t['_class'] != null) {
        switch(value_t['_class']) {
        case 'MSJSONFileReference':
			    if (map['value'] is Map) {
			      model.value = map['value'] != null ? new FileRef.fromMap(map['value']) : null;
			    } else {
			      model.value = FileRef.fromValue(map['value']);
			    }
          break;

        case 'MSJSONOriginalDataReference':
			    if (map['value'] is Map) {
			      model.value = map['value'] != null ? new DataRef.fromMap(map['value']) : null;
			    } else {
			      model.value = DataRef.fromValue(map['value']);
			    }
          break;

          default:
            model.value = map['value'];
            break;
        }
      } else {
        model.value = map['value'];
      }
    }

	}

  factory OverrideValue.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    OverrideValue model = OverrideValue();
	  OverrideValue.setModelWithMap(map, model);
    return model;
  }

    factory OverrideValue.fromValue(dynamic v) {
	    OverrideValue model = OverrideValue();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'OverrideValue()';
  }

} 
