import './Color.dart';
import './GraphicsContextSettings.dart';
import './Gradient.dart';
import '../objects/FileRef.dart';
import '../objects/DataRef.dart';

class Fill {
  final String _class = "fill";
  bool isEnabled;
  Color color;
  int fillType;
  double noiseIndex;
  double noiseIntensity;
  int patternFillType;
  double patternTileScale;
  GraphicsContextSettings contextSettings;
  Gradient gradient;
  dynamic image;

  dynamic noneFilteredValue;

  Fill();

  static setModelWithMap(Map<String, dynamic> map, Fill model) {
    model.isEnabled = map['isEnabled'];

	  if (map['color'] is Map) {
		  model.color = map['color'] != null ? new Color.fromMap(map['color']) : null;
	  } else {
		  model.color = Color.fromValue(map['color']);
	  }

    model.fillType = map['fillType'];

    model.noiseIndex = map['noiseIndex'] != null ? map['noiseIndex'].toDouble() : 0.0;

    model.noiseIntensity = map['noiseIntensity'] != null ? map['noiseIntensity'].toDouble() : 0.0;

    model.patternFillType = map['patternFillType'];

    model.patternTileScale = map['patternTileScale'] != null ? map['patternTileScale'].toDouble() : 0.0;

	  if (map['contextSettings'] is Map) {
		  model.contextSettings = map['contextSettings'] != null ? new GraphicsContextSettings.fromMap(map['contextSettings']) : null;
	  } else {
		  model.contextSettings = GraphicsContextSettings.fromValue(map['contextSettings']);
	  }

	  if (map['gradient'] is Map) {
		  model.gradient = map['gradient'] != null ? new Gradient.fromMap(map['gradient']) : null;
	  } else {
		  model.gradient = Gradient.fromValue(map['gradient']);
	  }

    dynamic image_t = map['image'];
    if (image_t != null) {
      if (image_t is Map && image_t['_class'] != null) {
        switch(image_t['_class']) {
        case 'MSJSONFileReference':
			    if (map['image'] is Map) {
			      model.image = map['image'] != null ? new FileRef.fromMap(map['image']) : null;
			    } else {
			      model.image = FileRef.fromValue(map['image']);
			    }
          break;

        case 'MSJSONOriginalDataReference':
			    if (map['image'] is Map) {
			      model.image = map['image'] != null ? new DataRef.fromMap(map['image']) : null;
			    } else {
			      model.image = DataRef.fromValue(map['image']);
			    }
          break;

          default:
            model.image = map['image'];
            break;
        }
      } else {
        model.image = map['image'];
      }
    }

	}

  factory Fill.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Fill model = Fill();
	  Fill.setModelWithMap(map, model);
    return model;
  }

    factory Fill.fromValue(dynamic v) {
	    Fill model = Fill();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Fill()';
  }

} 
