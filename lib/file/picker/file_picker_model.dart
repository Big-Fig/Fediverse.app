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
}

typedef FilePickerSelectedFileCallback(FilePickerFile filePickerFile);