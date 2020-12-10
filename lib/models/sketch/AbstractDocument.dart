import './objects/AssetCollection.dart';
import './objects/SharedStyleContainer.dart';
import './objects/SharedTextStyleContainer.dart';
import './objects/SymbolContainer.dart';
import './objects/SwatchContainer.dart';
import './objects/DocumentState.dart';
import './objects/ForeignLayerStyle.dart';
import './objects/ForeignSymbol.dart';
import './objects/ForeignTextStyle.dart';
import './objects/ForeignSwatch.dart';
import './objects/FontRef.dart';

class AbstractDocument {
  final String _class = "document";
  String do_objectID;
  AssetCollection assets;
  int colorSpace;
  int currentPageIndex;
  List foreignLayerStyles;
  List foreignSymbols;
  List foreignTextStyles;
  List foreignSwatches;
  SharedStyleContainer layerStyles;
  SharedTextStyleContainer layerTextStyles;
  SymbolContainer layerSymbols;
  SwatchContainer sharedSwatches;
  List fontReferences;
  DocumentState documentState;

  dynamic noneFilteredValue;

  AbstractDocument();

  static setModelWithMap(Map<String, dynamic> map, AbstractDocument model) {
    model.do_objectID = map['do_objectID'];

	  if (map['assets'] is Map) {
		  model.assets = map['assets'] != null ? new AssetCollection.fromMap(map['assets']) : null;
	  } else {
		  model.assets = AssetCollection.fromValue(map['assets']);
	  }

    model.colorSpace = map['colorSpace'];

    model.currentPageIndex = map['currentPageIndex'];

    if (map['foreignLayerStyles'] != null) {
       model.foreignLayerStyles = map['foreignLayerStyles'].map((d) => new ForeignLayerStyle.fromMap(d)).toList();
    }

    if (map['foreignSymbols'] != null) {
       model.foreignSymbols = map['foreignSymbols'].map((d) => new ForeignSymbol.fromMap(d)).toList();
    }

    if (map['foreignTextStyles'] != null) {
       model.foreignTextStyles = map['foreignTextStyles'].map((d) => new ForeignTextStyle.fromMap(d)).toList();
    }

    if (map['foreignSwatches'] != null) {
       model.foreignSwatches = map['foreignSwatches'].map((d) => new ForeignSwatch.fromMap(d)).toList();
    }

	  if (map['layerStyles'] is Map) {
		  model.layerStyles = map['layerStyles'] != null ? new SharedStyleContainer.fromMap(map['layerStyles']) : null;
	  } else {
		  model.layerStyles = SharedStyleContainer.fromValue(map['layerStyles']);
	  }

	  if (map['layerTextStyles'] is Map) {
		  model.layerTextStyles = map['layerTextStyles'] != null ? new SharedTextStyleContainer.fromMap(map['layerTextStyles']) : null;
	  } else {
		  model.layerTextStyles = SharedTextStyleContainer.fromValue(map['layerTextStyles']);
	  }

	  if (map['layerSymbols'] is Map) {
		  model.layerSymbols = map['layerSymbols'] != null ? new SymbolContainer.fromMap(map['layerSymbols']) : null;
	  } else {
		  model.layerSymbols = SymbolContainer.fromValue(map['layerSymbols']);
	  }

	  if (map['sharedSwatches'] is Map) {
		  model.sharedSwatches = map['sharedSwatches'] != null ? new SwatchContainer.fromMap(map['sharedSwatches']) : null;
	  } else {
		  model.sharedSwatches = SwatchContainer.fromValue(map['sharedSwatches']);
	  }

    if (map['fontReferences'] != null) {
       model.fontReferences = map['fontReferences'].map((d) => new FontRef.fromMap(d)).toList();
    }

	  if (map['documentState'] is Map) {
		  model.documentState = map['documentState'] != null ? new DocumentState.fromMap(map['documentState']) : null;
	  } else {
		  model.documentState = DocumentState.fromValue(map['documentState']);
	  }

	}

  factory AbstractDocument.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AbstractDocument model = AbstractDocument();
	  AbstractDocument.setModelWithMap(map, model);
    return model;
  }

    factory AbstractDocument.fromValue(dynamic v) {
	    AbstractDocument model = AbstractDocument();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'AbstractDocument()';
  }

} 
