import 'dart:typed_data';

import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/file/gallery/file_gallery_model.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

abstract class IFileGalleryFileBloc
    implements Disposable, IAsyncInitLoadingBloc {
  static IFileGalleryFileBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFileGalleryFileBloc>(context, listen: listen);

  Future<FileGalleryFile> retrieveFile();

  AssetType get type;

  Uint8List get thumbImageData;
}
