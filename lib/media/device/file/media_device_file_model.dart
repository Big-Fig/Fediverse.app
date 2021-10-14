import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_device_file_model.freezed.dart';

enum MediaDeviceFileType {
  image,
  video,
  audio,
  other,
}

abstract class IMediaDeviceFileMetadata {
  String get deviceId;

  MediaDeviceFileType get type;

  Future<IMediaDeviceFile> loadMediaDeviceFile();
}

abstract class IMediaDeviceFile {
  IMediaDeviceFileMetadata get metadata;

  bool get isNeedDeleteAfterUsage;

  Future<File> loadFile();

  Future<String> calculateFilePath();

  Future delete();
}

extension IMediaDeviceFileMetadataExtension on IMediaDeviceFileMetadata {
  bool get isMedia {
    switch (type) {
      case MediaDeviceFileType.image:
      case MediaDeviceFileType.video:
        return true;
      case MediaDeviceFileType.audio:
      case MediaDeviceFileType.other:
        return false;
    }
  }
}

extension IMediaDeviceFileExtension on IMediaDeviceFile {
  Future deleteIfNeedAfterUsage() async {
    if (isNeedDeleteAfterUsage) {
      await delete();
    }
  }
}

@freezed
class FileMediaDeviceFileMetadata
    with _$FileMediaDeviceFileMetadata
    implements IMediaDeviceFileMetadata {
  const FileMediaDeviceFileMetadata._();

  const factory FileMediaDeviceFileMetadata({
    required File originalFile,
    required bool isNeedDeleteAfterUsage,
    required MediaDeviceFileType type,
  }) = _FileMediaDeviceFileMetadata;

  @override
  String get deviceId => originalFile.absolute.path;

  @override
  Future<IMediaDeviceFile> loadMediaDeviceFile() async => FileMediaDeviceFile(
        originalFile: originalFile,
        isNeedDeleteAfterUsage: isNeedDeleteAfterUsage,
        metadata: this,
      );
}

@freezed
class FileMediaDeviceFile
    with _$FileMediaDeviceFile
    implements IMediaDeviceFile {
  const FileMediaDeviceFile._();

  const factory FileMediaDeviceFile({
    required File originalFile,
    required bool isNeedDeleteAfterUsage,
    required IMediaDeviceFileMetadata metadata,
  }) = _FileMediaDeviceFile;

  @override
  Future delete() => originalFile.delete();

  @override
  Future<File> loadFile() async => originalFile;

  @override
  Future<String> calculateFilePath() async => originalFile.path;
}
