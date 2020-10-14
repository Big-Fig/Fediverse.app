import 'dart:io';

import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/photo_manager_media_device_adapter.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoManagerMediaDeviceFile implements IMediaDeviceFile {
  final AssetEntity assetEntity;
  @override
  final bool isNeedDeleteAfterUsage;

  @override
  MediaDeviceFileType get type => assetEntity.type.mapToMediaDeviceFileType();

  PhotoManagerMediaDeviceFile({
    @required this.assetEntity,
    @required this.isNeedDeleteAfterUsage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoManagerMediaDeviceFile &&
          runtimeType == other.runtimeType &&
          assetEntity == other.assetEntity &&
          isNeedDeleteAfterUsage == other.isNeedDeleteAfterUsage;

  @override
  int get hashCode => assetEntity.hashCode ^ isNeedDeleteAfterUsage.hashCode;

  @override
  String toString() {
    return 'PhotoManagerMediaDeviceFile{assetEntity: $assetEntity,'
        ' isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage}';
  }

  @override
  Future<File> loadFile() => assetEntity.file;

  @override
  Future delete() async => (await loadFile()).delete();

  @override
  Future<String> calculateFilePath() => loadFile().then((file) => file?.path);
}
