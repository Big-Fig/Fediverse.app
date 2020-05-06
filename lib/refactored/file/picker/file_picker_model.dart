import 'dart:io';

import 'package:flutter/widgets.dart';

enum FilePickerFileType { image, video, other }

enum FilePickerTab { captureVideo, captureImage, gallery }

class FilePickerFile {
  final File file;
  final FilePickerFileType type;
  final bool isNeedDeleteAfterUsage;
  FilePickerFile(
      {@required this.file,
      @required this.type,
      @required this.isNeedDeleteAfterUsage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilePickerFile &&
          runtimeType == other.runtimeType &&
          file == other.file;
  @override
  int get hashCode => file.hashCode;
  @override
  String toString() {
    return 'FilePickerFile{file: $file, type: $type,'
        ' isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage}';
  }
}

typedef FilePickerSelectedFileCallback = Function(
    FilePickerFile filePickerFile);
