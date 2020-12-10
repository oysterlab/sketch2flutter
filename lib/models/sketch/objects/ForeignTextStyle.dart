import './SharedStyle.dart';

class ForeignTextStyle {
  final String _class = "MSImmutableForeignTextStyle";
  String libraryID;
  String sourceLibraryName;
  bool symbolPrivate;
  String remoteStyleID;
  SharedStyle localSharedStyle;
  bool missingLibraryFontAcknowledged;

  dynamic noneFilteredValue;

  ForeignTextStyle();

  static setModelWithMap(Map<String, dynamic> map, ForeignTextStyle model) {
    model.libraryID = map['libraryID'];

    model.sourceLibraryName = map['sourceLibraryName'];

    model.symbolPrivate = map['symbolPrivate'];

    model.remoteStyleID = map['remoteStyleID'];

	  if (map['localSharedStyle'] is Map) {
		  model.localSharedStyle = map['localSharedStyle'] != null ? new SharedStyle.fromMap(map['localSharedStyle']) : null;
	  } else {
		  model.localSharedStyle = SharedStyle.fromValue(map['localSharedStyle']);
	  }

    model.missingLibraryFontAcknowledged = map['missingLibraryFontAcknowledged'];

	}

  factory ForeignTextStyle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ForeignTextStyle model = ForeignTextStyle();
	  ForeignTextStyle.setModelWithMap(map, model);
    return model;
  }

    factory ForeignTextStyle.fromValue(dynamic v) {
	    ForeignTextStyle model = ForeignTextStyle();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ForeignTextStyle()';
  }

} 
