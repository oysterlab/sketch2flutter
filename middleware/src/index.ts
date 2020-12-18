import Sketch2Flutter from './Sketch2Flutter'

const SKETCH_FILEPATH = '/Users/shindonghun/dev/firts-plugin/sketch2flutter/base_flutter/assets/sketch/sketch_file.sketch'
// const FLUTTER_PATH = '/Users/shindonghun/dev/firts-plugin/sketch2flutter/middleware/sample'
var FLUTTER_PATH = '/Users/shindonghun/dev/temp'

const sketch2Flutter = new Sketch2Flutter() 
sketch2Flutter.impl(SKETCH_FILEPATH, FLUTTER_PATH) 
 