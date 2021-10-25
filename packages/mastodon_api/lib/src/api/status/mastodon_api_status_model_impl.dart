import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/mastodon_api_account_model_impl.dart';
import '../application/mastodon_api_application_model_impl.dart';
import '../card/mastodon_api_card_model_impl.dart';
import '../emoji/mastodon_api_emoji_model_impl.dart';
import '../media/attachment/mastodon_api_media_attachment_model_impl.dart';
import '../mention/mastodon_api_mention_model_impl.dart';
import '../poll/mastodon_api_poll_model_impl.dart';
import '../tag/mastodon_api_tag_model_impl.dart';
import 'mastodon_api_status_model.dart';

part 'mastodon_api_status_model_impl.freezed.dart';

part 'mastodon_api_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiStatus with _$MastodonApiStatus implements IMastodonApiStatus {
  const factory MastodonApiStatus({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(2) @JsonKey(name: 'in_reply_to_id') required String? inReplyToId,
    @HiveField(3)
    @JsonKey(name: 'in_reply_to_account_id')
        required String? inReplyToAccountId,
    @HiveField(4) required bool sensitive,
    @HiveField(5) @JsonKey(name: 'spoiler_text') required String? spoilerText,
    @HiveField(6) required String uri,
    @HiveField(7) required String? url,
    @HiveField(8) @JsonKey(name: 'replies_count') required int? repliesCount,
    @HiveField(9) @JsonKey(name: 'reblogs_count') required int? reblogsCount,
    @HiveField(10)
    @JsonKey(name: 'favourites_count')
        required int? favouritesCount,
    @HiveField(11) required bool? favourited,
    @HiveField(12) required bool? reblogged,
    @HiveField(13) required bool? muted,
    @HiveField(14) required bool? bookmarked,
    @HiveField(15) required bool? pinned,
    @HiveField(16) required String? content,
    @HiveField(17) required MastodonApiStatus? reblog,
    @HiveField(18) required MastodonApiApplication? application,
    @HiveField(19) required MastodonApiAccount account,
    @HiveField(20)
    @JsonKey(name: 'media_attachments')
        required List<MastodonApiMediaAttachment>? mediaAttachments,
    @HiveField(21) required List<MastodonApiMention>? mentions,
    @HiveField(22) required List<MastodonApiTag>? tags,
    @HiveField(23) required List<MastodonApiEmoji>? emojis,
    @HiveField(24) required MastodonApiPoll? poll,
    @HiveField(25) required MastodonApiCard? card,
    @HiveField(27) required String? language,
    @HiveField(28) required String visibility,
  }) = _MastodonApiStatus;

  factory MastodonApiStatus.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiStatusFromJson(json);
}

extension IMastodonApiStatusInterfaceExtension on IMastodonApiStatus {
  // ignore: long-method
  MastodonApiStatus toMastodonApiStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiStatus(
          id: id,
          createdAt: createdAt,
          inReplyToId: inReplyToId,
          inReplyToAccountId: inReplyToAccountId,
          sensitive: sensitive,
          spoilerText: spoilerText,
          uri: uri,
          url: url,
          repliesCount: repliesCount,
          reblogsCount: reblogsCount,
          favouritesCount: favouritesCount,
          favourited: favourited,
          reblogged: reblogged,
          muted: muted,
          bookmarked: bookmarked,
          pinned: pinned,
          reblog: reblog?.toMastodonApiStatus(
            forceNewObject: forceNewObject,
          ),
          application: application?.toMastodonApiApplication(
            forceNewObject: forceNewObject,
          ),
          account: account.toMastodonApiAccount(
            forceNewObject: forceNewObject,
          ),
          mediaAttachments: mediaAttachments?.toMastodonApiMediaAttachmentList(
            forceNewObject: forceNewObject,
          ),
          mentions: mentions?.toMastodonApiMentionList(
            forceNewObject: forceNewObject,
          ),
          tags: tags?.toMastodonApiTagList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toMastodonApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          poll: poll?.toMastodonApiPoll(forceNewObject: forceNewObject),
          card: card?.toMastodonApiCard(forceNewObject: forceNewObject),
          visibility: visibility,
          language: language,
          content: content,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IMastodonApiStatusInterfaceListExtension on List<IMastodonApiStatus> {
  List<MastodonApiStatus> toMastodonApiStatusList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiStatus item) => item.toMastodonApiStatus(),
        forceNewObject: forceNewObject,
      );
}
