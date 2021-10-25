import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta/unifedi_api_media_attachment_meta_model_impl.dart';
import 'unifedi_api_media_attachment_model.dart';

part 'unifedi_api_media_attachment_model_impl.freezed.dart';

part 'unifedi_api_media_attachment_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiMediaAttachment
    with _$UnifediApiMediaAttachment
    implements IUnifediApiMediaAttachment {
  const factory UnifediApiMediaAttachment({
    @HiveField(0) required String? description,
    @HiveField(1) required String id,
    @HiveField(2) @JsonKey(name: 'preview_url') required String? previewUrl,
    @HiveField(3) @JsonKey(name: 'remote_url') required String? remoteUrl,
    @HiveField(5) @JsonKey(name: 'text_url') required String? textUrl,
    @HiveField(6) @JsonKey(name: 'type') required String type,
    @HiveField(7) required String? url,
    @HiveField(8) required String? blurhash,
    @HiveField(9) required UnifediApiMediaAttachmentMeta? meta,
    @HiveField(10 + 0) @JsonKey(name: 'mime_type') required String? mimeType,
  }) = _UnifediApiMediaAttachment;

  factory UnifediApiMediaAttachment.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentFromJson(json);
}

extension UnifediApiMediaAttachmentInterfaceExtension
    on IUnifediApiMediaAttachment {
  UnifediApiMediaAttachment toUnifediApiMediaAttachment({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiMediaAttachment(
          description: description,
          id: id,
          previewUrl: previewUrl,
          remoteUrl: remoteUrl,
          textUrl: textUrl,
          type: type,
          url: url,
          blurhash: blurhash,
          meta: meta?.toUnifediApiMediaAttachmentMeta(
            forceNewObject: forceNewObject,
          ),
          mimeType: mimeType,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiMediaAttachmentInterfaceListExtension
    on List<IUnifediApiMediaAttachment> {
  List<UnifediApiMediaAttachment> toUnifediApiMediaAttachmentList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiMediaAttachment item) => item.toUnifediApiMediaAttachment(),
        forceNewObject: forceNewObject,
      );
}
