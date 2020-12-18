import path, { resolve } from 'path'
import fs from 'fs'
import { Enum } from './enum'
import { Constants } from './constants'
import { spawn } from 'child_process'
import SketchAsset from './SketchAsset'
import YAML from 'yaml'

export default class Sketch2Flutter {
	sketchAsset:SketchAsset = new SketchAsset()

	async impl (sketchFilePath:string, flutterPath:string) {
		
		if (!this._isSketchFile(sketchFilePath)) {
			console.log('NOT_SKETCH_FILE')
			return Enum.NOT_SKETCH_FILE
		}

		const prjState = this._getPathState(flutterPath)

		if (prjState == Enum.CREATE_NEW_PROEJCT) {
			const prjName = Constants.NEW_FLUTTER_PRJ_NAME_PREFIX + (new Date()).getTime()
			const createFlutterPath = await this.createNewProject(prjName, flutterPath)

			if (createFlutterPath != null) {
				let isDone = await this.copyAssetsToFlutter(sketchFilePath, createFlutterPath)
				if (isDone) {
					this.updatePubspec(createFlutterPath)
				}				
				console.log('CREATED_FLUTTER_PROEJCT ', isDone)				
			} else {
				console.log('PROJECT_CREATION_FALIED')
			}

		} else if (prjState == Enum.PROJECT_EXIST) {
			console.log('PROJECT_EXIST')
			let isDone = await this.copyAssetsToFlutter(sketchFilePath, flutterPath)
			if (isDone) {
				this.updatePubspec(flutterPath)
			}
			console.log('UPDATED_FLUTTER_PROEJCT ', isDone)
		} else if (prjState == Enum.PATH_NOT_EXIST) {
			console.log('PATH_NOT_EXIST') 
		}

		return prjState
	}

	async copyAssetsToFlutter(sketchFilePath:string, flutterPath:string) {
		const isDone = await this.sketchAsset.copyToFlutter(sketchFilePath, flutterPath)
		return isDone
	}

	async updatePubspec(flutterPath:string) {
		const assetsPath = path.join(flutterPath, Constants.FLUTTER_ASSETS_DIR_NAME)
		const fontsPath = path.join(assetsPath, Constants.FLUTTER_ASSETS_FONTS_DIR_NAME)
		const pubspecPath = path.join(flutterPath, Constants.PUBSPEC_FILE)

		if (fs.existsSync(pubspecPath)) {
			const pubspec = YAML.parse(fs.readFileSync(pubspecPath, 'utf-8'))
			
			//convert fonts into flutter
			const fontSpecs = fs.readdirSync(fontsPath).reduce((fontSpecs:any, fontFileName:string) => {
				const fontPath = path.join(fontsPath, fontFileName)
				const fontSpec:any = this.sketchAsset.getFontSpec(fontPath)

				
				if (fontSpec != null) {
					let fontName = fontSpec.familyName.split(' ').join('')
					if (fontSpec.subfamilyName.length > 0) {
						fontName += "-" + fontSpec.subfamilyName.split(' ').join('')
					}
					fontSpecs.push({
						family: fontName,
						fileName: fontFileName
					})
				}
				return fontSpecs
			}, [])

			let flutterFonts = pubspec.flutter.fonts
			if (flutterFonts == null) {
				flutterFonts = []
			}

			const relavtiveFontDir = path.relative(flutterPath, fontsPath)
			fontSpecs.forEach((fontSpec:any) => {
				const flutterFont = flutterFonts.find((flutterFont:any) => flutterFont.family == fontSpec.family)
				if (flutterFont == null) {
					flutterFonts.push({
						'family': fontSpec.family,
						'fonts': [{
							'asset': path.join(relavtiveFontDir, fontSpec.fileName)
						}]
					})
				}
			})

			pubspec.flutter.fonts = flutterFonts

			//convert images into flutter
			let flutterAssets = pubspec.flutter.assets						

			if (flutterAssets == null) {
				flutterAssets = []
			}

			const flutterAssetsPath = path.join(Constants.FLUTTER_ASSETS_DIR_NAME, Constants.FLUTTER_ASSETS_IMAGES_DIR_NAME + '/')
			const flutterSketchPath = path.join(Constants.FLUTTER_ASSETS_DIR_NAME, Constants.FLUTTER_ASSETS_SKETCH_DIR_NAME + '/')			
			if (flutterAssets.find((flutterAsset:string) => flutterAsset == flutterAssetsPath)	== null) {
				flutterAssets.push(flutterAssetsPath)
			}
			if (flutterAssets.find((flutterAsset:string) => flutterAsset == flutterSketchPath)	== null) {
				flutterAssets.push(flutterSketchPath)
			}
			pubspec.flutter.assets = flutterAssets


			//dependencies
			let dependencies = pubspec.dependencies
			if (dependencies == null) {
				dependencies = {}
			}

			Constants.FLUTTER_DEPENDENCIES.forEach((pkg) => {
				if (dependencies[pkg.name] != null) return
				dependencies[pkg.name] = pkg.version
			})
			pubspec.dependencies = dependencies
			
			//dev-dependencies
			let dveDependencies = pubspec.dev_dependencies
			if (dveDependencies == null) {
				dveDependencies = {}
			}

			Constants.FLUTTER_DEV_DEPENDENCIES.forEach((pkg) => {
				if (dveDependencies[pkg.name] != null) return
				dveDependencies[pkg.name] = pkg.version
			})
			pubspec.dev_dependencies = dveDependencies

			fs.writeFileSync(pubspecPath, YAML.stringify(pubspec), 'utf-8')
			return true
		} else {
			return false
		}
	}

	async createNewProject(prjName:string, dirPath:string): Promise<string> {
		return new Promise((resolve) => {
			const targetPath = path.join(dirPath, prjName)

			const flutter = spawn('flutter', ['create', targetPath])
	
			flutter.stdout.on('data', function(chunk) {
				const msg:string = chunk.toString()
	
				if (msg.indexOf('All done!') != -1) {
					resolve(targetPath)
				}
			})
		})

	} 

	_isSketchFile(sketchFilePath:string) {
		return (sketchFilePath.endsWith('.sketch')) && (fs.existsSync(sketchFilePath) && fs.statSync(sketchFilePath).isFile())
	}

	_getPathState(prjPath:string) {
		if (fs.existsSync(prjPath) && fs.statSync(prjPath).isDirectory()) {
			const pubspecFile = fs.readdirSync(prjPath).find((fileName) => fileName == Constants.PUBSPEC_FILE)

			if (pubspecFile == null) {
				return Enum.CREATE_NEW_PROEJCT
			} else {
				return Enum.PROJECT_EXIST
			}
		} else {
			return Enum.PATH_NOT_EXIST
		}		
	}
}