import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_media_attachment_focus_model.dart';

part 'mastodon_api_media_attachment_focus_model_impl.freezed.dart';

part 'mastodon_api_media_attachment_focus_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiMediaAttachmentFocus
    with _$MastodonApiMediaAttachmentFocus
    implements IMastodonApiMediaAttachmentFocus {
  @Assert('x >= -1 && x <= -1,')
  @Assert('y >= -1 && y <= -1,')
  const factory MastodonApiMediaAttachmentFocus({
    @HiveField(0) required double x,
    @HiveField(1) required double y,
  }) = _MastodonApiMediaAttachmentFocus;

  factory MastodonApiMediaAttachmentFocus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiMediaAttachmentFocusFromJson(json);
}

extension MastodonApiMediaAttachmentFocusInterfaceExtension
    on IMastodonApiMediaAttachmentFocus {
  MastodonApiMediaAttachmentFocus toMastodonApiMediaAttachmentFocus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiMediaAttachmentFocus(
          x: x,
          y: y,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiMediaAttachmentFocusInterfaceListExtension
    on List<IMastodonApiMediaAttachmentFocus> {
  List<MastodonApiMediaAttachmentFocus> toMastodonApiMediaAttachmentFocusList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiMediaAttachmentFocus item) =>
            item.toMastodonApiMediaAttachmentFocus(),
        forceNewObject: forceNewObject,
      );
}
