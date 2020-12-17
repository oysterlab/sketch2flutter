import Sketch2Flutter from './Sketch2Flutter'

const SKETCH_FILEPATH = '/Users/shindonghun/dev/firts-plugin/sketch2flutter/base_flutter/assets/sketch/hotel-booking-app-amimoradia.sketch'
const FLUTTER_PATH = '/Users/shindonghun/dev/firts-plugin/sketch2flutter/middleware/sample/prj1608105876851'

const sketch2Flutter = new Sketch2Flutter()
sketch2Flutter.impl(SKETCH_FILEPATH, FLUTTER_PATH)
