import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

abstract class IFileGalleryBloc
    implements Disposable, IPermissionBloc, IAsyncInitLoadingBloc {
  static IFileGalleryBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFileGalleryBloc>(context, listen: listen);

  Stream<FileGalleryState> get galleryStateStream;

  FileGalleryState get galleryState;

  Stream<List<AssetPathEntity>> get foldersStream;

  List<AssetPathEntity> get folders;
}
