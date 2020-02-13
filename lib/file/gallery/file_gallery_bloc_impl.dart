import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/file/gallery/file_gallery_bloc.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("file_gallery_bloc_impl.dart");

abstract class AbstractFileGalleryBloc extends AsyncInitLoadingBloc
    implements Disposable, IPermissionBloc, IFileGalleryBloc {
  final IStoragePermissionBloc storagePermissionBloc;
  final List<FilePickerFileType> fileTypesToPick;

  AbstractFileGalleryBloc({
    @required this.storagePermissionBloc,
    @required this.fileTypesToPick,
  }) {
    addDisposable(subject: foldersSubject);
    addDisposable(subject: galleryStateSubject);
  }

  // ignore: close_sinks
  BehaviorSubject<List<AssetPathEntity>> foldersSubject = BehaviorSubject();

  @override
  Stream<List<AssetPathEntity>> get foldersStream => foldersSubject.stream;

  @override
  List<AssetPathEntity> get folders => foldersSubject.value;

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
        if (granted && folders?.isNotEmpty != true) {
          _initAfterPermissionGranted();
        }
      }));
    }
  }

  Future _initAfterPermissionGranted() async {
    return await reloadFolders();
  }

  reloadFolders() async {
    assert(permissionGranted);
    galleryStateSubject.add(FileGalleryState.loading);
    var folders = await loadFolders();
    _logger.fine(() => "loadFolders $folders");
    folders.sort(FileGalleryBloc.compareAlbumsAlphabeticallyAndFeatured);
    foldersSubject.add(folders);
    galleryStateSubject.add(FileGalleryState.loaded);
  }

  Future<List<AssetPathEntity>> loadFolders();

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

class FileGalleryBloc extends AbstractFileGalleryBloc {
  FileGalleryBloc(
      {@required IStoragePermissionBloc storagePermissionBloc,
      @required List<FilePickerFileType> fileTypesToPick})
      : super(
            storagePermissionBloc: storagePermissionBloc,
            fileTypesToPick: fileTypesToPick) {
    addDisposable(disposable: CustomDisposable(() {
      PhotoManager.releaseCache();
    }));
  }

  Future<List<AssetPathEntity>> loadFolders() async =>
      await PhotoManager.getAssetPathList(
          type: mapFileTypesToPickToRequestType(fileTypesToPick));

  static int compareAlbumsAlphabeticallyAndFeatured(
      AssetPathEntity a, AssetPathEntity b) {
    var aName = a.name;
    var bName = b.name;

    // TODO: refactor for android & different languages
    // or wait until photo_manager lib will return album type
    return compareAlbumTitlesAlphabeticallyAndFeatured(aName, bName);
  }

  static int compareAlbumTitlesAlphabeticallyAndFeatured(String aName, String bName) {

    // TODO: refactor for android & different languages
    // or wait until photo_manager lib will return album type
    const List<String> iosLatestEnNames = ["Recently Added", "Recents"];
    List<String> featuredNames = [...iosLatestEnNames];

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
      List<FilePickerFileType> fileTypesToPick) {
    var isNeedImage = fileTypesToPick.contains(FilePickerFileType.image);
    var isNeedVideo = fileTypesToPick.contains(FilePickerFileType.video);
    if (isNeedImage && isNeedVideo) {
      return RequestType.all;
    }
    if (isNeedImage && !isNeedVideo) {
      return RequestType.image;
    }
    if (!isNeedImage && isNeedVideo) {
      return RequestType.video;
    }

    throw "fileTypesToPick should containe image or video type";
  }
}
