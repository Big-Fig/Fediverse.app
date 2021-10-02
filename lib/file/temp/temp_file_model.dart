import 'package:freezed_annotation/freezed_annotation.dart';

part 'temp_file_model.freezed.dart';

@freezed
class DownloadTempFileRequest with _$DownloadTempFileRequest {
  const factory DownloadTempFileRequest({
    required String url,
    required String filenameWithExtension,
  }) = _DownloadTempFileRequest;
}
