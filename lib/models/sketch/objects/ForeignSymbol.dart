import '../layers/SymbolMaster.dart';
import '../layers/SymbolMaster.dart';

class ForeignSymbol {
  final String _class = "MSImmutableForeignSymbol";
  String do_objectID;
  String libraryID;
  String sourceLibraryName;
  bool symbolPrivate;
  SymbolMaster originalMaster;
  SymbolMaster symbolMaster;
  bool missingLibraryFontAcknowledged;

  dynamic noneFilteredValue;

  ForeignSymbol();

  static setModelWithMap(Map<String, dynamic> map, ForeignSymbol model) {
    model.do_objectID = map['do_objectID'];

    model.libraryID = map['libraryID'];

    model.sourceLibraryName = map['sourceLibraryName'];

    model.symbolPrivate = map['symbolPrivate'];

	  if (map['originalMaster'] is Map) {
		  model.originalMaster = map['originalMaster'] != null ? new SymbolMaster.fromMap(map['originalMaster']) : null;
	  } else {
		  model.originalMaster = SymbolMaster.fromValue(map['originalMaster']);
	  }

	  if (map['symbolMaster'] is Map) {
		  model.symbolMaster = map['symbolMaster'] != null ? new SymbolMaster.fromMap(map['symbolMaster']) : null;
	  } else {
		  model.symbolMaster = SymbolMaster.fromValue(map['symbolMaster']);
	  }

    model.missingLibraryFontAcknowledged = map['missingLibraryFontAcknowledged'];

	}

  factory ForeignSymbol.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ForeignSymbol model = ForeignSymbol();
	  ForeignSymbol.setModelWithMap(map, model);
    return model;
  }

    factory ForeignSymbol.fromValue(dynamic v) {
	    ForeignSymbol model = ForeignSymbol();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ForeignSymbol()';
  }

} 
