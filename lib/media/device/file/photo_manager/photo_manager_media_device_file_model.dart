import 'dart:io';

import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/photo_manager_media_device_adapter.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

part 'photo_manager_media_device_file_model.freezed.dart';

var _logger = Logger('photo_manager_media_device_file_model.dart');

const _heicExtension = '.heic';
const int _jpegQuality = 88;

@freezed
class PhotoManagerMediaDeviceFileMetadata
    with _$PhotoManagerMediaDeviceFileMetadata
    implements IMediaDeviceFileMetadata {
  const PhotoManagerMediaDeviceFileMetadata._();

  const factory PhotoManagerMediaDeviceFileMetadata({
    required AssetEntity assetEntity,
    required bool isNeedDeleteAfterUsage,
  }) = _PhotoManagerMediaDeviceFileMetadata;

  @override
  MediaDeviceFileType get type => assetEntity.type.mapToMediaDeviceFileType();

  @override
  String get deviceId => assetEntity.id;

  @override
  Future<IMediaDeviceFile> loadMediaDeviceFile() async {
    var file = await assetEntity.file;

    if (type == MediaDeviceFileType.image) {
      var filePath = file!.absolute.path;
      _logger.fine(() => 'retrieveFile \n'
          '\t file $filePath');
      var extension = path.extension(filePath);
      if (extension == _heicExtension || Platform.isIOS) {
        // gallery may return photos in HEIC format
        // also ios may return photos in HEIC even with JPEG/PNG ext
        // in this case we should re-compress them to jpg

        var reCompressedFile = await _compressToJpeg(file);

        return PhotoManagerMediaDeviceFile(
          metadata: this,
          reCompressedFile: reCompressedFile,
        );
      } else {
        return PhotoManagerMediaDeviceFile(
          metadata: this,
          reCompressedFile: null,
        );
      }
    } else {
      return PhotoManagerMediaDeviceFile(
        metadata: this,
        reCompressedFile: null,
      );
    }
  }

  Future<File?> _compressToJpeg(File file) async {
    var originPath = file.absolute.path;
    final extDir = await getTemporaryDirectory();
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final dirPath = path.join(extDir.path, 'gallery_picker', timestamp);
    await Directory(dirPath).create(recursive: true);
    var originalFileNameWithoutExtension =
        path.basenameWithoutExtension(file.path);
    final resultPath =
        path.join(dirPath, '$originalFileNameWithoutExtension.jpg');
    _logger.fine(() => '_compressToJpeg \n'
        '\t originPath $originPath'
        '\t resultPath $resultPath');
    var result = await FlutterImageCompress.compressAndGetFile(
      originPath,
      resultPath,
      format: CompressFormat.jpeg,
      quality: _jpegQuality,
    );

    return result!;
  }
}

@freezed
class PhotoManagerMediaDeviceFile
    with _$PhotoManagerMediaDeviceFile
    implements IMediaDeviceFile {
  const PhotoManagerMediaDeviceFile._();

  const factory PhotoManagerMediaDeviceFile({
    required PhotoManagerMediaDeviceFileMetadata metadata,
    required File? reCompressedFile,
  }) = _PhotoManagerMediaDeviceFile;

  @override
  Future<File> loadFile() async {
    if (reCompressedFile != null) {
      return reCompressedFile!;
    } else {
      return (await metadata.assetEntity.file)!;
    }
  }

  @override
  Future delete() async {
    if (reCompressedFile != null) {
      return reCompressedFile!.deleteSync();
    } else {
      return (await loadFile()).deleteSync();
    }
  }

  @override
  Future<String> calculateFilePath() => loadFile().then((file) => file.path);

  @override
  bool get isNeedDeleteAfterUsage {
    if (reCompressedFile != null) {
      return true;
    } else {
      return metadata.isNeedDeleteAfterUsage;
    }
  }
}
