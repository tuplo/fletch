#!/usr/bin/env bash

rimraf dist
rimraf cjs
tsc --build tsconfig.build.json

esbuild src/index.cjs --bundle --platform=node --outfile=dist/index.cjs \
 --external:url --external:vm --external:node-fetch --external:cheerio
esbuild src/index.ts --bundle --platform=node --format=esm --outfile=dist/index.mjs \
  --external:url --external:vm --external:node-fetch --external:cheerio

cp src/fletch.d.ts dist/fletch.d.ts

# node12 compatibility
mkdir cjs && cp dist/index.cjs cjs/index.js
