import 'dart:typed_data';

import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/file/gallery/file/file_gallery_file_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class AbstractFileGalleryFileBloc extends AsyncInitLoadingBloc
    implements IFileGalleryFileBloc {
  final AssetEntity file;

  @override
  Uint8List thumbImageData;

  AbstractFileGalleryFileBloc({@required this.file});

  @override
  Future internalAsyncInit() async {
    thumbImageData = await loadThumbData(width: 150, height: 150);
  }

  Future<Uint8List> loadThumbData({@required int width, @required int height});
}

class FileGalleryFileBloc extends AbstractFileGalleryFileBloc {
  FileGalleryFileBloc({@required AssetEntity file}) : super(file: file);

  @override
  Future<Uint8List> loadThumbData({int width, int height}) =>
      file.thumbDataWithSize(width, height);

}
