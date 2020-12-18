import fs from 'fs'
import path from 'path'
import { Constants } from './constants'
import FontManager from './lib/FontManager'

const unzip = require('unzip')

const META_JSON = 'meta.json'

function copyFileSync(source:string, target:string) {

	var targetFile = target;

	// If target is a directory, a new file with the same name will be created
	if ( fs.existsSync( target ) ) {
			if ( fs.lstatSync( target ).isDirectory() ) {
					targetFile = path.join( target, path.basename( source ) );
			}
	}

	fs.writeFileSync(targetFile, fs.readFileSync(source));
}

function copyFolderRecursiveSync(source:string, target:string) {
	var files = [];

	// Check if folder needs to be created or integrated
	var targetFolder = path.join( target, path.basename( source ) );
	if ( !fs.existsSync( targetFolder ) ) {
			fs.mkdirSync( targetFolder );
	}

	// Copy
	if ( fs.lstatSync( source ).isDirectory() ) {
			files = fs.readdirSync( source );
			files.forEach( function ( file ) {
					var curSource = path.join( source, file );
					if ( fs.lstatSync( curSource ).isDirectory() ) {
							copyFolderRecursiveSync( curSource, targetFolder );
					} else {
							copyFileSync( curSource, targetFolder );
					}
			} );
	}
}

export default class SketchAsset {
	fontManager:FontManager

	constructor() {
		this.fontManager = new FontManager()
	}

	async streamToJson(stream:any) {
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

	extractShapeGroupsFromPage(page:any) {
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

	async copyToFlutter(sketchFilePath:string, flutterPath:string) {
		const assetsPath = path.join(flutterPath, Constants.FLUTTER_ASSETS_DIR_NAME)
		const sketchPath = path.join(assetsPath, Constants.FLUTTER_ASSETS_SKETCH_DIR_NAME)
		const imagesPath = path.join(assetsPath, Constants.FLUTTER_ASSETS_IMAGES_DIR_NAME)
		const fontsPath = path.join(assetsPath, Constants.FLUTTER_ASSETS_FONTS_DIR_NAME)		

		if (!fs.existsSync(assetsPath)) {
			fs.mkdirSync(assetsPath)
		}

		if (!fs.existsSync(sketchPath)) {
			fs.mkdirSync(sketchPath)
		}

		if (!fs.existsSync(imagesPath)) {
			fs.mkdirSync(imagesPath)
		}

		if (!fs.existsSync(fontsPath)) {
			fs.mkdirSync(fontsPath)
		}
		
		const isSketchFileCopyDone = await fs.createReadStream(sketchFilePath).pipe(fs.createWriteStream(sketchPath + '/sketch_file.sketch'))
		const isImagesCopyDone = await this.copyImages(sketchFilePath, imagesPath)
		const isFontsCopyDone = await this.copyFonts(sketchFilePath, fontsPath)

		const isSourceCopyDone = await this.copySources(flutterPath)
		
		return isSketchFileCopyDone && isImagesCopyDone && isFontsCopyDone && isSourceCopyDone
	}

	async copySources(flutterPath:string) {
		const srcPath = path.join(__dirname, Constants.FLUTTER_SRC_SOURCE_PATH)
		const distPath = flutterPath // path.join(flutterPath, Constants.FLUTTER_DIST_SOURCE_PATH)
		copyFolderRecursiveSync(srcPath, distPath)

		return true
	}

	async copyFonts(sketchFilePath:string, distPath:string):Promise<boolean> {
		return new Promise((resolve) => {
			if (!fs.existsSync(distPath)) {
				fs.mkdirSync(distPath)
			}
		
			
			fs.createReadStream(sketchFilePath)
				.pipe(unzip.Parse())
				.on('entry', (entry:any) => {
					const fileName = entry.path;
			
					if (fileName === META_JSON) {
						this.streamToJson(entry).then((result:any) => {
							const fonts = this.fontManager.getMatchFont(result.fonts)
							this.fontManager.copy(fonts, distPath)
							resolve(true)
						})
					} else {
						entry.autodrain();
					}
				})
		})
	}

	async copyImages(sketchFilePath:string, distPath:string):Promise<boolean> {
		return new Promise((resolve) => {
			fs.createReadStream(sketchFilePath)
				.pipe(unzip.Parse())
				.on('entry', (entry:any) => {
					const srcPath = entry.path
	
					if (srcPath.startsWith('images/')) {
						const fileName = srcPath.replace('images/', '')
						const filePath = path.join(distPath, fileName)
						
						if (!fs.existsSync(filePath)) {
							entry.pipe(fs.createWriteStream(filePath))
							.on("finish", () => entry.autodrain())
						} else {
							entry.autodrain()
						}
					} else {
						entry.autodrain()
					}
				})
				.on('finish', () => {
					resolve(true)
				})
		})
	}

	getFontSpec(fontPath:string) {
		return this.fontManager.getFontSpec(fontPath)
	}
	
}