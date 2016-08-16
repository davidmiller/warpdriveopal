#!/bin/bash
echo "Setting up Warpdrive environment"
source warpdriver/bin/activate
export WARPDRIVE=$PWD/warpdriver/bin/warpdrive
source `$WARPDRIVE rcfile`

echo "Loading warpdrive project"
cd mynewapp
warpdrive project opal

# IF s2i isn't installed globally, make sure it's on our path
export PATH=$PATH:~/Downloads/source-to-image-v1.1.1-724c0dd-darwin-amd64

echo "Building image"
warpdrive image opal
