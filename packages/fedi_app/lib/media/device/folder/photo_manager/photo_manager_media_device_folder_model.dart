import 'package:fedi_app/media/device/folder/media_device_folder_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

part 'photo_manager_media_device_folder_model.freezed.dart';

@freezed
class PhotoManagerMediaDeviceFolder
    with _$PhotoManagerMediaDeviceFolder
    implements IMediaDeviceFolder {
  const PhotoManagerMediaDeviceFolder._();

  const factory PhotoManagerMediaDeviceFolder({
    required AssetPathEntity assetPathEntity,
  }) = _PhotoManagerMediaDeviceFolder;

  @override
  String get id => assetPathEntity.id;

  @override
  String get name => assetPathEntity.name;

  @override
  int get assetCount => assetPathEntity.assetCount;
}
