#!/bin/sh
cd android/fastlane/
bundle exec fastlane screenshots
# delete all old png screenshots after framing
find ./ -type f -name "*.png" ! -name '*framed*' -exec rm -rf {} \; 
cd ../../
cd ios/fastlane/
bundle exec fastlane screenshots
# delete all old png screenshots after framing
find ./ -type f -name "*.png" ! -name '*framed*' -exec rm -rf {} \; 
cd ../../