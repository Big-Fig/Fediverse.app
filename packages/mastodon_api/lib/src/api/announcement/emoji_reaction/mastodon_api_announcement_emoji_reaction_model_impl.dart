import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_announcement_emoji_reaction_model.dart';

part 'mastodon_api_announcement_emoji_reaction_model_impl.freezed.dart';

part 'mastodon_api_announcement_emoji_reaction_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiAnnouncementEmojiReaction
    with _$MastodonApiAnnouncementEmojiReaction
    implements IMastodonApiAnnouncementEmojiReaction {
  const factory MastodonApiAnnouncementEmojiReaction({
    @HiveField(0) required String name,
    @HiveField(1) required int count,
    @HiveField(2) required bool me,
    @HiveField(3) required String? url,
    @HiveField(4) @JsonKey(name: 'static_url') required String? staticUrl,
  }) = _MastodonApiAnnouncementEmojiReaction;

  factory MastodonApiAnnouncementEmojiReaction.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiAnnouncementEmojiReactionFromJson(json);
}

extension IMastodonApiAnnouncementEmojiReactionInterfaceExtension
    on IMastodonApiAnnouncementEmojiReaction {
  MastodonApiAnnouncementEmojiReaction toMastodonApiAnnouncementEmojiReaction({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiAnnouncementEmojiReaction(
          name: name,
          count: count,
          me: me,
          url: url,
          staticUrl: staticUrl,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiAnnouncementEmojiReactionInterfaceListExtension
    on List<IMastodonApiAnnouncementEmojiReaction> {
  List<MastodonApiAnnouncementEmojiReaction>
      toMastodonApiAnnouncementEmojiReactionList({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceListToImplList(
            this,
            (IMastodonApiAnnouncementEmojiReaction item) =>
                item.toMastodonApiAnnouncementEmojiReaction(),
            forceNewObject: forceNewObject,
          );
}
