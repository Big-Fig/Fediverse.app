import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_model.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaDeviceGalleryBloc
    implements IDisposable, IPermissionBloc, IAsyncInitLoadingBloc {
  static IMediaDeviceGalleryBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMediaDeviceGalleryBloc>(context, listen: listen);

  Stream<MediaDeviceGalleryState> get galleryStateStream;

  MediaDeviceGalleryState get galleryState;

  Stream<List<IMediaDeviceFolder>> get foldersStream;

  List<IMediaDeviceFolder> get folders;
  IMediaDeviceFolder get selectedFolder;
  Stream<IMediaDeviceFolder> get selectedFolderStream;

  void selectFolder(IMediaDeviceFolder folder);

  Future refreshFoldersInformation();
}
