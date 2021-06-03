import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoManagerMediaDeviceFolder implements IMediaDeviceFolder {
  final AssetPathEntity assetPathEntity;

  @override
  String get id => assetPathEntity.id;

  @override
  String get name => assetPathEntity.name;

  @override
  int get assetCount => assetPathEntity.assetCount;

  PhotoManagerMediaDeviceFolder({required this.assetPathEntity});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoManagerMediaDeviceFolder &&
          runtimeType == other.runtimeType &&
          assetPathEntity == other.assetPathEntity;

  @override
  int get hashCode => assetPathEntity.hashCode;

  @override
  String toString() {
    return 'PhotoManagerMediaDeviceFolder{assetPathEntity: $assetPathEntity}';
  }
}
