#!/bin/sh

rm -rf dist
mkdir dist
cp index.html dist
cp talk.md dist
cp favicon.ico dist
cp -r media dist
surge dist elmeu.peterszerzo.com
