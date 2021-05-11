#!/usr/bin/env bash

rimraf dist
tsc --build tsconfig.build.json
esbuild src/index.ts --bundle --platform=node --outfile=dist/index.js
esbuild src/index.ts --bundle --outfile=dist/index.modern.js --external:url --external:vm
cp src/fletch.d.ts dist/fletch.d.ts
