#!/bin/sh
fvm flutter pub global run screenshots:main --flavor dev
cd android/fastlane/metadata/android
bundle exec fastlane frameit android
cd ../../
cd ios/fastlane/screenshots
bundle exec fastlane frameit