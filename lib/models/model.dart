import 'dart:convert';
import 'package:get/get.dart';
import 'dart:math' as Math;

Math.Point parseSketchPointToPoint(String sketchPoint) {
  var point = sketchPoint.replaceAll('{', '').replaceAll('}', '').split(',');

  return Math.Point(double.parse(point[0]), double.parse(point[1]));
}

class Null {
  Null.fromJson(v);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}

enum PatternFillType {
  Tile,
  Fill,
  Stretch,
  Fit,
}

class Page {
  String sClass;
  String doObjectID;
  int booleanOperation;
  bool isFixedToViewport;
  bool isFlippedHorizontal;
  bool isFlippedVertical;
  bool isLocked;
  bool isVisible;
  int layerListExpandedType;
  String name;
  bool nameIsFixed;
  int resizingConstraint;
  int resizingType;
  double rotation;
  bool shouldBreakMaskChain;
  UserInfo userInfo;
  ExportOptions exportOptions;
  Frame frame;
  int clippingMaskMode;
  bool hasClippingMask;
  Style style;
  bool hasClickThrough;
  GroupLayout groupLayout;
  List<Layer> layers;
  bool includeInCloudUpload;
  HorizontalRulerData horizontalRulerData;
  HorizontalRulerData verticalRulerData;

  Page(
      {this.sClass,
      this.doObjectID,
      this.booleanOperation,
      this.isFixedToViewport,
      this.isFlippedHorizontal,
      this.isFlippedVertical,
      this.isLocked,
      this.isVisible,
      this.layerListExpandedType,
      this.name,
      this.nameIsFixed,
      this.resizingConstraint,
      this.resizingType,
      this.rotation,
      this.shouldBreakMaskChain,
      this.userInfo,
      this.exportOptions,
      this.frame,
      this.clippingMaskMode,
      this.hasClippingMask,
      this.style,
      this.hasClickThrough,
      this.groupLayout,
      this.layers,
      this.includeInCloudUpload,
      this.horizontalRulerData,
      this.verticalRulerData});

