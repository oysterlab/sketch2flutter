
class User {
  User_Document document;

  dynamic noneFilteredValue;

  User();

  static setModelWithMap(Map<String, dynamic> map, User model) {    if (map['document'] != null) {
      model.document = User_Document.fromMap(map['document']);
    }

	}

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    User model = User();
	  User.setModelWithMap(map, model);
    return model;
  }

    factory User.fromValue(dynamic v) {
	    User model = User();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'User()';
  }

} 
class User_Document {
  int pageListHeight;
  int pageListCollapsed;
  List expandedSymbolPathsInSidebar;
  List expandedTextStylePathsInPopover;
  int libraryListCollapsed;

  dynamic noneFilteredValue;

  User_Document();

  static setModelWithMap(Map<String, dynamic> map, User_Document model) {
    model.pageListHeight = map['pageListHeight'];

    model.pageListCollapsed = map['pageListCollapsed'];

    model.expandedSymbolPathsInSidebar = List.from(map['expandedSymbolPathsInSidebar']);

    model.expandedTextStylePathsInPopover = List.from(map['expandedTextStylePathsInPopover']);

    model.libraryListCollapsed = map['libraryListCollapsed'];

	}

  factory User_Document.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    User_Document model = User_Document();
	  User_Document.setModelWithMap(map, model);
    return model;
  }

    factory User_Document.fromValue(dynamic v) {
	    User_Document model = User_Document();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'User_Document()';
  }

} 
