import 'dart:typed_data';

import 'package:fedi_app/media/device/file/media_device_file_bloc_impl.dart';
import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:fedi_app/media/device/file/photo_manager/photo_manager_media_device_file_model.dart';
import 'package:fedi_app/media/device/photo_manager_media_device_adapter.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoManagerMediaDeviceFileBloc extends MediaDeviceFileBloc {
  final PhotoManagerMediaDeviceFileMetadata photoManagerMediaDeviceFileMetadata;

  PhotoManagerMediaDeviceFileBloc({
    required this.photoManagerMediaDeviceFileMetadata,
  }) : super(
          mediaDeviceFileMetadata: photoManagerMediaDeviceFileMetadata,
        );

  AssetEntity get assetEntity =>
      photoManagerMediaDeviceFileMetadata.assetEntity;

  @override
  Future<Uint8List?> loadThumbData({required int width, required int height}) =>
      assetEntity.thumbDataWithSize(width, height);

  @override
  MediaDeviceFileType get type => assetEntity.type.mapToMediaDeviceFileType();
}
