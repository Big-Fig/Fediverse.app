#!/bin/sh
cd android/fastlane/metadata/android
bundle exec fastlane frameit android
cd ../../../../
cd ios/fastlane/
bundle exec fastlane frameit path screenshots
cd ../../../