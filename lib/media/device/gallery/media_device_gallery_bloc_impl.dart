import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_local_only_list_bloc_impl.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_local_only_pagination_bloc_impl.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_pagination_list_bloc_impl.dart';
import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:fedi/media/device/folder/photo_manager/photo_manager_media_device_folder_bloc_impl.dart';
import 'package:fedi/media/device/folder/photo_manager/photo_manager_media_device_folder_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_model.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

abstract class MediaDeviceGalleryBloc extends AsyncInitLoadingBloc
    implements IDisposable, IPermissionBloc, IMediaDeviceGalleryBloc {
  final IStoragePermissionBloc storagePermissionBloc;
  final List<MediaDeviceFileType> typesToPick;
  final IPaginationSettingsBloc paginationSettingsBloc;

  MediaDeviceGalleryBloc({
    required this.storagePermissionBloc,
    required this.typesToPick,
    required this.paginationSettingsBloc,
  }) {
    foldersSubject.disposeWith(this);
    selectedFolderSubject.disposeWith(this);
    galleryStateSubject.disposeWith(this);

    addCustomDisposable(
      () => disposeSelectedFolderBlocs(),
    );
  }

  // ignore: close_sinks
  BehaviorSubject<List<IMediaDeviceFolder>> foldersSubject = BehaviorSubject();

  @override
  Stream<List<IMediaDeviceFolder>> get foldersStream => foldersSubject.stream;

  @override
  List<IMediaDeviceFolder>? get folders => foldersSubject.valueOrNull;

  // ignore: close_sinks
  BehaviorSubject<MediaDeviceGallerySelectedFolderData?> selectedFolderSubject =
      BehaviorSubject();

  @override
  Future selectFolder(IMediaDeviceFolder folder) async {
    // todo: rework
    assert(folder is IMediaDeviceFolder);
    var oldFolderData = selectedFolderData;
    if (oldFolderData?.folder.id == folder.id) {
      return;
    }

    selectedFolderSubject.add(null);

    await oldFolderData?.dispose();

    var folderBloc = PhotoManagerMediaDeviceFolderBloc(
      storagePermissionBloc: storagePermissionBloc,
      // todo: rework cast
      folder: folder as PhotoManagerMediaDeviceFolder,
    );
    var listBloc = MediaDeviceFileLocalOnlyListBloc(
      folderBloc: folderBloc,
    );
    var paginationBloc = MediaDeviceFileLocalOnlyPaginationBloc(
      listBloc: listBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );

    var paginationListBloc = MediaDeviceFilePaginationListBloc(
      paginationBloc: paginationBloc,
    );
    var newFolderData = MediaDeviceGallerySelectedFolderData(
      folder: folder,
      folderBloc: folderBloc,
      filesListBloc: listBloc,
      filesPaginationBloc: paginationBloc,
      filesPaginationListBloc: paginationListBloc,
    );

    selectedFolderSubject.add(newFolderData);
  }

  @override
  MediaDeviceGallerySelectedFolderData? get selectedFolderData =>
      selectedFolderSubject.valueOrNull;

  @override
  Stream<MediaDeviceGallerySelectedFolderData?> get selectedFolderDataStream =>
      selectedFolderSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<MediaDeviceGalleryState> galleryStateSubject =
      BehaviorSubject.seeded(MediaDeviceGalleryState.loadingNotStarted);

  @override
  Stream<MediaDeviceGalleryState> get galleryStateStream =>
      galleryStateSubject.stream;

  @override
  MediaDeviceGalleryState? get galleryState => galleryStateSubject.valueOrNull;

  @override
  Future internalAsyncInit() async {
    await storagePermissionBloc.checkPermissionStatus();

    if (storagePermissionBloc.permissionGranted!) {
      await _initAfterPermissionGranted();
    } else {
      storagePermissionBloc.permissionGrantedStream.distinct().listen(
        (granted) {
          if (granted! && folders?.isNotEmpty != true) {
            _initAfterPermissionGranted();
          }
        },
      ).disposeWith(this);
    }
  }

  Future _initAfterPermissionGranted() async {
    await refreshFoldersInformation();
  }

  @override
  Future refreshFoldersInformation() async {
    assert(permissionGranted!);
    var oldSelectedFolder = selectedFolderData;
    galleryStateSubject.add(MediaDeviceGalleryState.loading);
    var folders = await loadFoldersInformation();

    foldersSubject.add(folders);
    galleryStateSubject.add(MediaDeviceGalleryState.loaded);

    if (oldSelectedFolder?.folder != null) {
      var newSelectedFolder = folders.firstWhereOrNull(
        (folder) => folder.id == oldSelectedFolder?.folder.id,
      );

      if (newSelectedFolder != null) {
        await selectFolder(newSelectedFolder);
      } else {
        if (folders.isNotEmpty) {
          await selectFolder(folders.first);
        }
      }
    } else {
      if (folders.isNotEmpty) {
        await selectFolder(folders.first);
      }
    }
  }

  Future<List<IMediaDeviceFolder>> loadFoldersInformation();

  @override
  Future<PermissionStatus> checkPermissionStatus() =>
      storagePermissionBloc.checkPermissionStatus();

  @override
  bool? get permissionGranted => storagePermissionBloc.permissionGranted;

  @override
  Stream<bool?> get permissionGrantedStream =>
      storagePermissionBloc.permissionGrantedStream;

  @override
  PermissionStatus? get permissionStatus =>
      storagePermissionBloc.permissionStatus;

  @override
  Stream<PermissionStatus?> get permissionStatusStream =>
      storagePermissionBloc.permissionStatusStream;

  @override
  Future<PermissionStatus?> requestPermission() =>
      storagePermissionBloc.requestPermission();

  Future disposeSelectedFolderBlocs() async {
    await selectedFolderData?.dispose();
  }
}
