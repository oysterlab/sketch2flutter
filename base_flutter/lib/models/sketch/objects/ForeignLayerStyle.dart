import './SharedStyle.dart';

class ForeignLayerStyle {
  final String _class = "MSImmutableForeignLayerStyle";
  String do_objectID;
  String libraryID;
  String sourceLibraryName;
  bool symbolPrivate;
  String remoteStyleID;
  SharedStyle localSharedStyle;

  dynamic noneFilteredValue;

  ForeignLayerStyle();

  static setModelWithMap(Map<String, dynamic> map, ForeignLayerStyle model) {
    model.do_objectID = map['do_objectID'];

    model.libraryID = map['libraryID'];

    model.sourceLibraryName = map['sourceLibraryName'];

    model.symbolPrivate = map['symbolPrivate'];

    model.remoteStyleID = map['remoteStyleID'];

	  if (map['localSharedStyle'] is Map) {
		  model.localSharedStyle = map['localSharedStyle'] != null ? new SharedStyle.fromMap(map['localSharedStyle']) : null;
	  } else {
		  model.localSharedStyle = SharedStyle.fromValue(map['localSharedStyle']);
	  }

	}

  factory ForeignLayerStyle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ForeignLayerStyle model = ForeignLayerStyle();
	  ForeignLayerStyle.setModelWithMap(map, model);
    return model;
  }

    factory ForeignLayerStyle.fromValue(dynamic v) {
	    ForeignLayerStyle model = ForeignLayerStyle();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ForeignLayerStyle()';
  }

} 
