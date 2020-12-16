const fs = require('fs')
const fontkit = require('fontkit')
const unzip = require('unzip')
import path from 'path' 
const fontManager = require('font-manager')
const fontReader = require('font-reader')
import struct from './struct'

function toArrayBuffer(buf:Buffer) { 
	const ab = new ArrayBuffer(buf.length)
	const view = new Uint8Array(ab)
	for (var i = 0; i < buf.length; ++i) {
			view[i] = buf[i]
	}
	return view.buffer
}

function ceil4(n:number) {
	return (n + 3) & ~3
}

function pad0(str:string, length:number) {
  return (Array(length + 1).join('0') + str).slice(-length);
}

class DataReader {
	index = 0
	view:DataView
	typeArray:Uint8Array

  static read(buffer:ArrayBuffer) {
    return new this(buffer)
  }

  constructor(buffer:ArrayBuffer) {
    this.view = new DataView(buffer)
    this.typeArray = new Uint8Array(buffer)
  }

  readAsDataChunk(length = 0) {
    const chunk:Uint8Array = this.typeArray.slice(this.index, (this.index += length))
    return DataReader.read(chunk.buffer);
  }

	readAsDataArray(length = 0) {
    const chunk:Uint8Array = this.typeArray.slice(this.index, (this.index += length))
		return chunk
  }

  readAsUShort() {
    const val = this.view.getUint16(this.index);
    this.index += 2;
    return val;
  }

  readAsULong() {
    const val = this.view.getUint32(this.index);
    this.index += 4;
    return val;
  }

  readAsStringFrom(pos:number, length:number, utf16:boolean = false) {
    const arr = [...this.typeArray.slice(pos, pos + length)];
    if (utf16) {
      return unescape(
        arr
          .map(item => pad0(item.toString(16), 2))
          .join('')
          .replace(/(\w{4})/g, '%u$1')
      );
    } else {
      return arr.map(item => String.fromCharCode(item)).join('');
    }
  }

  readAsString(length:number, utf16:boolean = false) {
    const str = this.readAsStringFrom(this.index, length, utf16);
    this.index += length;
    return str;
  }

  seek(offset:number) {
    this.index = offset;
    return this;
  }

  skip(length:number) {
    this.index += length;
    return this;
  }

  tell() {
    return this.index;
  }
  get length() {
    return this.typeArray.length;
  }
}


const fontPath = '/System/Library/Fonts/HelveticaNeue.ttc'

const arrayBuffer = toArrayBuffer(fs.readFileSync(fontPath))
const reader:DataReader = DataReader.read(arrayBuffer)
const type = reader.readAsString(4)
reader.readAsString(4)

if (type == 'ttcf') {
	const ttfCount = reader.readAsULong()
	console.log('ttfCount: ' + ttfCount) 

	const ttfOffsetArray = Array.from(Array(ttfCount)).map(() => reader.readAsULong())

	ttfOffsetArray.forEach((tableHeaderOffset) => {
		reader.seek(tableHeaderOffset + 0x04)
		const tableCount = reader.readAsUShort()
		const headerLength = 0x0C + tableCount * 0x10

		let tableLength = 0
		for(let i = 0; i < tableCount; i++) {
			reader.seek(tableHeaderOffset + 0x0C + 0x0C+ i * 0x10)
			const length = reader.readAsULong()
			tableLength += ceil4(length)
		}

		const totalLength =  headerLength + tableLength

		reader.seek(tableHeaderOffset)
		const header = reader.readAsDataArray(headerLength)
		
		const newBuf = new Uint8Array(new ArrayBuffer(totalLength))

		for (let i = 0; i < header.length; i++) {
			newBuf[i] = header[i]
		}

		let currentOffset = headerLength

		for (let i = 0; i < tableCount; i++) {
			reader.seek(tableHeaderOffset + 0x0C + 0x08 + i * 0x10)
			const offset:number = reader.readAsULong()

			reader.seek(tableHeaderOffset + 0x0C + 0x0C + i * 0x10)
			const length:number = reader.readAsULong()			

			console.log(struct)

			const currentOffsetBufferArray = Buffer.from(Uint8Array.from([currentOffset]))
			for (let j = 0; j < currentOffsetBufferArray.length; j++) {
				const bufIdx = 0x0C + 0x08 + i * 0x10
				newBuf[bufIdx] = header[j]
			}


		}




	})
}
 