import FM from 'font-manager'
import fs from 'fs'
import { DEV } from '../constants'
const fontkit = require('fontkit')
const ttc2ttf = require('ttc2ttf').default

export default class FontManager {
	systemFonts:Array<any> = []

  constructor() {
		const startTime = (new Date()).getTime()
		
		if (process.env.NODE_ENV == 'dev') {
			this.systemFonts = DEV.SYSTEM_FONTS 
		} else {
			FM.getAvailableFontsSync().forEach((font:any) => {
			
				if (this.systemFonts.find((systemFont:any) => systemFont.path == font.path) == null) {
					const fontObj = fontkit.openSync(font.path)
					if (!(font.path.endsWith('.ttf') || font.path.endsWith('.ttc')) || fontObj == null) return
	
					let fontName = '' 
	
					if (font.path.endsWith('.ttf')) {
						const familyName = fontObj.familyName.split(' ').join('')
						const subfamilyName = fontObj.subfamilyName.split(' ').join('')
						fontName = familyName + '-' + subfamilyName
					} else if (font.path.endsWith('.ttc')) {
						fontName = fontObj.fonts[0].familyName.split(' ').join('')					
					}
	
					font.fontName = fontName
					this.systemFonts.push(font)
				}
			})
			const endTime = (new Date()).getTime()
	 
			console.log('get fonts time: ' + (endTime - startTime))
		}
	}

	copy(fonts:[], distPath:string) {
		for (let i = 0; i < fonts.length; i++) {
			const font:any = fonts[i]
			const fontPath = font.path

			if (fontPath.endsWith('.ttc')) {
				ttc2ttf(fontPath, distPath)
			} else {
				fs.createReadStream(fontPath).pipe(fs.createWriteStream(distPath))
			}
		}
	}

	getMatchFont(sketchFontNames:Array<String>) {
		const { systemFonts } = this

		const matchFonts:any = []

		systemFonts.forEach((systemFont) => {

			const familyName = sketchFontNames
			sketchFontNames.forEach((sketchFontName) => {
				const familyName = sketchFontName
				const fullName = sketchFontName

				if ((systemFont.fontName == familyName) || (systemFont.fontName == fullName)) {	//ttc
					if (matchFonts.indexOf((matchFont:any) => matchFont.fontName == systemFont.fontName) != -1) return
					matchFonts.push(systemFont)
				}
			})
		}) 

		return matchFonts
	}
	
	getFontSpec(fontPath:string) {
		return fontkit.openSync(fontPath)
	}
}