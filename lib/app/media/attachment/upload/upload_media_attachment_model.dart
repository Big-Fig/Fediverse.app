import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_media_attachment_model.freezed.dart';

@freezed
class UploadMediaAttachmentState with _$UploadMediaAttachmentState {
  const factory UploadMediaAttachmentState({
    required UploadMediaAttachmentStateType type,
    dynamic error,
    StackTrace? stackTrace,
  }) = _UploadMediaAttachmentState;
}

enum UploadMediaAttachmentStateType {
  notUploaded,
  uploading,
  uploaded,
  failed,
}
