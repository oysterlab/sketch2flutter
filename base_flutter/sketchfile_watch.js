const sketchFile = '/Users/shindonghun/dev/firts-plugin/uxcatch_flutter/assets/sketch/sample3.sketch'

const fs = require('fs');
const md5 = require('md5');
require('log-timestamp');

const { spawn } = require( 'child_process' );
const flutterCmd = spawn( 'flutter', [ 'run' ] );

flutterCmd.stdout.on( 'data', data => {
    console.log( `stdout: ${data}` );

    if (data.indexOf('available at: http') != -1) {
      let md5Previous = null;
      let fsWait = false;

      fs.watch(sketchFile, (event, filename) => {
        if (filename) {
          if (fsWait) return;
          fsWait = setTimeout(() => {
            fsWait = false;
          }, 100);
          const md5Current = md5(fs.readFileSync(sketchFile));
          if (md5Current === md5Previous) {
            return;
          }
          md5Previous = md5Current;
          console.log(`${filename} file Changed`);
          flutterCmd.stdin.write("R\n");
        }
      });


    }
} );

flutterCmd.stderr.on( 'data', data => {
    console.log( `stderr: ${data}` );
} );

flutterCmd.on( 'close', code => {
    console.log( `child process exited with code ${code}` );
} );