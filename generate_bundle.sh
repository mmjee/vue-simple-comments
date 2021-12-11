#!/bin/bash

mkdir tmp
cp -arv "src/components" tmp/
cp src/index.js tmp/
cp package.json tmp/
cp yarn.lock tmp/

tar -zcvf package.tgz -C tmp .
rm -rv tmp/
