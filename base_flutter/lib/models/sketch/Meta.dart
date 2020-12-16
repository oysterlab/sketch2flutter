
class Meta {
  String commit;
  dynamic pagesAndArtboards;
  int version;
  List fonts;
  final String compatibilityVersion = "99";
  String app;
  int autosaved;
  String variant;
  Meta_Created created;
  List saveHistory;
  String appVersion;
  int build;

  dynamic noneFilteredValue;

  Meta();

  static setModelWithMap(Map<String, dynamic> map, Meta model) {
    model.commit = map['commit'];

    model.pagesAndArtboards = map['pagesAndArtboards'];

    model.version = map['version'];

    model.fonts = List<String>.from(map['fonts']);

    model.app = map['app'];

    model.autosaved = map['autosaved'];

    model.variant = map['variant'];
    if (map['created'] != null) {
      model.created = Meta_Created.fromMap(map['created']);
    }

    model.saveHistory = List<String>.from(map['saveHistory']);

    model.appVersion = map['appVersion'];

    model.build = map['build'];

	}

  factory Meta.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Meta model = Meta();
	  Meta.setModelWithMap(map, model);
    return model;
  }

    factory Meta.fromValue(dynamic v) {
	    Meta model = Meta();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Meta()';
  }

} 
class Meta_PagesAndArtboards {

  dynamic noneFilteredValue;

  Meta_PagesAndArtboards();

  static setModelWithMap(Map<String, dynamic> map, Meta_PagesAndArtboards model) {
	}

  factory Meta_PagesAndArtboards.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Meta_PagesAndArtboards model = Meta_PagesAndArtboards();
	  Meta_PagesAndArtboards.setModelWithMap(map, model);
    return model;
  }

    factory Meta_PagesAndArtboards.fromValue(dynamic v) {
	    Meta_PagesAndArtboards model = Meta_PagesAndArtboards();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Meta_PagesAndArtboards()';
  }

} 
class Meta_Created {
  String commit;
  String appVersion;
  int build;
  String app;
  double compatibilityVersion;
  double version;
  String variant;

  dynamic noneFilteredValue;

  Meta_Created();

  static setModelWithMap(Map<String, dynamic> map, Meta_Created model) {
    model.commit = map['commit'];

    model.appVersion = map['appVersion'];

    model.build = map['build'];

    model.app = map['app'];

    model.compatibilityVersion = map['compatibilityVersion'] != null ? map['compatibilityVersion'].toDouble() : 0.0;

    model.version = map['version'] != null ? map['version'].toDouble() : 0.0;

    model.variant = map['variant'];

	}

  factory Meta_Created.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Meta_Created model = Meta_Created();
	  Meta_Created.setModelWithMap(map, model);
    return model;
  }

    factory Meta_Created.fromValue(dynamic v) {
	    Meta_Created model = Meta_Created();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'Meta_Created()';
  }

} 
