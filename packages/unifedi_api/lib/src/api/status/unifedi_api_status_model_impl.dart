import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/unifedi_api_account_model_impl.dart';
import '../application/unifedi_api_application_model_impl.dart';
import '../card/unifedi_api_card_model_impl.dart';
import '../content/variants/unifedi_api_content_variants_model_impl.dart';
import '../emoji/reaction/unifedi_api_emoji_reaction_model_impl.dart';
import '../emoji/unifedi_api_emoji_model_impl.dart';
import '../media/attachment/unifedi_api_media_attachment_model_impl.dart';
import '../mention/unifedi_api_mention_model_impl.dart';
import '../poll/unifedi_api_poll_model_impl.dart';
import '../tag/unifedi_api_tag_model_impl.dart';
import 'unifedi_api_status_model.dart';

part 'unifedi_api_status_model_impl.freezed.dart';

part 'unifedi_api_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiStatus with _$UnifediApiStatus implements IUnifediApiStatus {
  const factory UnifediApiStatus({
    @HiveField(0)
        required String id,
    @HiveField(1)
    @JsonKey(name: 'created_at')
        required DateTime createdAt,
    @HiveField(2)
    @JsonKey(name: 'in_reply_to_id')
        required String? inReplyToId,
    @HiveField(3)
    @JsonKey(name: 'in_reply_to_account_id')
        required String? inReplyToAccountId,
    @HiveField(4)
        required bool sensitive,
    @HiveField(5)
    @JsonKey(name: 'spoiler_text')
        required String? spoilerText,
    @HiveField(6)
        required String uri,
    @HiveField(7)
        required String? url,
    @HiveField(8)
    @JsonKey(name: 'replies_count')
        required int? repliesCount,
    @HiveField(9)
    @JsonKey(name: 'reblogs_count')
        required int? reblogsCount,
    @HiveField(10)
    @JsonKey(name: 'favourites_count')
        required int? favouritesCount,
    @HiveField(11)
        required bool? favourited,
    @HiveField(12)
        required bool? reblogged,
    @HiveField(13)
        required bool? muted,
    @HiveField(14)
        required bool? bookmarked,
    @HiveField(15)
        required bool? pinned,
    @HiveField(16)
        required String? content,
    @HiveField(17)
        required UnifediApiStatus? reblog,
    @HiveField(18)
        required UnifediApiApplication? application,
    @HiveField(19)
        required UnifediApiAccount account,
    @HiveField(20)
    @JsonKey(name: 'media_attachments')
        required List<UnifediApiMediaAttachment>? mediaAttachments,
    @HiveField(21)
        required List<UnifediApiMention>? mentions,
    @HiveField(22)
        required List<UnifediApiTag>? tags,
    @HiveField(23)
        required List<UnifediApiEmoji>? emojis,
    @HiveField(24)
        required UnifediApiPoll? poll,
    @HiveField(25)
        required UnifediApiCard? card,
    @HiveField(27)
        required String? language,
    @HiveField(28)
        required String visibility,

    // a map consisting of alternate representations
    // of the content property with
    // the key being it's mimetype.
    // Currently the only alternate representation supported is text/plain
    @HiveField(29 + 0)
    @JsonKey(name: 'content_variants')
        required UnifediApiContentVariants? contentVariants,

    // the ID of the AP context the status is associated with (if any)
    @JsonKey(name: 'conversation_id')
    @HiveField(29 + 1)
        required int? conversationId,

    // the ID of the Mastodon direct message conversation the status
    // is associated with (if any)
    @HiveField(29 + 2)
    @JsonKey(name: 'direct_conversation_id')
        required int? directConversationId,

    // the acct property of User entity for replied user (if any)
    @JsonKey(name: 'in_reply_to_account_acct')
    @HiveField(29 + 3)
        required String? inReplyToAccountAcct,
    @HiveField(29 + 4)
        required bool? local,
    @JsonKey(name: 'spoiler_text_content_variants')
    // a map consisting of alternate
    // representations of the spoiler_text property
    // with the key being it's mimetype. Currently the only alternate
    // representation supported is text/plain
    @HiveField(29 + 5)
        required UnifediApiContentVariants? spoilerTextVariants,

    // a datetime (iso8601) that states when
    // the post will expire (be deleted automatically),
    // or empty if the post wont expire
    @JsonKey(name: 'expires_at')
    //  will be resolved
//  DateTime expiresAt,
    @HiveField(29 + 6)
        required DateTime? expiresAt,
    @HiveField(29 + 7)
    @JsonKey(name: 'thread_muted')
        required bool? threadMuted,

    // A list with emoji / reaction maps. The format is
    // {name: '☕', count: 1, me: true}.
    // Contains no information about the reacting users,
    // for that use the /statuses/:id/reactions endpoint.
    @HiveField(29 + 8)
    @JsonKey(name: 'emoji_reactions')
        required List<UnifediApiEmojiReaction>? emojiReactions,
  }) = _UnifediApiStatus;

  factory UnifediApiStatus.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiStatusFromJson(json);
}

extension IUnifediApiStatusInterfaceExtension on IUnifediApiStatus {
  // ignore: long-method
  UnifediApiStatus toUnifediApiStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiStatus(
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
          reblog: reblog?.toUnifediApiStatus(
            forceNewObject: forceNewObject,
          ),
          application: application?.toUnifediApiApplication(
            forceNewObject: forceNewObject,
          ),
          account: account.toUnifediApiAccount(
            forceNewObject: forceNewObject,
          ),
          mediaAttachments: mediaAttachments?.toUnifediApiMediaAttachmentList(
            forceNewObject: forceNewObject,
          ),
          mentions: mentions?.toUnifediApiMentionList(
            forceNewObject: forceNewObject,
          ),
          tags: tags?.toUnifediApiTagList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toUnifediApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          poll: poll?.toUnifediApiPoll(forceNewObject: forceNewObject),
          card: card?.toUnifediApiCard(forceNewObject: forceNewObject),
          spoilerTextVariants:
              spoilerTextVariants?.toUnifediApiContentVariants(),
          conversationId: conversationId,
          directConversationId: directConversationId,
          inReplyToAccountAcct: inReplyToAccountAcct,
          local: local,
          contentVariants: contentVariants?.toUnifediApiContentVariants(),
          expiresAt: expiresAt,
          threadMuted: threadMuted,
          emojiReactions: emojiReactions?.toUnifediApiEmojiReactionList(
            forceNewObject: forceNewObject,
          ),
          visibility: visibility,
          language: language,
          content: content,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiStatusInterfaceListExtension on List<IUnifediApiStatus> {
  List<UnifediApiStatus> toUnifediApiStatusList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiStatus item) => item.toUnifediApiStatus(),
        forceNewObject: forceNewObject,
      );
}
