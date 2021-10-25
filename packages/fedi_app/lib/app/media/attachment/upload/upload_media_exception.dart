import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_media_exception.freezed.dart';

@freezed
class UploadMediaExceedFileSizeLimitException
    with _$UploadMediaExceedFileSizeLimitException
    implements Exception {
  const factory UploadMediaExceedFileSizeLimitException({
    required File file,
    required int? maximumFileSizeInBytes,
    required int currentFileSizeInBytes,
  }) = _UploadMediaExceedFileSizeLimitException;
}
