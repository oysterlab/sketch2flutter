import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:get/get.dart';

import './Controllers/LayerModelController.dart';
import './models/sketch/SketchModel.dart' as SketchModel;
import './components/sketch/Sketch.dart' as Sketch;

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
  List<Sketch.AbstractGroup> _layers;
  LayerModelController layerModelController = Get.put(LayerModelController([]));

  @override
  void initState() {
    super.initState();
    _layers = [];
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(
          children: _layers,
        ));
  }

  _init() async {
    var bytes = await rootBundle.load('assets/sketch/hotel-booking-app-amimoradia.sketch');
    var arch = ZipDecoder().decodeBytes(bytes.buffer.asInt8List());

    for (final file in arch) {
      if (file.name.startsWith('pages/') && file.isFile) {
        var pageData = jsonDecode(String.fromCharCodes(file.content));

        SketchModel.Page page = SketchModel.Page.fromMap(pageData);

        print(page);

        // SketchModel.Artboard artboard = page.layers[8];
        // artboard.frame.x = 0;
        // artboard.frame.y = 0;

        // _layers.add(Sketch.AbstractGroup(artboard));

        page.layers.forEach((artboard) {
          _layers.add(Sketch.AbstractGroup(artboard));
        });

        SketchModel.Artboard artboard = page.layers[0];
        artboard.frame.x = 0;
        artboard.frame.y = 0;

        break;
      }
    }

    setState(() {});
    print('done');
  }
}
