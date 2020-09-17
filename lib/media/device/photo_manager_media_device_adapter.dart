import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoManagerMediaDeviceAdapter {
  static MediaDeviceFileType mapPhotoManagerAssetTypeToMediaDeviceFileType(
      AssetType assetType) {
    if (assetType == null) {
      return null;
    }
    switch (assetType) {
      case AssetType.other:
        return MediaDeviceFileType.other;
        break;
      case AssetType.image:
        return MediaDeviceFileType.image;
        break;
      case AssetType.video:
        return MediaDeviceFileType.video;
        break;
      case AssetType.audio:
        return MediaDeviceFileType.audio;
        break;
    }
    throw "Invalid AssetType $assetType";
  }
}

extension MediaDevicePhotoManagerAdapterAssetTypeExtension on AssetType {
  MediaDeviceFileType mapToMediaDeviceFileType() =>
      PhotoManagerMediaDeviceAdapter
          .mapPhotoManagerAssetTypeToMediaDeviceFileType(this);
}
