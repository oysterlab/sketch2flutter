import './AbstractLayer.dart';
import '../objects/FileRef.dart';
import '../objects/DataRef.dart';

class Bitmap extends AbstractLayer {
  final String _class = "bitmap";
  bool fillReplacesImage;
  dynamic image;
  int intendedDPI;
  String clippingMask;

  dynamic noneFilteredValue;

  Bitmap();

  static setModelWithMap(Map<String, dynamic> map, Bitmap model) {
    AbstractLayer.setModelWithMap(map, model);

    model.fillReplacesImage = map['fillReplacesImage'];

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

    model.intendedDPI = map['intendedDPI'];

    model.clippingMask = map['clippingMask'];

	}

  factory Bitmap.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Bitmap model = Bitmap();
	  Bitmap.setModelWithMap(map, model);
    return model;
  }

    factory Bitmap.fromValue(dynamic v) {
	    Bitmap model = Bitmap();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Bitmap()';
  }

} 
