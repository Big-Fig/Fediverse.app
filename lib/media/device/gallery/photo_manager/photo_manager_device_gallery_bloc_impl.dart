import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:fedi/media/device/folder/photo_manager/photo_manager_media_device_folder_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_bloc_impl.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoManagerMediaDeviceGalleryBloc extends MediaDeviceGalleryBloc {
  PhotoManagerMediaDeviceGalleryBloc({
    required IStoragePermissionBloc storagePermissionBloc,
    required List<MediaDeviceFileType> typesToPick,
    required IPaginationSettingsBloc paginationSettingsBloc,
  }) : super(
          storagePermissionBloc: storagePermissionBloc,
          typesToPick: typesToPick,
          paginationSettingsBloc: paginationSettingsBloc,
        ) {
    addDisposable(disposable: CustomDisposable(() async {
      await PhotoManager.releaseCache();
    }));
  }

  @override
  Future<List<IMediaDeviceFolder>> loadFoldersInformation() async {
    var assetPathEntities = await PhotoManager.getAssetPathList(
      type: mapFileTypesToPickToRequestType(typesToPick),
    );
    assetPathEntities.sort(PhotoManagerMediaDeviceGalleryBloc
        .compareAlbumsAlphabeticallyAndFeatured);

    return assetPathEntities
        .map(
          (assetPathEntity) => PhotoManagerMediaDeviceFolder(
            assetPathEntity: assetPathEntity,
          ),
        )
        .toList();
  }

  static int compareAlbumsAlphabeticallyAndFeatured(
    AssetPathEntity a,
    AssetPathEntity b,
  ) {
    var aName = a.name;
    var bName = b.name;

    // TODO: refactor for android & different languages
    // or wait until photo_manager lib will return album type
    return compareAlbumTitlesAlphabeticallyAndFeatured(aName, bName);
  }

  static int compareAlbumTitlesAlphabeticallyAndFeatured(
    String aName,
    String bName,
  ) {
    // TODO: refactor for different languages
    // or wait until photo_manager lib will return album type
    const List<String> iosLatestEnNames = ["Recently Added", "Recents"];
    const List<String> androidLatestEnNames = ["Recent"];
    List<String> featuredNames = [...iosLatestEnNames, ...androidLatestEnNames];

    var isANameFeatured = featuredNames.contains(aName);
    var isBNameFeatured = featuredNames.contains(bName);

    if (isANameFeatured && !isBNameFeatured) {
      return -1;
    } else if (!isANameFeatured && isBNameFeatured) {
      return 1;
    } else {
      // both featured or both not
      return aName.compareTo(bName);
    }
  }

  static RequestType mapFileTypesToPickToRequestType(
    List<MediaDeviceFileType> fileTypesToPick,
  ) {
    var isNeedImage = fileTypesToPick.contains(MediaDeviceFileType.image);
    var isNeedVideo = fileTypesToPick.contains(MediaDeviceFileType.video);
    var isNeedAudio = fileTypesToPick.contains(MediaDeviceFileType.audio);
    if (isNeedImage && isNeedVideo && isNeedAudio) {
      return RequestType.all;
    } else if (isNeedImage && isNeedVideo) {
      return RequestType.common;
    } else if (isNeedImage && !isNeedVideo) {
      return RequestType.image;
    } else if (!isNeedImage && isNeedVideo) {
      return RequestType.video;
    } else if (isNeedAudio) {
      return RequestType.audio;
    }

    throw "fileTypesToPick should containe image or video type";
  }
}
