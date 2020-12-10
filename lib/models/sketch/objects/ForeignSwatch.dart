import './Swatch.dart';

class ForeignSwatch {
  final String _class = "MSImmutableForeignSwatch";
  String do_objectID;
  String libraryID;
  String sourceLibraryName;
  bool symbolPrivate;
  String remoteSwatchID;
  Swatch localSwatch;

  dynamic noneFilteredValue;

  ForeignSwatch();

  static setModelWithMap(Map<String, dynamic> map, ForeignSwatch model) {
    model.do_objectID = map['do_objectID'];

    model.libraryID = map['libraryID'];

    model.sourceLibraryName = map['sourceLibraryName'];

    model.symbolPrivate = map['symbolPrivate'];

    model.remoteSwatchID = map['remoteSwatchID'];

	  if (map['localSwatch'] is Map) {
		  model.localSwatch = map['localSwatch'] != null ? new Swatch.fromMap(map['localSwatch']) : null;
	  } else {
		  model.localSwatch = Swatch.fromValue(map['localSwatch']);
	  }

	}

  factory ForeignSwatch.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ForeignSwatch model = ForeignSwatch();
	  ForeignSwatch.setModelWithMap(map, model);
    return model;
  }

    factory ForeignSwatch.fromValue(dynamic v) {
	    ForeignSwatch model = ForeignSwatch();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ForeignSwatch()';
  }

} 
