const fs = require('fs')
const fontkit = require('fontkit')
const unzip = require('unzip')

const SKETCH_FILE_PATH = '/Users/shindonghun/dev/firts-plugin/uxcatch_flutter/assets/sketch/hotel-booking-app-amimoradia.sketch'
const META_JSON = 'meta.json'

async function streamToString(stream:any) {
    return new Promise((resolve) => {
        const chunks: string[] = [];
        stream.on('data', (chunk:string) => {
            chunks.push(chunk.toString());
        });
        stream.on('end', () => {
            resolve(JSON.parse(chunks.join('')))
        });
    })

}


fs.createReadStream(SKETCH_FILE_PATH)
  .pipe(unzip.Parse())
  .on('entry', function (entry:any) {
    var fileName = entry.path;

    // console.log(fileName)

    if (fileName === META_JSON) {
        streamToString(entry).then((result:any) => {
            result.fonts.forEach((fontFullName:string) => {
                const fontName = fontFullName.split('-')[0]
            })
        })
        // entry.pipe(fs.createWriteStream('output/path'));
    } else {
        entry.autodrain();
    }
  });