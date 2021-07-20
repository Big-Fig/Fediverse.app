#!/bin/sh
cd android/fastlane/
bundle install
cd ../../
cd ios/fastlane/
bundle install
cd ../../
cd android/fastlane/metadata/android
bundle install
cd ../../../../
cd ios/fastlane/screenshots
bundle install
cd ../../../
