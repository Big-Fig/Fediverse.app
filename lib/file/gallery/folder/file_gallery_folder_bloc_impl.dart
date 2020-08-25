import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:fedi/file/gallery/folder/file_gallery_folder_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rxdart/rxdart.dart';

abstract class AbstractFileGalleryFolderBloc extends AsyncInitLoadingBloc
    implements IFileGalleryFolderBloc {
  final IStoragePermissionBloc storagePermissionBloc;

  final AssetPathEntity folder;

  AbstractFileGalleryFolderBloc({
    @required this.folder,
    @required this.storagePermissionBloc,
  }) {
    addDisposable(subject: filesSubject);
    addDisposable(subject: galleryStateSubject);
  }

  // ignore: close_sinks
  BehaviorSubject<List<AssetEntity>> filesSubject = BehaviorSubject();

  @override
  Stream<List<AssetEntity>> get filesStream => filesSubject.stream;
  @override
  List<AssetEntity> get files => filesSubject.value;

  // ignore: close_sinks
  BehaviorSubject<FileGalleryState> galleryStateSubject =
      BehaviorSubject.seeded(FileGalleryState.loadingNotStarted);
  @override
  Stream<FileGalleryState> get galleryStateStream => galleryStateSubject.stream;

  @override
  FileGalleryState get galleryState => galleryStateSubject.value;
  @override
  Future internalAsyncInit() async {
    await storagePermissionBloc.checkPermissionStatus();

    if (storagePermissionBloc.permissionGranted) {
      await _initAfterPermissionGranted();
    } else {
      addDisposable(
          streamSubscription: storagePermissionBloc.permissionGrantedStream
              .distinct()
              .listen((granted) {
        if (granted && files?.isNotEmpty != true) {
          _initAfterPermissionGranted();
        }
      }));
    }
  }

  Future _initAfterPermissionGranted() async {
    return await reloadFiles();
  }

  void reloadFiles() async {
    assert(permissionGranted);
    galleryStateSubject.add(FileGalleryState.loading);
    var files = await loadFiles();
    if (!filesSubject.isClosed) {
      filesSubject.add(files);
    }
    if (!galleryStateSubject.isClosed) {
      galleryStateSubject.add(FileGalleryState.loaded);
    }
  }

  Future<List<AssetEntity>> loadFiles();

  @override
  Future<PermissionStatus> checkPermissionStatus() =>
      storagePermissionBloc.checkPermissionStatus();

  @override
  bool get permissionGranted => storagePermissionBloc.permissionGranted;

  @override
  Stream<bool> get permissionGrantedStream =>
      storagePermissionBloc.permissionGrantedStream;

  @override
  PermissionStatus get permissionStatus =>
      storagePermissionBloc.permissionStatus;

  @override
  Stream<PermissionStatus> get permissionStatusStream =>
      storagePermissionBloc.permissionStatusStream;

  @override
  Future<PermissionStatus> requestPermission() =>
      storagePermissionBloc.requestPermission();
}

class FileGalleryFolderBloc extends AbstractFileGalleryFolderBloc {
  FileGalleryFolderBloc({
    @required AssetPathEntity folder,
    @required IStoragePermissionBloc storagePermissionBloc,
  }) : super(folder: folder, storagePermissionBloc: storagePermissionBloc);

  @override
  Future<List<AssetEntity>> loadFiles() async {
    return await folder.assetList;
  }
}
