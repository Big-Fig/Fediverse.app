#!/bin/bash

flutter config --no-analytics
flutter pub global activate melos 1.0.0-dev.3
echo "$HOME/.pub-cache/bin" >> $GITHUB_PATH
echo "$GITHUB_WORKSPACE/_flutter/.pub-cache/bin" >> $GITHUB_PATH
echo "$GITHUB_WORKSPACE/_flutter/bin/cache/dart-sdk/bin" >> $GITHUB_PATH