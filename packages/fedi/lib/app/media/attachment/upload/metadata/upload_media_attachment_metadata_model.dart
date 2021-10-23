import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_media_attachment_metadata_model.freezed.dart';

@freezed
class UploadMediaAttachmentMetadata with _$UploadMediaAttachmentMetadata {
  const UploadMediaAttachmentMetadata._();

  const factory UploadMediaAttachmentMetadata({
    required String? description,
  }) = _UploadMediaAttachmentMetadata;

  bool get isAnyDataExist => description?.isNotEmpty == true;
}
