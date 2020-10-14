import 'dart:io';

import 'package:flutter/widgets.dart';

class UploadMediaExceedFileSizeLimitException implements Exception {
  final File file;
  final int maximumFileSizeInBytes;
  final int currentFileSizeInBytes;

  UploadMediaExceedFileSizeLimitException(
      {@required this.file,
      @required this.maximumFileSizeInBytes,
      @required this.currentFileSizeInBytes});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadMediaExceedFileSizeLimitException &&
          runtimeType == other.runtimeType &&
          file == other.file &&
          maximumFileSizeInBytes == other.maximumFileSizeInBytes &&
          currentFileSizeInBytes == other.currentFileSizeInBytes;

  @override
  int get hashCode =>
      file.hashCode ^
      maximumFileSizeInBytes.hashCode ^
      currentFileSizeInBytes.hashCode;

  @override
  String toString() {
    return 'UploadMediaExceedFileSizeLimitException{file: $file,'
        ' maximumFileSizeInBytes: $maximumFileSizeInBytes,'
        ' currentFileSizeInBytes: $currentFileSizeInBytes}';
  }
}
