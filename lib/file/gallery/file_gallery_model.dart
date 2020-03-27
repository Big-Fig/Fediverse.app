import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';

enum FileGalleryState { loadingNotStarted, loading, loaded }

typedef FileGalleryFileCallback(FileGalleryFile galleryFile);

class FileGalleryFile {
  final File file;
  final AssetType type;
  final bool isNeedDeleteAfterUsage;
  FileGalleryFile({
    @required this.file,
    @required this.type,
    @required this.isNeedDeleteAfterUsage,
  });
}
