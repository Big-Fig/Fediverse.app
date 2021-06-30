import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_local_only_list_bloc.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_pagination_bloc.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_pagination_list_bloc.dart';
import 'package:fedi/media/device/folder/media_device_folder_bloc.dart';
import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_model.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MediaDeviceGallerySelectedFolderData extends DisposableOwner
    implements IDisposable {
  final IMediaDeviceFolder folder;

  final IMediaDeviceFolderBloc folderBloc;

  final IMediaDeviceFileLocalOnlyListBloc filesListBloc;

  final IMediaDeviceFilePaginationBloc filesPaginationBloc;

  final IMediaDeviceFilePaginationListBloc filesPaginationListBloc;

  MediaDeviceGallerySelectedFolderData({
    required this.folder,
    required this.folderBloc,
    required this.filesListBloc,
    required this.filesPaginationBloc,
    required this.filesPaginationListBloc,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaDeviceGallerySelectedFolderData &&
          runtimeType == other.runtimeType &&
          folder == other.folder;

  @override
  int get hashCode => folder.hashCode;

  @override
  String toString() {
    return 'MediaDeviceGallerySelectedFolderData{folder: $folder}';
  }

  @override
  Future dispose() async {
    await super.dispose();
    await folderBloc.dispose();
    await filesListBloc.dispose();
    await filesPaginationBloc.dispose();
    await filesPaginationListBloc.dispose();
  }
}

abstract class IMediaDeviceGalleryBloc
    implements IDisposable, IPermissionBloc, IAsyncInitLoadingBloc {
  static IMediaDeviceGalleryBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaDeviceGalleryBloc>(context, listen: listen);

  Stream<MediaDeviceGalleryState> get galleryStateStream;

  MediaDeviceGalleryState? get galleryState;

  Stream<List<IMediaDeviceFolder>> get foldersStream;

  List<IMediaDeviceFolder>? get folders;

  MediaDeviceGallerySelectedFolderData? get selectedFolderData;

  Stream<MediaDeviceGallerySelectedFolderData?> get selectedFolderDataStream;

  Future selectFolder(IMediaDeviceFolder folder);

  Future refreshFoldersInformation();
}
