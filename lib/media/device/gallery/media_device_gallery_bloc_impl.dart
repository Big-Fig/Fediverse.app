import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_model.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

abstract class MediaDeviceGalleryBloc extends AsyncInitLoadingBloc
    implements Disposable, IPermissionBloc, IMediaDeviceGalleryBloc {
  final IStoragePermissionBloc storagePermissionBloc;
  final List<MediaDeviceFileType> typesToPick;

  MediaDeviceGalleryBloc({
    @required this.storagePermissionBloc,
    @required this.typesToPick,
  }) {
    addDisposable(subject: foldersSubject);
    addDisposable(subject: selectedFolderSubject);
    addDisposable(subject: galleryStateSubject);
  }

  // ignore: close_sinks
  BehaviorSubject<List<IMediaDeviceFolder>> foldersSubject = BehaviorSubject();

  @override
  Stream<List<IMediaDeviceFolder>> get foldersStream => foldersSubject.stream;

  @override
  List<IMediaDeviceFolder> get folders => foldersSubject.value;

  // ignore: close_sinks
  BehaviorSubject<IMediaDeviceFolder> selectedFolderSubject = BehaviorSubject();

  @override
  void selectFolder(IMediaDeviceFolder folder) {
    selectedFolderSubject.add(folder);
  }

  @override
  IMediaDeviceFolder get selectedFolder => selectedFolderSubject.value;

  @override
  Stream<IMediaDeviceFolder> get selectedFolderStream =>
      selectedFolderSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<MediaDeviceGalleryState> galleryStateSubject =
      BehaviorSubject.seeded(MediaDeviceGalleryState.loadingNotStarted);

  @override
  Stream<MediaDeviceGalleryState> get galleryStateStream =>
      galleryStateSubject.stream;

  @override
  MediaDeviceGalleryState get galleryState => galleryStateSubject.value;

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
        if (granted && folders?.isNotEmpty != true) {
          _initAfterPermissionGranted();
        }
      }));
    }
  }

  Future _initAfterPermissionGranted() async {
    await refreshFoldersInformation();
  }

  @override
  Future refreshFoldersInformation() async {
    assert(permissionGranted);
    var oldSelectedFolder = selectedFolder;
    galleryStateSubject.add(MediaDeviceGalleryState.loading);
    var folders = await loadFoldersInformation();

    foldersSubject.add(folders);
    galleryStateSubject.add(MediaDeviceGalleryState.loaded);

    if (oldSelectedFolder != null) {
      var newSelectedFolder = folders.firstWhere(
        (folder) => folder.id == oldSelectedFolder.id,
        orElse: () => null,
      );

      if (newSelectedFolder != null) {
        selectedFolderSubject.add(newSelectedFolder);
      } else {
        if (folders?.isNotEmpty == true) {
          selectedFolderSubject.add(folders.first);
        }
      }
    } else {
      if (folders?.isNotEmpty == true) {
        selectedFolderSubject.add(folders.first);
      }
    }
  }

  Future<List<IMediaDeviceFolder>> loadFoldersInformation();

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
