import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:fedi_app/media/device/file/photo_manager/photo_manager_media_device_file_model.dart';
import 'package:fedi_app/media/device/folder/media_device_folder_bloc_impl.dart';
import 'package:fedi_app/media/device/folder/photo_manager/photo_manager_media_device_folder_model.dart';
import 'package:fedi_app/permission/storage_permission_bloc.dart';

class PhotoManagerMediaDeviceFolderBloc extends MediaDeviceFolderBloc {
  final PhotoManagerMediaDeviceFolder folder;

  PhotoManagerMediaDeviceFolderBloc({
    required this.folder,
    required IStoragePermissionBloc storagePermissionBloc,
  }) : super(storagePermissionBloc: storagePermissionBloc);

  @override
  Future<List<IMediaDeviceFileMetadata>> loadPagedFiles({
    int? pageIndex,
    int? itemsCountPerPage,
    IMediaDeviceFileMetadata? olderThan,
    IMediaDeviceFileMetadata? newerThan,
  }) async {
    var assetEntities = await folder.assetPathEntity.getAssetListPaged(
      pageIndex!,
      itemsCountPerPage!,
    );
    // var start = pageIndex * itemsCountPerPage;
    // var end = start + itemsCountPerPage;
    // var assetEntities = await folder.assetPathEntity
    //     .getAssetListRange(start: start, end: end);

    return assetEntities
        .map(
          (assetEntity) => PhotoManagerMediaDeviceFileMetadata(
            assetEntity: assetEntity,
            isNeedDeleteAfterUsage: false,
          ),
        )
        .toList();
  }
}
