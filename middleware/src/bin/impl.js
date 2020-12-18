#!/usr/bin/env node

import Sketch2Flutter from '../Sketch2Flutter'

if (process.argv[2] != null) {
	const sketchPath = process.argv[2]
    const distPath = (process.argv[3] != null) ? process.argv[3] : './'
    const sketch2Flutter = new Sketch2Flutter() 

    console.log(sketchPath)
    sketch2Flutter.impl(sketchPath, distPath)
}