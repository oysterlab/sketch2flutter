
class ParagraphStyle {
  final String _class = "paragraphStyle";
  int alignment;
  double maximumLineHeight;
  double minimumLineHeight;
  double paragraphSpacing;
  double allowsDefaultTighteningForTruncation;

  dynamic noneFilteredValue;

  ParagraphStyle();

  static setModelWithMap(Map<String, dynamic> map, ParagraphStyle model) {
    model.alignment = map['alignment'];

    model.maximumLineHeight = map['maximumLineHeight'] != null ? map['maximumLineHeight'].toDouble() : 0.0;

    model.minimumLineHeight = map['minimumLineHeight'] != null ? map['minimumLineHeight'].toDouble() : 0.0;

    model.paragraphSpacing = map['paragraphSpacing'] != null ? map['paragraphSpacing'].toDouble() : 0.0;

    model.allowsDefaultTighteningForTruncation = map['allowsDefaultTighteningForTruncation'] != null ? map['allowsDefaultTighteningForTruncation'].toDouble() : 0.0;

	}

  factory ParagraphStyle.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ParagraphStyle model = ParagraphStyle();
	  ParagraphStyle.setModelWithMap(map, model);
    return model;
  }

    factory ParagraphStyle.fromValue(dynamic v) {
	    ParagraphStyle model = ParagraphStyle();
	    model.noneFilteredValue = v;
	    return model;
	  }

  Map<String, dynamic> toMap() {
	  return {
    };
  }

  @override
  String toString() {
    return 'ParagraphStyle()';
  }

} 
