import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta/pleroma_api_media_attachment_meta_model_impl.dart';
import 'pleroma_api_media_attachment_model.dart';

part 'pleroma_api_media_attachment_model_impl.freezed.dart';

part 'pleroma_api_media_attachment_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiMediaAttachment
    with _$PleromaApiMediaAttachment
    implements IPleromaApiMediaAttachment {
  const factory PleromaApiMediaAttachment({
    @HiveField(0) required String? description,
    @HiveField(1) required String id,
    @HiveField(2) @JsonKey(name: 'preview_url') required String? previewUrl,
    @HiveField(3) @JsonKey(name: 'remote_url') required String? remoteUrl,
    @HiveField(5) @JsonKey(name: 'text_url') required String? textUrl,
    @HiveField(6) @JsonKey(name: 'type') required String type,
    @HiveField(7) required String? url,
    @HiveField(8) required String? blurhash,
    @HiveField(9) required PleromaApiMediaAttachmentMeta? meta,
    @HiveField(10) required PleromaApiMediaAttachmentPleromaPart? pleroma,
  }) = _PleromaApiMediaAttachment;

  factory PleromaApiMediaAttachment.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMediaAttachmentFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiMediaAttachmentPleromaPart
    with _$PleromaApiMediaAttachmentPleromaPart
    implements IPleromaApiMediaAttachmentPleromaPart {
  const factory PleromaApiMediaAttachmentPleromaPart({
    @HiveField(0) @JsonKey(name: 'mime_type') required String? mimeType,
  }) = _PleromaApiMediaAttachmentPleromaPart;

  factory PleromaApiMediaAttachmentPleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMediaAttachmentPleromaPartFromJson(json);
}

extension PleromaApiMediaAttachmentInterfaceExtension
    on IPleromaApiMediaAttachment {
  PleromaApiMediaAttachment toPleromaApiMediaAttachment({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMediaAttachment(
          description: description,
          id: id,
          previewUrl: previewUrl,
          remoteUrl: remoteUrl,
          textUrl: textUrl,
          type: type,
          url: url,
          blurhash: blurhash,
          meta: meta?.toPleromaApiMediaAttachmentMeta(
            forceNewObject: forceNewObject,
          ),
          pleroma: pleroma?.toPleromaApiMediaAttachmentPleromaPart(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiMediaAttachmentInterfaceListExtension
    on List<IPleromaApiMediaAttachment> {
  List<PleromaApiMediaAttachment> toPleromaApiMediaAttachmentList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiMediaAttachment item) => item.toPleromaApiMediaAttachment(),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiMediaAttachmentPleromaPartInterfaceExtension
    on IPleromaApiMediaAttachmentPleromaPart {
  PleromaApiMediaAttachmentPleromaPart toPleromaApiMediaAttachmentPleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMediaAttachmentPleromaPart(
          mimeType: mimeType,
        ),
        forceNewObject: forceNewObject,
      );
}
