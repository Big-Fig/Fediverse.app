import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:photo_manager/photo_manager.dart';

extension MediaDevicePhotoManagerAdapterAssetTypeExtension on AssetType {
  MediaDeviceFileType mapToMediaDeviceFileType() {
    switch (this) {
      case AssetType.other:
        return MediaDeviceFileType.other;
      case AssetType.image:
        return MediaDeviceFileType.image;
      case AssetType.video:
        return MediaDeviceFileType.video;
      case AssetType.audio:
        return MediaDeviceFileType.audio;
    }
  }
}
