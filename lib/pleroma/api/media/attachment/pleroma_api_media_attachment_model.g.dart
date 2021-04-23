// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_media_attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaMediaAttachment _$PleromaMediaAttachmentFromJson(
    Map<String, dynamic> json) {
  return PleromaMediaAttachment(
    description: json['description'] as String?,
    id: json['id'] as String,
    previewUrl: json['preview_url'] as String?,
    remoteUrl: json['remote_url'] as String?,
    textUrl: json['text_url'] as String?,
    type: json['type'] as String,
    url: json['url'] as String,
    pleroma: json['pleroma'] == null
        ? null
        : PleromaMediaAttachmentPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaMediaAttachmentToJson(
        PleromaMediaAttachment instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'preview_url': instance.previewUrl,
      'remote_url': instance.remoteUrl,
      'text_url': instance.textUrl,
      'type': instance.type,
      'url': instance.url,
      'pleroma': instance.pleroma,
    };

PleromaMediaAttachmentPleromaPart _$PleromaMediaAttachmentPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaMediaAttachmentPleromaPart(
    mimeType: json['mime_type'] as String?,
  );
}

Map<String, dynamic> _$PleromaMediaAttachmentPleromaPartToJson(
        PleromaMediaAttachmentPleromaPart instance) =>
    <String, dynamic>{
      'mime_type': instance.mimeType,
    };
