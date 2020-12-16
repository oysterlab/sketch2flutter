// const fs = require('fs')
const fontkit = require('fontkit')
// const unzip = require('unzip')
const path = require('path')

const fontManager = require('font-manager')

// const SKETCH_FILE_PATH = '/Users/shindonghun/dev/firts-plugin/scatch2flutter_/base_flutter/assets/sketch/hotel-booking-app-amimoradia.sketch'
// const META_JSON = 'meta.json'
const DIST_PATH = 'dist'
// const FONTS_DIST_PATH = path.join(DIST_PATH, 'fonts')
// const IMAGES_DIST_PATH = path.join(DIST_PATH, 'images')

// async function streamToJson(stream:any) {
//   return new Promise((resolve) => {
//     const chunks: string[] = [];
//     stream.on('data', (chunk:string) => {
//       chunks.push(chunk.toString());
//     });
//     stream.on('end', () => {
//         resolve(JSON.parse(chunks.join('')))
//     });
//   }) 
// }

// class Font {

// 	familyName:string
// 	styleNames:string[] = []

// 	constructor(familyName:string) {
// 		this.familyName = familyName
// 	}

// 	build() {
	
// 		this.styleNames.forEach((styleName) => {
// 			const font = fontManager.findFontSync({ family: this.familyName, style: styleName });
			
// 			if (font != null) {
// 				if (font.path.endsWith('.ttc')) {
// 					const collection = fontkit.openSync(font.path)
// 					collection.fonts.forEach((ttf:any) => {
// 						let fontName = ttf.familyName
// 						const fullNameChunks = ttf.fullName.split(' ')
// 						if (fullNameChunks.length > 1) {
// 							fullNameChunks.splice(0, 1)
// 							const styleName = fullNameChunks.join('')
// 							fontName += '-' + styleName
// 						}
						
// 						const fontPath = path.join(FONTS_DIST_PATH, `${fontName}.ttf`)						
						
// 						if (fs.existsSync(fontPath)) return

// 						fs.writeFileSync(fontPath, ttf.stream.buffer)
// 					})
// 				} else {
// 					let fontName = font.family + '-' + font.style
// 					const fontPath = path.join(FONTS_DIST_PATH, `${fontName}.ttf`)						
									
// 					if (fs.existsSync(fontPath)) return
			
// 					fs.createReadStream(font.path).pipe(fs.createWriteStream(fontPath));
// 				}
// 			}
// 		})		
// 	}
// }

// function extractShapeGroupsFromPage(page:any) {
// 	const shapeGroups:any = []

// 	const _extractShapeGroupsFromPage = (layer:any) => {
// 		if (layer._class == "shapeGroup") {
// 			shapeGroups.push(layer)
// 		} else if (layer.hasOwnProperty('layers')) {
// 			layer.layers.forEach((_layer:any) => {
// 				_extractShapeGroupsFromPage(_layer)
// 			})
// 		}
// 	}
// 	_extractShapeGroupsFromPage(page)

// 	return shapeGroups
// }

// function copyImages() {
// 	if (!fs.existsSync(IMAGES_DIST_PATH)) {
// 		fs.mkdirSync(IMAGES_DIST_PATH)
// 	}

// 	fs.createReadStream(SKETCH_FILE_PATH)
// 		.pipe(unzip.Parse())
// 		.on('entry', function (entry:any) {
// 			const srcPath = entry.path;

// 			if (srcPath.startsWith('images/')) {
// 				const fileName = srcPath.replace('images/', '')
// 				const filePath = path.join(IMAGES_DIST_PATH, fileName)
								
// 				if (fs.existsSync(filePath)) return
		
// 				entry.pipe(fs.createWriteStream(filePath))	
// 			} else if (srcPath.startsWith('pages/')) {
// 				console.log(srcPath)
// 				streamToJson(entry).then((result:any) => {
// 					const shapeGroups = extractShapeGroupsFromPage(result)
// 					shapeGroups.forEach((shapeGroup:any) => {
//             console.log(shapeGroup)
// 						// const fileName = shapeGroup.do_objectID + '.svg'
// 						// const filePath = path.join(IMAGES_DIST_PATH, fileName)
// 						// sketch.export(shapeGroup, {
// 						// 	formats: 'svg',
// 						// 	output: filePath
// 						// })
// 					})
// 					console.log(shapeGroups)
// 				})
// 			} else {
// 				entry.autodrain();
// 			}
// 		})	
// }

// function copyFonts() {
// 	if (!fs.existsSync(FONTS_DIST_PATH)) {
// 		fs.mkdirSync(FONTS_DIST_PATH)
// 	}

// 	const fonts:Font[] = []
// 	fs.createReadStream(SKETCH_FILE_PATH)
// 		.pipe(unzip.Parse())
// 		.on('entry', function (entry:any) {
// 			const fileName = entry.path;
	
// 			if (fileName === META_JSON) {
// 				streamToJson(entry).then((result:any) => {
// 						result.fonts.forEach((fontFullName:string) => {
// 								const fontName = fontFullName.split('-')
// 								const fontFamilyName = fontName[0]
								
// 								let font = fonts.find((font) => font.familyName == fontFamilyName);
// 								if (font == null) {
// 									font = new Font(fontFamilyName);
// 									fonts.push(font)
// 								}

// 								if (fontName.length > 1) {
// 									const styleName = fontName[1]
// 									font.styleNames.push(styleName)
// 								}
// 						})
						
// 						fonts.forEach((font) => {
// 							font.build()
// 						})
// 				})
// 			} else {
// 				entry.autodrain();
// 			}
// 		});	
// }


const fs = require('@skpm/fs')

export function exportToFlutter() {
	if (!fs.existsSync(DIST_PATH)) {
		fs.mkdirSync(DIST_PATH)
  }
  
  const fonts = fontManager.getAvailableFontsSync()
  console.log(fontkit)
  console.log(path)
  console.log(fonts)

	// copyImages()
	// copyFonts()
}
