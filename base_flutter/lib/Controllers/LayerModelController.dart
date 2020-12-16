import 'package:get/get.dart';
import '../models/sketch/SketchModel.dart' as SketchModel;

class LayerModelController extends GetxController {
  Map<String, SketchModel.AbstractLayer> layers;
  String currentArtboarId;

  LayerModelController() {
    this.layers = Map<String, SketchModel.AbstractLayer>();
    this.currentArtboarId = null;
  }
}
