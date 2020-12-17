class FileRef {
  final String _class = "MSJSONFileReference";
  String _ref_class;
  String _ref;

  dynamic noneFilteredValue;

  FileRef();

  get ref => _ref;
  get refClass => _ref_class;

  static setModelWithMap(Map<String, dynamic> map, FileRef model) {
    model._ref_class = map['_ref_class'];

    model._ref = map['_ref'];
  }

  factory FileRef.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FileRef model = FileRef();
    FileRef.setModelWithMap(map, model);
    return model;
  }

  factory FileRef.fromValue(dynamic v) {
    FileRef model = FileRef();
    model.noneFilteredValue = v;
    return model;
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  String toString() {
    return 'FileRef()';
  }
}
