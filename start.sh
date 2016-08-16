#!/bin/bash
echo "Setting up Warpdrive environment"
source warpdriver/bin/activate
export WARPDRIVE=$PWD/warpdriver/bin/warpdrive
source `$WARPDRIVE rcfile`

echo "Loading warpdrive project"
cd mynewapp
warpdrive project opal

echo "Running app"
warpdrive start
