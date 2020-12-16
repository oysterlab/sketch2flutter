import '../utils/Uuid.dart';

class FlowConnection {
  final String _class = "MSImmutableFlowConnection";
  dynamic destinationArtboardID;
  int animationType;
  bool maintainScrollPosition;

  dynamic noneFilteredValue;

  FlowConnection();

  static setModelWithMap(Map<String, dynamic> map, FlowConnection model) {
    model.destinationArtboardID = map['destinationArtboardID'];
    model.animationType = map['animationType'];

    model.maintainScrollPosition = map['maintainScrollPosition'];

	}

  factory FlowConnection.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FlowConnection model = FlowConnection();
	  FlowConnection.setModelWithMap(map, model);
    return model;
  }

    factory FlowConnection.fromValue(dynamic v) {
	    FlowConnection model = FlowConnection();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'FlowConnection()';
  }

} 
