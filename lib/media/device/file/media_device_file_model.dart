import 'dart:io';

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
      default:
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

class FileMediaDeviceFileMetadata extends IMediaDeviceFileMetadata {
  final File originalFile;
  final bool isNeedDeleteAfterUsage;

  @override
  final MediaDeviceFileType type;

  FileMediaDeviceFileMetadata({
    required this.originalFile,
    required this.isNeedDeleteAfterUsage,
    required this.type,
  });

  @override
  String get deviceId => originalFile.absolute.path;

  @override
  Future<IMediaDeviceFile> loadMediaDeviceFile() async => FileMediaDeviceFile(
        originalFile: originalFile,
        isNeedDeleteAfterUsage: isNeedDeleteAfterUsage,
        metadata: this,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileMediaDeviceFileMetadata &&
          runtimeType == other.runtimeType &&
          originalFile == other.originalFile &&
          isNeedDeleteAfterUsage == other.isNeedDeleteAfterUsage &&
          type == other.type;

  @override
  int get hashCode =>
      originalFile.hashCode ^ isNeedDeleteAfterUsage.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'FileMediaDeviceFileMetadata{'
        'isNeedDeleteAfterUsage: $originalFile,'
        ' isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage,'
        ' type: $type}';
  }
}

class FileMediaDeviceFile extends IMediaDeviceFile {
  final File originalFile;

  @override
  final bool isNeedDeleteAfterUsage;

  FileMediaDeviceFile({
    required this.originalFile,
    required this.isNeedDeleteAfterUsage,
    required this.metadata,
  });

  @override
  Future delete() => originalFile.delete();

  @override
  Future<File> loadFile() async => originalFile;

  @override
  Future<String> calculateFilePath() async => originalFile.path;

  @override
  final IMediaDeviceFileMetadata metadata;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileMediaDeviceFile &&
          runtimeType == other.runtimeType &&
          originalFile == other.originalFile &&
          isNeedDeleteAfterUsage == other.isNeedDeleteAfterUsage &&
          metadata == other.metadata;

  @override
  int get hashCode =>
      originalFile.hashCode ^
      isNeedDeleteAfterUsage.hashCode ^
      metadata.hashCode;

  @override
  String toString() {
    return 'FileMediaDeviceFile{'
        'originalFile: $originalFile,'
        ' isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage,'
        ' metadata: $metadata'
        '}';
  }
}
