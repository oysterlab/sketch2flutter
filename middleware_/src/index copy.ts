const fs = require('fs')
const fontkit = require('fontkit')
const unzip = require('unzip')
import path from 'path' 

let SKETCH_FILE_PATH = '/Users/shindonghun/dev/firts-plugin/sketch2flutter/base_flutter/assets/sketch/hotel-booking-app-amimoradia.sketch'

if (process.argv[2] != null) {
	SKETCH_FILE_PATH = process.argv[2]
}

const META_JSON = 'meta.json'
const DIST_PATH = 'dist' 
const FONTS_DIST_PATH = path.join(DIST_PATH, 'fonts')
const IMAGES_DIST_PATH = path.join(DIST_PATH, 'images')

const SYSTEM_FONT_PATH = '/System/Library/Fonts'
const LIB_FONT_PATH = '/Library/Fonts'

const fonts = Array.from([SYSTEM_FONT_PATH, LIB_FONT_PATH])
	.reduce((result:any, fontDir:string) => {
		fs.readdirSync(fontDir).forEach((fontName:string) => {
			const fontPath = path.join(fontDir, fontName)
			result.push(fontPath)
		})
	return result
}, [])

async function streamToJson(stream:any) {
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

class Font {

	familyName:string
	styleNames:string[] = []

	constructor(familyName:string) {
		this.familyName = familyName
	}

	

	build() {
	
		this.styleNames.forEach((styleName) => {
			const familyName = this.familyName
			const fullName = this.familyName + '-' + styleName
			
			let isTTC = false
			
			let fontPath = fonts.find((fontPath:string) => fontPath.endsWith(familyName + '.ttc'))
			if(fontPath !=null ) {
				isTTC = true
			} else {
				fontPath = fonts.find((fontPath:string) => fontPath.endsWith(fullName + '.ttf'))
			}
			
			console.log(fontPath)
			const stream = fs.readfileSync(fontPath, 'rb')
			console.log(stream)



				if (isTTC) {
					const collection = fontkit.openSync(fontPath)
					console.log('-------------------------\n')
					collection.fonts.forEach((ttf:any) => {
						
						const styleName = ttf.fullName.replace(ttf.familyName, '').trim().split(' ').join('')
						let fontName = ttf.familyName.split(' ').join('')
						if (styleName.length > 0) {
							fontName += '-' + styleName
						}
						
						const fontPath = path.join(FONTS_DIST_PATH, `${fontName}.ttf`)						
						
					// 	//if (fs.existsSync(fontPath)) return

					// 	try {
					// 		console.log(ttf.stream.pos) 
					// 		// const buf = this.toArrayBuffer(ttf.stream.buffer, ttf.stream.length)
					// 		// const tt = new fontReader.TTCReader(buf) 
					// 	} catch (e) { 
					// 		// console.log(e)
					// 	}
					// 	fs.writeFileSync(fontPath, ttf.stream.buffer)   
					// 	// const newFont = fontkit.openSync(fontPath)
					// 	// console.log(newFont)  
					// }) 
					})
					
				} else {

					const resultPath = path.join(FONTS_DIST_PATH, `${fullName}.ttf`)						
									
					if (fs.existsSync(resultPath)) return
			
					fs.createReadStream(fontPath).pipe(fs.createWriteStream(resultPath));
				}
			}
		)		
	}
}

function extractShapeGroupsFromPage(page:any) {
	const shapeGroups:any = []

	const _extractShapeGroupsFromPage = (layer:any) => {
		if (layer._class == "shapeGroup") {
			shapeGroups.push(layer)
		} else if (layer.hasOwnProperty('layers')) {
			layer.layers.forEach((_layer:any) => {
				_extractShapeGroupsFromPage(_layer)
			})
		}
	}
	_extractShapeGroupsFromPage(page)

	return shapeGroups
}

function copyImages() {
	if (!fs.existsSync(IMAGES_DIST_PATH)) {
		fs.mkdirSync(IMAGES_DIST_PATH)
	}

	fs.createReadStream(SKETCH_FILE_PATH)
		.pipe(unzip.Parse())
		.on('entry', function (entry:any) {
			const srcPath = entry.path;

			if (srcPath.startsWith('images/')) {
				const fileName = srcPath.replace('images/', '')
				const filePath = path.join(IMAGES_DIST_PATH, fileName)
								
				if (fs.existsSync(filePath)) return
		
				entry.pipe(fs.createWriteStream(filePath))	
			} else if (srcPath.startsWith('pages/')) {

				streamToJson(entry).then((result:any) => {
					const shapeGroups = extractShapeGroupsFromPage(result)
					shapeGroups.forEach((shapeGroup:any) => {
						const fileName = shapeGroup.do_objectID + '.svg'
						const filePath = path.join(IMAGES_DIST_PATH, fileName)
						// sketch.export(shapeGroup, {
						// 	formats: 'svg',
						// 	output: filePath
						// })
					})

				})
			} else {
				entry.autodrain();
			}
		})	
}

function generatePubspecSnippets() {
	
	const assetsSnippet = 
	'  assets:\n' +
	'    - assets/\n' +
	'    - assets/sketch/\n' +
	'    - assets/images/\n'

	let fontsSnippets =
	'  fonts:'

	let prevFamilyName = ''
	fs.readdirSync(FONTS_DIST_PATH).forEach((fontName:any) => {
		const fontPath = path.join(__dirname, '../', FONTS_DIST_PATH, fontName)

		const collection = fontkit.openSync(fontPath)		
		
		console.log(collection)
		collection.fonts.forEach((font:any) => {
			console.log(font.fullName)
		})
	
		// const familyNames = font.split('-')

		// let familyName = familyNames[0]

		// if (familyNames.length == 1) {
		// 	familyName = familyName.replace('.ttf', '')
		// }

		// if (prevFamilyName != familyName) {
		// 	fontsSnippets += '\n'
		// 	fontsSnippets += '    - family: ' + familyName + '\n'
		// 	fontsSnippets += '      fonts:\n'
		// 	prevFamilyName = familyName
		// }

		// if (font.endsWith('.ttf')) {
		// 	fontsSnippets += '        - asset: fonts/' + font + '\n'
		// }
	})


	return assetsSnippet + '\n' + fontsSnippets
}

function copyFonts() {
	if (!fs.existsSync(FONTS_DIST_PATH)) {
		fs.mkdirSync(FONTS_DIST_PATH)
	}

	const fonts:Font[] = []
	fs.createReadStream(SKETCH_FILE_PATH)
		.pipe(unzip.Parse())
		.on('entry', function (entry:any) {
			const fileName = entry.path;
	
			if (fileName === META_JSON) {
				streamToJson(entry).then((result:any) => {
						result.fonts.forEach((fontFullName:string) => {
								const fontName = fontFullName.split('-')
								const fontFamilyName = fontName[0]
								
								let font = fonts.find((font) => font.familyName == fontFamilyName);
								if (font == null) {
									font = new Font(fontFamilyName);
									fonts.push(font)
								}

								if (fontName.length > 1) {
									const styleName = fontName[1]
									font.styleNames.push(styleName)
								}
						})
						
						fonts.forEach((font) => {
							font.build()
						})
				})
			} else {
				entry.autodrain();
			}
		});	
}

function run() {
	if (!fs.existsSync(DIST_PATH)) {
		fs.mkdirSync(DIST_PATH)
	}

	copyImages()
	copyFonts()
	const pubspectSnippet = generatePubspecSnippets()
	console.log(pubspectSnippet)
}

run()

