
class LayoutGrid {
  final String _class = "layoutGrid";
  bool isEnabled;
  int columnWidth;
  int gutterHeight;
  int gutterWidth;
  int horizontalOffset;
  int numberOfColumns;
  int rowHeightMultiplication;
  int totalWidth;
  bool guttersOutside;
  bool drawHorizontal;
  bool drawHorizontalLines;
  bool drawVertical;

  dynamic noneFilteredValue;

  LayoutGrid();

  static setModelWithMap(Map<String, dynamic> map, LayoutGrid model) {
    model.isEnabled = map['isEnabled'];

    model.columnWidth = map['columnWidth'];

    model.gutterHeight = map['gutterHeight'];

    model.gutterWidth = map['gutterWidth'];

    model.horizontalOffset = map['horizontalOffset'];

    model.numberOfColumns = map['numberOfColumns'];

    model.rowHeightMultiplication = map['rowHeightMultiplication'];

    model.totalWidth = map['totalWidth'];

    model.guttersOutside = map['guttersOutside'];

    model.drawHorizontal = map['drawHorizontal'];

    model.drawHorizontalLines = map['drawHorizontalLines'];

    model.drawVertical = map['drawVertical'];

	}

  factory LayoutGrid.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LayoutGrid model = LayoutGrid();
	  LayoutGrid.setModelWithMap(map, model);
    return model;
  }

    factory LayoutGrid.fromValue(dynamic v) {
	    LayoutGrid model = LayoutGrid();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'LayoutGrid()';
  }

} 
