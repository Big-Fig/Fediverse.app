#!/bin/sh
cd android/fastlane/metadata/android
bundle exec fastlane frameit android
cd ../../../../
cd ios/fastlane/screenshots
bundle exec fastlane frameit
cd ../../../