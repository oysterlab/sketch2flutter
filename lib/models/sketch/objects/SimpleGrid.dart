
class SimpleGrid {
  final String _class = "simpleGrid";
  bool isEnabled;
  int gridSize;
  int thickGridTimes;

  dynamic noneFilteredValue;

  SimpleGrid();

  static setModelWithMap(Map<String, dynamic> map, SimpleGrid model) {
    model.isEnabled = map['isEnabled'];

    model.gridSize = map['gridSize'];

    model.thickGridTimes = map['thickGridTimes'];

	}

  factory SimpleGrid.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SimpleGrid model = SimpleGrid();
	  SimpleGrid.setModelWithMap(map, model);
    return model;
  }

    factory SimpleGrid.fromValue(dynamic v) {
	    SimpleGrid model = SimpleGrid();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'SimpleGrid()';
  }

} 