  Page.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    doObjectID = json['do_objectID'];
    booleanOperation = json['booleanOperation'];
    isFixedToViewport = json['isFixedToViewport'];
    isFlippedHorizontal = json['isFlippedHorizontal'];
    isFlippedVertical = json['isFlippedVertical'];
    isLocked = json['isLocked'];
    isVisible = json['isVisible'];
    layerListExpandedType = json['layerListExpandedType'];
    name = json['name'];
    nameIsFixed = json['nameIsFixed'];
    resizingConstraint = json['resizingConstraint'];
    resizingType = json['resizingType'];
    rotation = json['rotation'].toDouble();
    shouldBreakMaskChain = json['shouldBreakMaskChain'];
    userInfo = json['userInfo'] != null ? new UserInfo.fromJson(json['userInfo']) : null;
    exportOptions = json['exportOptions'] != null ? new ExportOptions.fromJson(json['exportOptions']) : null;
    frame = json['frame'] != null ? new Frame.fromJson(json['frame']) : null;
    clippingMaskMode = json['clippingMaskMode'];
    hasClippingMask = json['hasClippingMask'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    hasClickThrough = json['hasClickThrough'];
    groupLayout = json['groupLayout'] != null ? new GroupLayout.fromJson(json['groupLayout']) : null;
    if (json['layers'] != null) {
      layers = new List<Layer>();
      json['layers'].forEach((v) {
        layers.add(new Layer.fromJson(v));
      });
    }
    includeInCloudUpload = json['includeInCloudUpload'];
    horizontalRulerData = json['horizontalRulerData'] != null ? new HorizontalRulerData.fromJson(json['horizontalRulerData']) : null;
    verticalRulerData = json['verticalRulerData'] != null ? new HorizontalRulerData.fromJson(json['verticalRulerData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['do_objectID'] = this.doObjectID;
    data['booleanOperation'] = this.booleanOperation;
    data['isFixedToViewport'] = this.isFixedToViewport;
    data['isFlippedHorizontal'] = this.isFlippedHorizontal;
    data['isFlippedVertical'] = this.isFlippedVertical;
    data['isLocked'] = this.isLocked;
    data['isVisible'] = this.isVisible;
    data['layerListExpandedType'] = this.layerListExpandedType;
    data['name'] = this.name;
    data['nameIsFixed'] = this.nameIsFixed;
    data['resizingConstraint'] = this.resizingConstraint;
    data['resizingType'] = this.resizingType;
    data['rotation'] = this.rotation;
    data['shouldBreakMaskChain'] = this.shouldBreakMaskChain;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    if (this.exportOptions != null) {
      data['exportOptions'] = this.exportOptions.toJson();
    }
    if (this.frame != null) {
      data['frame'] = this.frame.toJson();
    }
    data['clippingMaskMode'] = this.clippingMaskMode;
    data['hasClippingMask'] = this.hasClippingMask;
    if (this.style != null) {
      data['style'] = this.style.toJson();
    }
    data['hasClickThrough'] = this.hasClickThrough;
    if (this.groupLayout != null) {
      data['groupLayout'] = this.groupLayout.toJson();
    }
    if (this.layers != null) {
      data['layers'] = this.layers.map((v) => v.toJson()).toList();
    }
    data['includeInCloudUpload'] = this.includeInCloudUpload;
    if (this.horizontalRulerData != null) {
      data['horizontalRulerData'] = this.horizontalRulerData.toJson();
    }
    if (this.verticalRulerData != null) {
      data['verticalRulerData'] = this.verticalRulerData.toJson();
    }
    return data;
  }
}

class UserInfo {
  ComAnimaappStcSketchPlugin comAnimaappStcSketchPlugin;
  List<dynamic> keyframeActions;
  UserInfo({this.comAnimaappStcSketchPlugin});

  UserInfo.fromJson(Map<String, dynamic> json) {
    if (json['firts-plugin'] != null) {
      keyframeActions = jsonDecode(json['firts-plugin']['keyframeActions']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comAnimaappStcSketchPlugin != null) {
      data['com.animaapp.stc-sketch-plugin'] = this.comAnimaappStcSketchPlugin.toJson();
    }
    return data;
  }
}

class ComAnimaappStcSketchPlugin {
  int comAnimaappUsesAnima;

  ComAnimaappStcSketchPlugin({this.comAnimaappUsesAnima});

  ComAnimaappStcSketchPlugin.fromJson(Map<String, dynamic> json) {
    comAnimaappUsesAnima = json['com.animaapp.uses.anima'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['com.animaapp.uses.anima'] = this.comAnimaappUsesAnima;
    return data;
  }
}

class ExportOptions {
  String sClass;
  List<Null> includedLayerIds;
  int layerOptions;
  bool shouldTrim;
  List<Null> exportFormats;

  ExportOptions({this.sClass, this.includedLayerIds, this.layerOptions, this.shouldTrim, this.exportFormats});

  ExportOptions.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    if (json['includedLayerIds'] != null) {
      includedLayerIds = new List<Null>();
      json['includedLayerIds'].forEach((v) {
        includedLayerIds.add(new Null.fromJson(v));
      });
    }
    layerOptions = json['layerOptions'];
    shouldTrim = json['shouldTrim'];
    if (json['exportFormats'] != null) {
      exportFormats = new List<Null>();
      json['exportFormats'].forEach((v) {
        exportFormats.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    if (this.includedLayerIds != null) {
      data['includedLayerIds'] = this.includedLayerIds.map((v) => v.toJson()).toList();
    }
    data['layerOptions'] = this.layerOptions;
    data['shouldTrim'] = this.shouldTrim;
    if (this.exportFormats != null) {
      data['exportFormats'] = this.exportFormats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RxFrame {
  final width = 0.0.obs;
  final height = 0.0.obs;
  final x = 0.0.obs;
  final y = 0.0.obs;
}

class Frame {
  final rx = RxFrame();

  String sClass;
  bool constrainProportions;

  get width => rx.width.value;
  set width(value) => rx.width.value = value;

  get height => rx.height.value;
  set height(value) => rx.height.value = value;

  get x => rx.x.value;
  set x(value) => rx.x.value = value;

  get y => rx.y.value;
  set y(value) => rx.y.value = value;

  Frame({sClass, constrainProportions});

  Frame.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    constrainProportions = json['constrainProportions'];
    height = json['height'].toDouble();
    width = json['width'].toDouble();
    x = json['x'].toDouble();
    y = json['y'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['constrainProportions'] = this.constrainProportions;
    data['height'] = this.height;
    data['width'] = this.width;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }

  Frame operator -(Frame comp) {
    // double dw = width - comp.width;
    // double dh = height - comp.height;
    // double dx = x - comp.x;
    // double dy = y - comp.y;

    double dw = comp.width - width;
    double dh = comp.height - height;
    double dx = comp.x - x;
    double dy = comp.y - y;

    Frame diffFrame = Frame();
    diffFrame.width = dw;
    diffFrame.height = dh;
    diffFrame.x = dx;
    diffFrame.y = dy;

    return diffFrame;
  }
}

class Style {
  String sClass;
  String doObjectID;
  int endMarkerType;
  int miterLimit;
  int startMarkerType;
  TextStyle textStyle;
  int windingRule;
  Blur blur;
  BorderOptions borderOptions;
  List<Border> borders;
  ColorControls colorControls;
  ContextSettings contextSettings;
  List<Fill> fills;
  List<Null> innerShadows;
  List<Null> shadows;

  Style(
      {this.sClass,
      this.doObjectID,
      this.endMarkerType,
      this.miterLimit,
      this.startMarkerType,
      this.textStyle,
      this.windingRule,
      this.blur,
      this.borderOptions,
      this.borders,
      this.colorControls,
      this.contextSettings,
      this.fills,
      this.innerShadows,
      this.shadows});

  Style.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    doObjectID = json['do_objectID'];
    endMarkerType = json['endMarkerType'];
    miterLimit = json['miterLimit'];
    startMarkerType = json['startMarkerType'];

    textStyle = json['textStyle'] != null ? new TextStyle.fromJson(json['textStyle']) : null;

    windingRule = json['windingRule'];
    blur = json['blur'] != null ? new Blur.fromJson(json['blur']) : null;
    borderOptions = json['borderOptions'] != null ? new BorderOptions.fromJson(json['borderOptions']) : null;
    if (json['borders'] != null) {
      borders = new List<Border>();
      json['borders'].forEach((v) {
        borders.add(new Border.fromJson(v));
      });
    }
    colorControls = json['colorControls'] != null ? new ColorControls.fromJson(json['colorControls']) : null;
    contextSettings = json['contextSettings'] != null ? new ContextSettings.fromJson(json['contextSettings']) : null;
    if (json['fills'] != null) {
      fills = new List<Fill>();
      json['fills'].forEach((v) {
        fills.add(new Fill.fromJson(v));
      });
    }
    if (json['innerShadows'] != null) {
      innerShadows = new List<Null>();
      json['innerShadows'].forEach((v) {
        innerShadows.add(new Null.fromJson(v));
      });
    }
    if (json['shadows'] != null) {
      shadows = new List<Null>();
      json['shadows'].forEach((v) {
        shadows.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['do_objectID'] = this.doObjectID;
    data['endMarkerType'] = this.endMarkerType;
    data['miterLimit'] = this.miterLimit;
    data['startMarkerType'] = this.startMarkerType;
    if (this.textStyle != null) {
      data['textStyle'] = this.textStyle.toJson();
    }
    data['windingRule'] = this.windingRule;
    if (this.blur != null) {
      data['blur'] = this.blur.toJson();
    }
    if (this.borderOptions != null) {
      data['borderOptions'] = this.borderOptions.toJson();
    }
    if (this.borders != null) {
      data['borders'] = this.borders.map((v) => v.toJson()).toList();
    }
    if (this.colorControls != null) {
      data['colorControls'] = this.colorControls.toJson();
    }
    if (this.contextSettings != null) {
      data['contextSettings'] = this.contextSettings.toJson();
    }
    if (this.fills != null) {
      data['fills'] = this.fills.map((v) => v.toJson()).toList();
    }
    if (this.innerShadows != null) {
      data['innerShadows'] = this.innerShadows.map((v) => v.toJson()).toList();
    }
    if (this.shadows != null) {
      data['shadows'] = this.shadows.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Style operator -(Style comp) {
    Style diff = Style();
    diff.fills = fills.asMap().entries.map((entry) {
      int idx = entry.key;
      return comp.fills[idx] - fills[idx];
    }).toList();
    return diff;
  }
}

class Blur {
  String sClass;
  bool isEnabled;
  String center;
  double motionAngle;
  double radius;
  double saturation;
  int type;

  Blur({this.sClass, this.isEnabled, this.center, this.motionAngle, this.radius, this.saturation, this.type});

  Blur.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    isEnabled = json['isEnabled'];
    center = json['center'];
    motionAngle = json['motionAngle'].toDouble();
    radius = json['radius'].toDouble();
    saturation = json['saturation'].toDouble();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['isEnabled'] = this.isEnabled;
    data['center'] = this.center;
    data['motionAngle'] = this.motionAngle;
    data['radius'] = this.radius;
    data['saturation'] = this.saturation;
    data['type'] = this.type;
    return data;
  }
}

class BorderOptions {
  String sClass;
  bool isEnabled;
  List<Null> dashPattern;
  int lineCapStyle;
  int lineJoinStyle;

  BorderOptions({this.sClass, this.isEnabled, this.dashPattern, this.lineCapStyle, this.lineJoinStyle});

  BorderOptions.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    isEnabled = json['isEnabled'];
    if (json['dashPattern'] != null) {
      dashPattern = new List<Null>();
      json['dashPattern'].forEach((v) {
        dashPattern.add(new Null.fromJson(v));
      });
    }
    lineCapStyle = json['lineCapStyle'];
    lineJoinStyle = json['lineJoinStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['isEnabled'] = this.isEnabled;
    if (this.dashPattern != null) {
      data['dashPattern'] = this.dashPattern.map((v) => v.toJson()).toList();
    }
    data['lineCapStyle'] = this.lineCapStyle;
    data['lineJoinStyle'] = this.lineJoinStyle;
    return data;
  }
}

class ColorControls {
  String sClass;
  bool isEnabled;
  int brightness;
  int contrast;
  int hue;
  int saturation;

  ColorControls({this.sClass, this.isEnabled, this.brightness, this.contrast, this.hue, this.saturation});

  ColorControls.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    isEnabled = json['isEnabled'];
    brightness = json['brightness'];
    contrast = json['contrast'];
    hue = json['hue'];
    saturation = json['saturation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['isEnabled'] = this.isEnabled;
    data['brightness'] = this.brightness;
    data['contrast'] = this.contrast;
    data['hue'] = this.hue;
    data['saturation'] = this.saturation;
    return data;
  }
}

class ContextSettings {
  String sClass;
  int blendMode;
  double opacity;

  ContextSettings({this.sClass, this.blendMode, this.opacity});

  ContextSettings.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    blendMode = json['blendMode'];
    opacity = json['opacity'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['blendMode'] = this.blendMode;
    data['opacity'] = this.opacity;
    return data;
  }
}

class GroupLayout {
  String sClass;

  GroupLayout({this.sClass});

  GroupLayout.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    return data;
  }
}

class RxLayer {
  final frame = Frame().obs;
}

class Layer {
  final rx = RxLayer();

  String sClass;
  String doObjectID;
  int booleanOperation;
  bool isFixedToViewport;
  bool isFlippedHorizontal;
  bool isFlippedVertical;
  bool isLocked;
  bool isVisible;
  int layerListExpandedType;
  String name;
  bool nameIsFixed;
  int resizingConstraint;
  int resizingType;
  double rotation;
  bool shouldBreakMaskChain;
  ExportOptions exportOptions;

  get frame => rx.frame.value;
  set frame(value) => rx.frame.value = value;

  int clippingMaskMode;
  bool hasClippingMask;
  Style style;
  AttributedString attributedString;
  bool hasClickThrough;
  GroupLayout groupLayout;
  List<Layer> layers;
  bool hasBackgroundColor;
  bool includeBackgroundColorInExport;
  bool includeInCloudUpload;
  bool isFlowHome;
  PresetDictionary presetDictionary;
  bool resizesContent;
  BackgroundColor backgroundColor;
  HorizontalRulerData horizontalRulerData;
  HorizontalRulerData verticalRulerData;
  UserInfo userInfo;

  List<Point> points;

  Layer(
      {this.sClass,
      this.doObjectID,
      this.booleanOperation,
      this.isFixedToViewport,
      this.isFlippedHorizontal,
      this.isFlippedVertical,
      this.isLocked,
      this.isVisible,
      this.layerListExpandedType,
      this.name,
      this.nameIsFixed,
      this.resizingConstraint,
      this.resizingType,
      this.rotation,
      this.shouldBreakMaskChain,
      this.exportOptions,
      frame,
      this.clippingMaskMode,
      this.hasClippingMask,
      this.style,
      this.attributedString,
      this.hasClickThrough,
      this.groupLayout,
      this.layers,
      this.hasBackgroundColor,
      this.includeBackgroundColorInExport,
      this.includeInCloudUpload,
      this.isFlowHome,
      this.presetDictionary,
      this.resizesContent,
      this.backgroundColor,
      this.horizontalRulerData,
      this.verticalRulerData,
      this.points,
      this.userInfo});

  Layer.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    doObjectID = json['do_objectID'];
    booleanOperation = json['booleanOperation'];
    isFixedToViewport = json['isFixedToViewport'];
    isFlippedHorizontal = json['isFlippedHorizontal'];
    isFlippedVertical = json['isFlippedVertical'];
    isLocked = json['isLocked'];
    isVisible = json['isVisible'];
    layerListExpandedType = json['layerListExpandedType'];
    name = json['name'];
    nameIsFixed = json['nameIsFixed'];
    resizingConstraint = json['resizingConstraint'];
    resizingType = json['resizingType'];
    rotation = json['rotation'].toDouble();
    shouldBreakMaskChain = json['shouldBreakMaskChain'];
    exportOptions = json['exportOptions'] != null ? new ExportOptions.fromJson(json['exportOptions']) : null;
    frame = json['frame'] != null ? new Frame.fromJson(json['frame']) : null;
    clippingMaskMode = json['clippingMaskMode'];
    hasClippingMask = json['hasClippingMask'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    attributedString = json['attributedString'] != null ? new AttributedString.fromJson(json['attributedString']) : null;
    hasClickThrough = json['hasClickThrough'];
    groupLayout = json['groupLayout'] != null ? new GroupLayout.fromJson(json['groupLayout']) : null;
    if (json['layers'] != null) {
      layers = new List<Layer>();
      json['layers'].forEach((v) {
        layers.add(new Layer.fromJson(v));
      });
    }
    hasBackgroundColor = json['hasBackgroundColor'];
    includeBackgroundColorInExport = json['includeBackgroundColorInExport'];
    includeInCloudUpload = json['includeInCloudUpload'];
    isFlowHome = json['isFlowHome'];
    presetDictionary = json['presetDictionary'] != null ? new PresetDictionary.fromJson(json['presetDictionary']) : null;
    resizesContent = json['resizesContent'];
    backgroundColor = json['backgroundColor'] != null ? new BackgroundColor.fromJson(json['backgroundColor']) : null;
    horizontalRulerData = json['horizontalRulerData'] != null ? new HorizontalRulerData.fromJson(json['horizontalRulerData']) : null;
    verticalRulerData = json['verticalRulerData'] != null ? new HorizontalRulerData.fromJson(json['verticalRulerData']) : null;
    if (json['points'] != null) {
      points = new List<Point>();
      json['points'].forEach((v) {
        points.add(new Point.fromJson(v));
      });
    }
    userInfo = json['userInfo'] != null ? new UserInfo.fromJson(json['userInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['do_objectID'] = this.doObjectID;
    data['booleanOperation'] = this.booleanOperation;
    data['isFixedToViewport'] = this.isFixedToViewport;
    data['isFlippedHorizontal'] = this.isFlippedHorizontal;
    data['isFlippedVertical'] = this.isFlippedVertical;
    data['isLocked'] = this.isLocked;
    data['isVisible'] = this.isVisible;
    data['layerListExpandedType'] = this.layerListExpandedType;
    data['name'] = this.name;
    data['nameIsFixed'] = this.nameIsFixed;
    data['resizingConstraint'] = this.resizingConstraint;
    data['resizingType'] = this.resizingType;
    data['rotation'] = this.rotation;
    data['shouldBreakMaskChain'] = this.shouldBreakMaskChain;
    if (this.exportOptions != null) {
      data['exportOptions'] = this.exportOptions.toJson();
    }
    if (this.frame != null) {
      data['frame'] = this.frame.toJson();
    }
    data['clippingMaskMode'] = this.clippingMaskMode;
    data['hasClippingMask'] = this.hasClippingMask;
    if (this.style != null) {
      data['style'] = this.style.toJson();
    }
    if (this.attributedString != null) {
      data['attributedString'] = this.attributedString.toJson();
    }
    data['hasClickThrough'] = this.hasClickThrough;
    if (this.groupLayout != null) {
      data['groupLayout'] = this.groupLayout.toJson();
    }
    if (this.layers != null) {
      data['layers'] = this.layers.map((v) => v.toJson()).toList();
    }
    data['hasBackgroundColor'] = this.hasBackgroundColor;
    data['includeBackgroundColorInExport'] = this.includeBackgroundColorInExport;
    data['includeInCloudUpload'] = this.includeInCloudUpload;
    data['isFlowHome'] = this.isFlowHome;
    if (this.presetDictionary != null) {
      data['presetDictionary'] = this.presetDictionary.toJson();
    }
    data['resizesContent'] = this.resizesContent;
    if (this.backgroundColor != null) {
      data['backgroundColor'] = this.backgroundColor.toJson();
    }
    if (this.horizontalRulerData != null) {
      data['horizontalRulerData'] = this.horizontalRulerData.toJson();
    }
    if (this.verticalRulerData != null) {
      data['verticalRulerData'] = this.verticalRulerData.toJson();
    }
    if (this.points != null) {
      data['points'] = this.points.map((v) => v.toJson()).toList();
    }
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    return data;
  }

  Layer operator -(Layer comp) {
    Layer diffLayer = Layer();

    diffLayer.rotation = comp.rotation - rotation;
    diffLayer.frame = comp.frame - frame;
    diffLayer.style = comp.style - style;
    diffLayer.points = points.asMap().entries.map((entry) {
      int index = entry.key;
      return comp.points[index] - points[index];
    }).toList();
    return diffLayer;
  }
}

class ExportFormats {
  String sClass;
  int absoluteSize;
  String fileFormat;
  String name;
  int namingScheme;
  int scale;
  int visibleScaleType;

  ExportFormats({this.sClass, this.absoluteSize, this.fileFormat, this.name, this.namingScheme, this.scale, this.visibleScaleType});

  ExportFormats.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    absoluteSize = json['absoluteSize'];
    fileFormat = json['fileFormat'];
    name = json['name'];
    namingScheme = json['namingScheme'];
    scale = json['scale'];
    visibleScaleType = json['visibleScaleType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['absoluteSize'] = this.absoluteSize;
    data['fileFormat'] = this.fileFormat;
    data['name'] = this.name;
    data['namingScheme'] = this.namingScheme;
    data['scale'] = this.scale;
    data['visibleScaleType'] = this.visibleScaleType;
    return data;
  }
}

class PresetDictionary {
  int height;
  int offersLandscapeVariant;
  String name;
  int allowResizedMatching;
  int width;

  PresetDictionary({this.height, this.offersLandscapeVariant, this.name, this.allowResizedMatching, this.width});

  PresetDictionary.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    offersLandscapeVariant = json['offersLandscapeVariant'];
    name = json['name'];
    allowResizedMatching = json['allowResizedMatching'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['offersLandscapeVariant'] = this.offersLandscapeVariant;
    data['name'] = this.name;
    data['allowResizedMatching'] = this.allowResizedMatching;
    data['width'] = this.width;
    return data;
  }
}

class BackgroundColor {
  String sClass;
  double alpha;
  double blue;
  double green;
  double red;

  BackgroundColor({this.sClass, this.alpha, this.blue, this.green, this.red});

  BackgroundColor.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    alpha = json['alpha'].toDouble();
    blue = json['blue'].toDouble();
    green = json['green'].toDouble();
    red = json['red'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['alpha'] = this.alpha;
    data['blue'] = this.blue;
    data['green'] = this.green;
    data['red'] = this.red;
    return data;
  }
}

class HorizontalRulerData {
  String sClass;
  int base;
  List<Null> guides;

  HorizontalRulerData({this.sClass, this.base, this.guides});

  HorizontalRulerData.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    base = json['base'];
    if (json['guides'] != null) {
      guides = new List<Null>();
      json['guides'].forEach((v) {
        guides.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['base'] = this.base;
    if (this.guides != null) {
      data['guides'] = this.guides.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ComBohemiancodingSketchtoolDetach {
  SymbolInstance symbolInstance;
  SymbolMaster symbolMaster;

  ComBohemiancodingSketchtoolDetach({this.symbolInstance, this.symbolMaster});

  ComBohemiancodingSketchtoolDetach.fromJson(Map<String, dynamic> json) {
    symbolInstance = json['symbolInstance'] != null ? new SymbolInstance.fromJson(json['symbolInstance']) : null;
    symbolMaster = json['symbolMaster'] != null ? new SymbolMaster.fromJson(json['symbolMaster']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.symbolInstance != null) {
      data['symbolInstance'] = this.symbolInstance.toJson();
    }
    if (this.symbolMaster != null) {
      data['symbolMaster'] = this.symbolMaster.toJson();
    }
    return data;
  }
}

class SymbolInstance {
  String doObjectID;
  Frame frame;

  SymbolInstance({this.doObjectID, this.frame});

  SymbolInstance.fromJson(Map<String, dynamic> json) {
    doObjectID = json['do_objectID'];
    frame = json['frame'] != null ? new Frame.fromJson(json['frame']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['do_objectID'] = this.doObjectID;
    if (this.frame != null) {
      data['frame'] = this.frame.toJson();
    }
    return data;
  }
}

class SymbolMaster {
  String doObjectID;
  String symbolID;

  SymbolMaster({this.doObjectID, this.symbolID});

  SymbolMaster.fromJson(Map<String, dynamic> json) {
    doObjectID = json['do_objectID'];
    symbolID = json['symbolID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['do_objectID'] = this.doObjectID;
    data['symbolID'] = this.symbolID;
    return data;
  }
}

class Border {
  String sClass;
  bool isEnabled;
  int fillType;
  Color color;
  ContextSettings contextSettings;
  Gradient gradient;
  double position;
  double thickness;

  Border({this.sClass, this.isEnabled, this.fillType, this.color, this.contextSettings, this.gradient, this.position, this.thickness});

  Border.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    isEnabled = json['isEnabled'];
    fillType = json['fillType'];
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    contextSettings = json['contextSettings'] != null ? new ContextSettings.fromJson(json['contextSettings']) : null;
    gradient = json['gradient'] != null ? new Gradient.fromJson(json['gradient']) : null;
    position = json['position'].toDouble();
    thickness = json['thickness'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['isEnabled'] = this.isEnabled;
    data['fillType'] = this.fillType;
    if (this.color != null) {
      data['color'] = this.color.toJson();
    }
    if (this.contextSettings != null) {
      data['contextSettings'] = this.contextSettings.toJson();
    }
    if (this.gradient != null) {
      data['gradient'] = this.gradient.toJson();
    }
    data['position'] = this.position;
    data['thickness'] = this.thickness;
    return data;
  }
}

class Color {
  String sClass;
  double alpha;
  double blue;
  double green;
  double red;

  Color({this.sClass, this.alpha, this.blue, this.green, this.red});

  Color.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    alpha = json['alpha'].toDouble();
    blue = json['blue'].toDouble();
    green = json['green'].toDouble();
    red = json['red'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['alpha'] = this.alpha;
    data['blue'] = this.blue;
    data['green'] = this.green;
    data['red'] = this.red;
    return data;
  }

  Color operator -(Color comp) {
    Color diff = Color();

    diff.alpha = comp.alpha - alpha;
    diff.red = comp.red - red;
    diff.green = comp.green - green;
    diff.blue = comp.blue - blue;

    return diff;
  }
}

class Gradient {
  String sClass;
  int elipseLength;
  String from;
  int gradientType;
  String to;
  List<Stop> stops;

  Gradient({this.sClass, this.elipseLength, this.from, this.gradientType, this.to, this.stops});

  Gradient.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    elipseLength = json['elipseLength'];
    from = json['from'];
    gradientType = json['gradientType'];
    to = json['to'];
    if (json['stops'] != null) {
      stops = new List<Stop>();
      json['stops'].forEach((v) {
        stops.add(new Stop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['elipseLength'] = this.elipseLength;
    data['from'] = this.from;
    data['gradientType'] = this.gradientType;
    data['to'] = this.to;
    if (this.stops != null) {
      data['stops'] = this.stops.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stop {
  String sClass;
  int position;
  Color color;

  Stop({this.sClass, this.position, this.color});

  Stop.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    position = json['position'];
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['position'] = this.position;
    if (this.color != null) {
      data['color'] = this.color.toJson();
    }
    return data;
  }
}

class Image {
  String sClass;
  String sRefClass;
  String sRef;

  Image({this.sClass, this.sRefClass, this.sRef});

  Image.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    sRefClass = json['_ref_class'];
    sRef = json['_ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['_ref_class'] = this.sRefClass;
    data['_ref'] = this.sRef;
    return data;
  }
}

class Fill {
  String sClass;
  bool isEnabled;
  int fillType;
  Color color;
  ContextSettings contextSettings;
  Gradient gradient;
  Image image;
  int noiseIndex;
  int noiseIntensity;
  PatternFillType patternFillType;
  int patternTileScale;

  Fill(
      {this.sClass,
      this.isEnabled,
      this.fillType,
      this.color,
      this.contextSettings,
      this.gradient,
      this.image,
      this.noiseIndex,
      this.noiseIntensity,
      this.patternFillType,
      this.patternTileScale});

  Fill.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    isEnabled = json['isEnabled'];
    fillType = json['fillType'];
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    contextSettings = json['contextSettings'] != null ? new ContextSettings.fromJson(json['contextSettings']) : null;
    gradient = json['gradient'] != null ? new Gradient.fromJson(json['gradient']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    noiseIndex = json['noiseIndex'];
    noiseIntensity = json['noiseIntensity'];

    if (json['patternFillType'] is PatternFillType) {
      patternFillType = PatternFillType.values[json['patternFillType'].index];
    } else {
      patternFillType = PatternFillType.values[json['patternFillType']];
    }
    patternTileScale = json['patternTileScale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['isEnabled'] = this.isEnabled;
    data['fillType'] = this.fillType;
    if (this.color != null) {
      data['color'] = this.color.toJson();
    }
    if (this.contextSettings != null) {
      data['contextSettings'] = this.contextSettings.toJson();
    }
    if (this.gradient != null) {
      data['gradient'] = this.gradient.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['noiseIndex'] = this.noiseIndex;
    data['noiseIntensity'] = this.noiseIntensity;
    data['patternFillType'] = this.patternFillType;
    data['patternTileScale'] = this.patternTileScale;
    return data;
  }

  Fill operator -(Fill comp) {
    Fill diff = Fill();
    diff.color = comp.color - color;
    return diff;
  }
}

class Point {
  String sClass;
  int cornerRadius;
  Math.Point curveFrom;
  int curveMode;
  Math.Point curveTo;
  bool hasCurveFrom;
  bool hasCurveTo;
  Math.Point point;

  Point({this.sClass, this.cornerRadius, this.curveFrom, this.curveMode, this.curveTo, this.hasCurveFrom, this.hasCurveTo, this.point});

  Point.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    cornerRadius = json['cornerRadius'];
    curveFrom = json['curveFrom'].runtimeType == String ? parseSketchPointToPoint(json['curveFrom']) : json['curveFrom'];
    curveMode = json['curveMode'];
    curveTo = json['curveTo'].runtimeType == String ? parseSketchPointToPoint(json['curveTo']) : json['curveTo'];
    hasCurveFrom = json['hasCurveFrom'];
    hasCurveTo = json['hasCurveTo'];
    point = json['point'].runtimeType == String ? parseSketchPointToPoint(json['point']) : json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['cornerRadius'] = this.cornerRadius;
    data['curveFrom'] = this.curveFrom;
    data['curveMode'] = this.curveMode;
    data['curveTo'] = this.curveTo;
    data['hasCurveFrom'] = this.hasCurveFrom;
    data['hasCurveTo'] = this.hasCurveTo;
    data['point'] = this.point;
    return data;
  }

  Point operator -(Point comp) {
    Point diff = Point();

    diff.curveFrom = comp.curveFrom - curveFrom;
    diff.curveTo = comp.curveTo - curveTo;
    diff.point = comp.point - point;

    return diff;
  }
}

class ComSketchDetach {
  SharedStyle sharedStyle;

  ComSketchDetach({this.sharedStyle});

  ComSketchDetach.fromJson(Map<String, dynamic> json) {
    sharedStyle = json['sharedStyle'] != null ? new SharedStyle.fromJson(json['sharedStyle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sharedStyle != null) {
      data['sharedStyle'] = this.sharedStyle.toJson();
    }
    return data;
  }
}

class SharedStyle {
  String sharedStyleName;
  String sharedStyleId;

  SharedStyle({this.sharedStyleName, this.sharedStyleId});

  SharedStyle.fromJson(Map<String, dynamic> json) {
    sharedStyleName = json['sharedStyleName'];
    sharedStyleId = json['sharedStyleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sharedStyleName'] = this.sharedStyleName;
    data['sharedStyleId'] = this.sharedStyleId;
    return data;
  }
}

class TextStyle {
  String sClass;
  EncodedAttributes encodedAttributes;
  int verticalAlignment;

  TextStyle({this.sClass, this.encodedAttributes, this.verticalAlignment});

  TextStyle.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    encodedAttributes = json['encodedAttributes'] != null ? new EncodedAttributes.fromJson(json['encodedAttributes']) : null;
    verticalAlignment = json['verticalAlignment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    if (this.encodedAttributes != null) {
      data['encodedAttributes'] = this.encodedAttributes.toJson();
    }
    data['verticalAlignment'] = this.verticalAlignment;
    return data;
  }
}

class EncodedAttributes {
  MSAttributedStringColorAttribute mSAttributedStringColorAttribute;
  int textStyleVerticalAlignmentKey;
  MSAttributedStringFontAttribute mSAttributedStringFontAttribute;

  EncodedAttributes({this.mSAttributedStringColorAttribute, this.textStyleVerticalAlignmentKey, this.mSAttributedStringFontAttribute});

  EncodedAttributes.fromJson(Map<String, dynamic> json) {
    mSAttributedStringColorAttribute = json['MSAttributedStringColorAttribute'] != null
        ? new MSAttributedStringColorAttribute.fromJson(json['MSAttributedStringColorAttribute'])
        : null;
    textStyleVerticalAlignmentKey = json['textStyleVerticalAlignmentKey'];
    mSAttributedStringFontAttribute = json['MSAttributedStringFontAttribute'] != null
        ? new MSAttributedStringFontAttribute.fromJson(json['MSAttributedStringFontAttribute'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mSAttributedStringColorAttribute != null) {
      data['MSAttributedStringColorAttribute'] = this.mSAttributedStringColorAttribute.toJson();
    }
    data['textStyleVerticalAlignmentKey'] = this.textStyleVerticalAlignmentKey;
    if (this.mSAttributedStringFontAttribute != null) {
      data['MSAttributedStringFontAttribute'] = this.mSAttributedStringFontAttribute.toJson();
    }
    return data;
  }
}

class MSAttributedStringColorAttribute {
  String sClass;
  int alpha;
  int blue;
  int green;
  int red;

  MSAttributedStringColorAttribute({this.sClass, this.alpha, this.blue, this.green, this.red});

  MSAttributedStringColorAttribute.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    alpha = json['alpha'];
    blue = json['blue'];
    green = json['green'];
    red = json['red'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['alpha'] = this.alpha;
    data['blue'] = this.blue;
    data['green'] = this.green;
    data['red'] = this.red;
    return data;
  }
}

class MSAttributedStringFontAttribute {
  String sClass;
  Attributes attributes;

  MSAttributedStringFontAttribute({this.sClass, this.attributes});

  MSAttributedStringFontAttribute.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    attributes = json['attributes'] != null ? new Attributes.fromJson(json['attributes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class Attributes {
  String name;
  int size;

  Attributes({this.name, this.size});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['size'] = this.size;
    return data;
  }
}

class AttributedString {
  String sClass;
  String string;
  List<Attributes> attributes;

  AttributedString({this.sClass, this.string, this.attributes});

  AttributedString.fromJson(Map<String, dynamic> json) {
    sClass = json['_class'];
    string = json['string'];
    if (json['attributes'] != null) {
      attributes = new List<Attributes>();
      json['attributes'].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_class'] = this.sClass;
    data['string'] = this.string;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
