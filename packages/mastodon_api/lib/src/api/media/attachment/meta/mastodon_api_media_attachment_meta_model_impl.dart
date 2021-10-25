import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../focus/mastodon_api_media_attachment_focus_model_impl.dart';
import '../size/mastodon_api_media_attachment_size_model_impl.dart';
import 'mastodon_api_media_attachment_meta_model.dart';

part 'mastodon_api_media_attachment_meta_model_impl.freezed.dart';

part 'mastodon_api_media_attachment_meta_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiMediaAttachmentMeta
    with _$MastodonApiMediaAttachmentMeta
    implements IMastodonApiMediaAttachmentMeta {
  const factory MastodonApiMediaAttachmentMeta({
    @HiveField(0) required MastodonApiMediaAttachmentFocus? focus,
    @HiveField(1) required MastodonApiMediaAttachmentSize? original,
    @HiveField(2) required MastodonApiMediaAttachmentSize? small,
  }) = _MastodonApiMediaAttachmentMeta;

  factory MastodonApiMediaAttachmentMeta.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiMediaAttachmentMetaFromJson(json);
}

extension MastodonApiMediaAttachmentMetaInterfaceExtension
    on IMastodonApiMediaAttachmentMeta {
  MastodonApiMediaAttachmentMeta toMastodonApiMediaAttachmentMeta({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiMediaAttachmentMeta(
          focus: focus?.toMastodonApiMediaAttachmentFocus(
            forceNewObject: forceNewObject,
          ),
          original: original?.toMastodonApiMediaAttachmentSize(
            forceNewObject: forceNewObject,
          ),
          small: small?.toMastodonApiMediaAttachmentSize(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiMediaAttachmentMetaInterfaceListExtension
    on List<IMastodonApiMediaAttachmentMeta> {
  List<MastodonApiMediaAttachmentMeta> toMastodonApiMediaAttachmentMetaList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiMediaAttachmentMeta item) =>
            item.toMastodonApiMediaAttachmentMeta(),
        forceNewObject: forceNewObject,
      );
}
