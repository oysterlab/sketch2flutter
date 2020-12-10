import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:get/get.dart';

import 'Controllers/LayerModelControllerOld.dart';
import './models/model.dart' as Sketch;
import './models/sketch/SketchModel.dart' as SketchModel;
import './layers/ShapeLayer.dart';

import './enums/ActionType.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(home: UXCatchApp()));
}

class UXCatchApp extends StatefulWidget {
  UXCatchApp({Key key}) : super(key: key);

  @override
  _UXCatchAppState createState() => _UXCatchAppState();
}

class _UXCatchAppState extends State<UXCatchApp> {
  List<Sketch.Layer> _layers;
  List<ShapeLayer> _layerWidgets = [];
  LayerModelController layerModelController = Get.put(LayerModelController([]));

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  Widget build(BuildContext context) {
    return _layers != null
        ? GestureDetector(
            onTapDown: (e) {
              double x = e.globalPosition.dx;
              double y = e.globalPosition.dy;
              _layerWidgets.forEach((shapeLayer) => shapeLayer.hit(x, y, ActionType.onPushDown));
            },
            onTapUp: (e) {
              double x = e.globalPosition.dx;
              double y = e.globalPosition.dy;
              _layerWidgets.forEach((shapeLayer) => shapeLayer.hit(x, y, ActionType.onTap));
            },
            onForcePressStart: (e) {
              print(e);
            },
            child: Container(color: Colors.white, child: _buildLayers(_layers)),
          )
        : Container(
            decoration: BoxDecoration(color: Colors.white),
          );
  }

  Widget _buildLayers(List<Sketch.Layer> layerModels) {
    List<Widget> layers = layerModels.map<Widget>((layerModel) {
      ShapeLayer shapeLayer = ShapeLayer(layerModel, {});

      _layerWidgets.add(shapeLayer);

      Widget layerWidget = Container(
        width: layerModel.frame.width,
        height: layerModel.frame.height,
        child: shapeLayer,
      );

      Sketch.ContextSettings contextSettings = layerModel.style.contextSettings;

      return Obx(() => Opacity(
          opacity: contextSettings != null ? contextSettings.opacity : 1.0,
          child: Container(transform: Matrix4.translationValues(layerModel.frame.x, layerModel.frame.y, 0.0), child: layerWidget)));
    }).toList();

    return Stack(children: layers);
  }

  _init() async {
    var bytes = await rootBundle.load('assets/sketch/hotel-booking-app-amimoradia.sketch');
    var arch = ZipDecoder().decodeBytes(bytes.buffer.asInt8List());

    for (final file in arch) {
      if (file.name.startsWith('pages/') && file.isFile) {
        var pageData = jsonDecode(String.fromCharCodes(file.content));

        SketchModel.Page page = SketchModel.Page.fromMap(pageData);

        print(page);

        Sketch.Page p = Sketch.Page.fromJson(pageData);
        Map<String, Sketch.Layer> flat = flatten(p, true);
        _layers = flat.keys.map((keyName) => flat[keyName]).toList();
        // _layers.forEach((layer) => layerModelController.layers.add(layer));

        setState(() {});
        // print(layers);
        break;
      }
    }
  }

  flatten(var q, bool isLeaf) {
    Map<String, Sketch.Layer> result = {};
    re(var t) {
      if (t.layers is List) {
        t.layers.forEach((v) => re(v));

        if (!isLeaf) {
          result[t.doObjectID] = t;
        }
      } else {
        result[t.doObjectID] = t;
      }
    }

    re(q);
    return result;
  }

  // List<Sketch.Layer> flattenLayers(Sketch.Layer layer) {

  // }
}
