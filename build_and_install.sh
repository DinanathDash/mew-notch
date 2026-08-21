#!/bin/bash
set -e

echo "Building MewNotch..."
xcodebuild -scheme MewNotch -configuration Debug -derivedDataPath ./build

echo "Killing existing MewNotch processes..."
pkill -f "MewNotch.app/Contents/MacOS/MewNotch" || true
# Alternatively, match the app name exactly:
pkill -x "mewnotch" || true
pkill -x "MewNotch" || true
sleep 1

echo "Removing old MewNotch from /Applications..."
rm -rf /Applications/MewNotch.app

echo "Copying new MewNotch to /Applications..."
cp -R build/Build/Products/Debug/MewNotch.app /Applications/MewNotch.app

echo "Launching new MewNotch app..."
open /Applications/MewNotch.app

echo "Done!"
