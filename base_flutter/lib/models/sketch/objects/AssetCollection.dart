import './ImageCollection.dart';
import './ColorAsset.dart';
import './GradientAsset.dart';
import './FileRef.dart';
import './DataRef.dart';
import './Color.dart';
import './Gradient.dart';

class AssetCollection {
  final String _class = "assetCollection";
  String do_objectID;
  ImageCollection imageCollection;
  List colorAssets;
  List gradientAssets;
  List images;
  List colors;
  List gradients;
  List exportPresets;

  dynamic noneFilteredValue;

  AssetCollection();

  static setModelWithMap(Map<String, dynamic> map, AssetCollection model) {
    model.do_objectID = map['do_objectID'];

	  if (map['imageCollection'] is Map) {
		  model.imageCollection = map['imageCollection'] != null ? new ImageCollection.fromMap(map['imageCollection']) : null;
	  } else {
		  model.imageCollection = ImageCollection.fromValue(map['imageCollection']);
	  }

    if (map['colorAssets'] != null) {
       model.colorAssets = map['colorAssets'].map((d) => new ColorAsset.fromMap(d)).toList();
    }

    if (map['gradientAssets'] != null) {
       model.gradientAssets = map['gradientAssets'].map((d) => new GradientAsset.fromMap(d)).toList();
    }
    if (map['images'] != null) {
      model.images = map['images'].map((d) {
        dynamic model = null;
        switch(d['_class']) {
          case 'MSJSONFileReference':
            model = new FileRef.fromMap(d);
            break;

          case 'MSJSONOriginalDataReference':
            model = new DataRef.fromMap(d);
            break;

          default:
            break;
        }

        return model;
      }).toList();
    }

    if (map['colors'] != null) {
       model.colors = map['colors'].map((d) => new Color.fromMap(d)).toList();
    }

    if (map['gradients'] != null) {
       model.gradients = map['gradients'].map((d) => new Gradient.fromMap(d)).toList();
    }

    model.exportPresets = List.from(map['exportPresets']);

	}

  factory AssetCollection.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AssetCollection model = AssetCollection();
	  AssetCollection.setModelWithMap(map, model);
    return model;
  }

    factory AssetCollection.fromValue(dynamic v) {
	    AssetCollection model = AssetCollection();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AssetCollection()';
  }

} 
