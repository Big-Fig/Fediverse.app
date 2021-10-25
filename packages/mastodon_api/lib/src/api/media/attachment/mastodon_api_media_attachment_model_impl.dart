import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_media_attachment_model.dart';
import 'meta/mastodon_api_media_attachment_meta_model_impl.dart';

part 'mastodon_api_media_attachment_model_impl.freezed.dart';

part 'mastodon_api_media_attachment_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiMediaAttachment
    with _$MastodonApiMediaAttachment
    implements IMastodonApiMediaAttachment {
  const factory MastodonApiMediaAttachment({
    @HiveField(0) required String? description,
    @HiveField(1) required String id,
    @HiveField(2) @JsonKey(name: 'preview_url') required String? previewUrl,
    @HiveField(3) @JsonKey(name: 'remote_url') required String? remoteUrl,
    @HiveField(5) @JsonKey(name: 'text_url') required String? textUrl,
    @HiveField(6) @JsonKey(name: 'type') required String type,
    @HiveField(7) required String? url,
    @HiveField(8) required String? blurhash,
    @HiveField(9) required MastodonApiMediaAttachmentMeta? meta,
  }) = _MastodonApiMediaAttachment;

  factory MastodonApiMediaAttachment.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiMediaAttachmentFromJson(json);
}

extension MastodonApiMediaAttachmentInterfaceExtension
    on IMastodonApiMediaAttachment {
  MastodonApiMediaAttachment toMastodonApiMediaAttachment({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiMediaAttachment(
          description: description,
          id: id,
          previewUrl: previewUrl,
          remoteUrl: remoteUrl,
          textUrl: textUrl,
          type: type,
          url: url,
          blurhash: blurhash,
          meta: meta?.toMastodonApiMediaAttachmentMeta(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiMediaAttachmentInterfaceListExtension
    on List<IMastodonApiMediaAttachment> {
  List<MastodonApiMediaAttachment> toMastodonApiMediaAttachmentList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiMediaAttachment item) =>
            item.toMastodonApiMediaAttachment(),
        forceNewObject: forceNewObject,
      );
}
