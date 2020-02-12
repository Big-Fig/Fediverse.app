import 'dart:io';
import 'dart:typed_data';

import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFileGalleryFileBloc
    implements Disposable, IAsyncInitLoadingBloc {
  static IFileGalleryFileBloc of(BuildContext context, {listen: true}) =>
      Provider.of<IFileGalleryFileBloc>(context, listen: listen);

  Future<FileGalleryFile>  retrieveFile();

  Uint8List get thumbImageData;

}
