import 'dart:io';
import 'dart:typed_data';

import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/file/gallery/file/file_gallery_file_bloc.dart';
import 'package:fedi/refactored/file/gallery/file_gallery_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

const heicExtension = ".heic";
var _logger = Logger("file_gallery_file_bloc_impl.dart");

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
  Future<FileGalleryFile> retrieveFile() async {
    var file = await assetEntity.file;
    var isNeedDeleteAfterUsage = false;

    var filePath = file.absolute.path;
    _logger.fine(() => "retrieveFile \n"
        "\t file $filePath");

    if (type == AssetType.image) {
      var extension = path.extension(filePath);
      if (extension == heicExtension || Platform.isIOS) {
        // gallery may return photos in HEIC format from iOS gallery
        // in this case we should re-compress them to jpg
        file = await _compressToJpeg(file);
        isNeedDeleteAfterUsage = true;
      }
    }

    return FileGalleryFile(
        file: file,
        type: assetEntity.type,
        isNeedDeleteAfterUsage: isNeedDeleteAfterUsage);
  }

  Future<File> _compressToJpeg(File file) async {
    var originPath = file.absolute.path;
    final Directory extDir = await getTemporaryDirectory();
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String dirPath = path.join(extDir.path, "gallery_picker", timestamp);
    await Directory(dirPath).create(recursive: true);
    var originalFileNameWithoutExtension =
        path.basenameWithoutExtension(file.path);
    final String resultPath =
        path.join(dirPath, "$originalFileNameWithoutExtension.jpg");
    _logger.fine(() => "_compressToJpeg \n"
        "\t originPath $originPath"
        "\t resultPath $resultPath");
    file = await FlutterImageCompress.compressAndGetFile(
      originPath,
      resultPath,
      format: CompressFormat.jpeg,
      quality: 88,
    );
    return file;
  }

  @override
  AssetType get type => assetEntity.type;
}
