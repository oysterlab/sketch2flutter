
class InferredGroupLayout {
  final String _class = "MSImmutableInferredGroupLayout";
  int axis;
  int layoutAnchor;
  double maxSize;
  double minSize;

  dynamic noneFilteredValue;

  InferredGroupLayout();

  static setModelWithMap(Map<String, dynamic> map, InferredGroupLayout model) {
    model.axis = map['axis'];

    model.layoutAnchor = map['layoutAnchor'];

    model.maxSize = map['maxSize'] != null ? map['maxSize'].toDouble() : 0.0;

    model.minSize = map['minSize'] != null ? map['minSize'].toDouble() : 0.0;

	}

  factory InferredGroupLayout.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    InferredGroupLayout model = InferredGroupLayout();
	  InferredGroupLayout.setModelWithMap(map, model);
    return model;
  }

    factory InferredGroupLayout.fromValue(dynamic v) {
	    InferredGroupLayout model = InferredGroupLayout();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'InferredGroupLayout()';
  }

} 
