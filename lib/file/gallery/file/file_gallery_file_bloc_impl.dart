import 'dart:typed_data';

import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/file/gallery/file/file_gallery_file_bloc.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class AbstractFileGalleryFileBloc extends AsyncInitLoadingBloc
    implements IFileGalleryFileBloc {
  final AssetEntity assetEntity;

  @override
  Uint8List thumbImageData;

  AbstractFileGalleryFileBloc({@required this.assetEntity});

  @override
  Future internalAsyncInit() async {
    thumbImageData = await loadThumbData(width: 150, height: 150);
  }

  Future<Uint8List> loadThumbData({@required int width, @required int height});
}

class FileGalleryFileBloc extends AbstractFileGalleryFileBloc {
  FileGalleryFileBloc({@required AssetEntity assetEntity})
      : super(assetEntity: assetEntity);

  @override
  Future<Uint8List> loadThumbData({int width, int height}) =>
      assetEntity.thumbDataWithSize(width, height);

  @override
  Future<FileGalleryFile> retrieveFile() async =>
      FileGalleryFile(await assetEntity.file, assetEntity.type);
}
