import 'dart:io';

import 'package:photo_manager/photo_manager.dart';

enum FileGalleryState {
  loadingNotStarted, loading, loaded
}

typedef FileGalleryFileCallback(FileGalleryFile galleryFile);

class FileGalleryFile {
  final File file;
  final AssetType type;
  FileGalleryFile(this.file, this.type);


}