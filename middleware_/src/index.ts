import path, { resolve } from 'path'
import fs from 'fs'
import { Enum } from './enum'
import { Constants } from './constants'
import { spawn } from 'child_process'
import SketchAsset from './SketchAsset'

class Sketch2Flutter {
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
				this.copyAssetsToFlutter(sketchFilePath, createFlutterPath)
				console.log('CREATED_FLUTTER_PROEJCT')				
			} else {
				console.log('PROJECT_CREATION_FALIED')
			}

		} else if (prjState == Enum.PROJECT_EXIST) {
			console.log('PROJECT_EXIST')
			this.copyAssetsToFlutter(sketchFilePath, flutterPath)
			console.log('UPDATED_FLUTTER_PROEJCT')
		} else if (prjState == Enum.PATH_NOT_EXIST) {
			console.log('PATH_NOT_EXIST')
		}

		return prjState
	}

	async copyAssetsToFlutter(sketchFilePath:string, flutterPath:string) {
		const isDone = await this.sketchAsset.copyToFlutter(sketchFilePath, flutterPath)
		return isDone
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


const SKETCH_FILEPATH = '/Users/shindonghun/dev/firts-plugin/sketch2flutter/base_flutter/assets/sketch/hotel-booking-app-amimoradia.sketch'
const FLUTTER_PATH = '/Users/shindonghun/dev/firts-plugin/sketch2flutter/middleware/sample/prj1608105876851'

const sketch2Flutter = new Sketch2Flutter()
sketch2Flutter.impl(SKETCH_FILEPATH, FLUTTER_PATH)

