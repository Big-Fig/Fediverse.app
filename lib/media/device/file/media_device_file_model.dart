import 'dart:io';

import 'package:flutter/widgets.dart';

enum MediaDeviceFileType {
  image,
  video,
  audio,
  other,
}

abstract class IMediaDeviceFile {
  MediaDeviceFileType get type;

  bool get isNeedDeleteAfterUsage;

  Future<File> loadFile();

  Future<String> calculateFilePath();

  Future delete();
}

extension IMediaDeviceFileExtension on IMediaDeviceFile {
  bool get isMedia {
    switch (type) {
      case MediaDeviceFileType.image:
      case MediaDeviceFileType.video:
        return true;
      case MediaDeviceFileType.audio:
      case MediaDeviceFileType.other:
      default:
        return false;
    }
  }
}

class FileMediaDeviceFile extends IMediaDeviceFile {
  final File originalFile;

  @override
  final bool isNeedDeleteAfterUsage;

  @override
  final MediaDeviceFileType type;

  FileMediaDeviceFile({
    @required this.originalFile,
    @required this.isNeedDeleteAfterUsage,
    @required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileMediaDeviceFile &&
          runtimeType == other.runtimeType &&
          loadFile == other.loadFile &&
          isNeedDeleteAfterUsage == other.isNeedDeleteAfterUsage &&
          type == other.type;

  @override
  int get hashCode =>
      loadFile.hashCode ^ isNeedDeleteAfterUsage.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'FileMediaDeviceFile{file: $loadFile,'
        ' isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage, type: $type}';
  }

  @override
  Future delete() => originalFile.delete();

  @override
  Future<File> loadFile() async => originalFile;

  @override
  Future<String> calculateFilePath() async => originalFile.path;
}
