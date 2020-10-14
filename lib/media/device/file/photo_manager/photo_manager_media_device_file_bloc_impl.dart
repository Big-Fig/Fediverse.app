import 'dart:io';
import 'dart:typed_data';

import 'package:fedi/media/device/file/media_device_file_bloc_impl.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/photo_manager/photo_manager_media_device_file_model.dart';
import 'package:fedi/media/device/photo_manager_media_device_adapter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

var _logger = Logger("photo_manager_media_device_file_bloc_impl.dart");

const _heicExtension = ".heic";

class PhotoManagerMediaDeviceFileBloc extends MediaDeviceFileBloc {
  final PhotoManagerMediaDeviceFile photoManagerMediaDeviceFile;

  PhotoManagerMediaDeviceFileBloc({@required this.photoManagerMediaDeviceFile})
      : super(
          mediaDeviceFile: photoManagerMediaDeviceFile,
        );

  AssetEntity get assetEntity => photoManagerMediaDeviceFile.assetEntity;

  @override
  Future<Uint8List> loadThumbData({int width, int height}) =>
      assetEntity.thumbDataWithSize(width, height);

  @override
  Future<IMediaDeviceFile> retrieveFile() async {
    var file = await assetEntity.file;
    var isNeedDeleteAfterUsage = false;

    var filePath = file.absolute.path;
    _logger.fine(() => "retrieveFile \n"
        "\t file $filePath");

    if (type == MediaDeviceFileType.image) {
      var extension = path.extension(filePath);
      if (extension == _heicExtension || Platform.isIOS) {
        // gallery may return photos in HEIC format
        // also ios may return photos in HEIC even with JPEG/PNG ext
        // in this case we should re-compress them to jpg
        file = await _compressToJpeg(file);
        isNeedDeleteAfterUsage = true;
      }
    }

    return PhotoManagerMediaDeviceFile(
      assetEntity: assetEntity,
      isNeedDeleteAfterUsage: isNeedDeleteAfterUsage,
    );
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
  MediaDeviceFileType get type => assetEntity.type.mapToMediaDeviceFileType();
}
