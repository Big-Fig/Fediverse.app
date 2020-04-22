import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/file/gallery/file_gallery_model.dart';
import 'package:fedi/refactored/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

abstract class IFileGalleryFolderBloc
    implements Disposable, IPermissionBloc, IAsyncInitLoadingBloc {
  static IFileGalleryFolderBloc of(BuildContext context, {listen: true}) =>
      Provider.of<IFileGalleryFolderBloc>(context, listen: listen);

  Stream<FileGalleryState> get galleryStateStream;

  FileGalleryState get galleryState;

  Stream<List<AssetEntity>> get filesStream;

  List<AssetEntity> get files;
}
