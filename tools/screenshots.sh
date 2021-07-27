#!/bin/sh
fvm flutter pub global run screenshots:main --flavor dev
#fvm flutter pub global run screenshots:main --flavor dev -c screenshots_dev.yaml
# delete unframed unnecessary screenshots
rm -rf ./ios/fastlane/unframed_screenshots
find android/fastlane/metadata/android -type d -name "unframed_images" -exec rm -rf {} \;