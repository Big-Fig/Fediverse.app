import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

enum CameraState {
  error,
  initializing,
  videoRecording,
  videoPaused,
  imageCapturing,
  readyForAction,
  disposed
}

class CameraFile {
  final File file;
  final CameraFileType type;
  CameraFile(this.file, this.type);
}

enum CameraFileType { video, photo }

class CameraConfig {
  final bool audioEnabled;
  final ResolutionPreset resolutionPreset;

  // null = infinity
  final Duration maximumVideoDuration;
  CameraConfig({
    @required this.audioEnabled,
    @required this.resolutionPreset,
    @required this.maximumVideoDuration,
  });

  @override
  String toString() {
    return 'FileCaptureCameraConfig{audioEnabled: $audioEnabled,'
        ' preset: $resolutionPreset,'
        ' maximumVideoDuration: $maximumVideoDuration}';
  }
}
