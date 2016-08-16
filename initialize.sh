#!/bin/bash

echo "Cleaning any old artifacts"
rm -rf warpdriver
rm -rf mynewapp

echo "Setting up virtual environment"
virtualenv warpdriver
source warpdriver/bin/activate
pip install opal warpdrive

echo "Setting up Warpdrive environment"
export WARPDRIVE=$PWD/warpdriver/bin/warpdrive
source `$WARPDRIVE rcfile`

echo "Initializing OPAL Project"
opal startproject mynewapp
cd mynewapp

echo "Cleaning OPAL Project (0.7.0 bugs)"
cat requirements.txt | grep -v github > requirements.txt
echo "opal==0.7.0" > requirements.txt
mkdir mynewapp/static

echo "Removing OPAL migrated database"
rm mynewapp/opal.sqlite

echo "Initializing Warpdrive"
warpdrive project opal
mkdir -p .warpdrive/action_hooks
cp ../warp_setup.sh .warpdrive/action_hooks/setup

echo "Building Warpdrive project"
warpdrive build
warpdrive setup

echo "Initialization complete"
echo "Run ./start.sh to run the app"
