import 'dart:io';

import 'package:fedi/file/file_model.dart';
import 'package:flutter/widgets.dart';

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
