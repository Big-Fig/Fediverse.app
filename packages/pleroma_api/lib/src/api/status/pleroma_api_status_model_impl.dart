import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/pleroma_api_account_model_impl.dart';
import '../application/pleroma_api_application_model_impl.dart';
import '../card/pleroma_api_card_model_impl.dart';
import '../content/variants/pleroma_api_content_variants_model_impl.dart';
import '../emoji/pleroma_api_emoji_model_impl.dart';
import '../media/attachment/pleroma_api_media_attachment_model_impl.dart';
import '../mention/pleroma_api_mention_model_impl.dart';
import '../poll/pleroma_api_poll_model_impl.dart';
import '../tag/pleroma_api_tag_model_impl.dart';
import 'emoji_reaction/pleroma_api_status_emoji_reaction_model_impl.dart';
import 'pleroma_api_status_model.dart';

part 'pleroma_api_status_model_impl.freezed.dart';

part 'pleroma_api_status_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiStatus with _$PleromaApiStatus implements IPleromaApiStatus {
  const factory PleromaApiStatus({
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
    @HiveField(17) required PleromaApiStatus? reblog,
    @HiveField(18) required PleromaApiApplication? application,
    @HiveField(19) required PleromaApiAccount account,
    @HiveField(20)
    @JsonKey(name: 'media_attachments')
        required List<PleromaApiMediaAttachment>? mediaAttachments,
    @HiveField(21) required List<PleromaApiMention>? mentions,
    @HiveField(22) required List<PleromaApiTag>? tags,
    @HiveField(23) required List<PleromaApiEmoji>? emojis,
    @HiveField(24) required PleromaApiPoll? poll,
    @HiveField(25) required PleromaApiCard? card,
    @HiveField(26) required PleromaApiStatusPleromaPart? pleroma,
    @HiveField(27) required String? language,
    @HiveField(28) required String visibility,
  }) = _PleromaApiStatus;

  factory PleromaApiStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiStatusFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiStatusPleromaPart
    with _$PleromaApiStatusPleromaPart
    implements IPleromaApiStatusPleromaPart {
  const factory PleromaApiStatusPleromaPart({
    // a map consisting of alternate representations
    // of the content property with
    // the key being it's mimetype.
    // Currently the only alternate representation supported is text/plain
    @HiveField(0)
        required PleromaApiContentVariants? content,

    // the ID of the AP context the status is associated with (if any)
    @JsonKey(name: 'conversation_id')
    @HiveField(1)
        required int? conversationId,

    // the ID of the Mastodon direct message conversation the status
    // is associated with (if any)
    @HiveField(2)
    @JsonKey(name: 'direct_conversation_id')
        required int? directConversationId,

    // the acct property of User entity for replied user (if any)
    @JsonKey(name: 'in_reply_to_account_acct')
    @HiveField(3)
        required String? inReplyToAccountAcct,
    @HiveField(4)
        required bool? local,
    @JsonKey(name: 'spoiler_text')
    // a map consisting of alternate
    // representations of the spoiler_text property
    // with the key being it's mimetype. Currently the only alternate
    // representation supported is text/plain
    @HiveField(5)
        required PleromaApiContentVariants? spoilerText,

    // a datetime (iso8601) that states when
    // the post will expire (be deleted automatically),
    // or empty if the post wont expire
    @JsonKey(name: 'expires_at')
    //  will be resolved
//  DateTime expiresAt,
    @HiveField(6)
        required DateTime? expiresAt,
    @HiveField(7)
    @JsonKey(name: 'thread_muted')
        required bool? threadMuted,

    // A list with emoji / reaction maps. The format is
    // {name: '☕', count: 1, me: true}.
    // Contains no information about the reacting users,
    // for that use the /statuses/:id/reactions endpoint.
    @HiveField(8)
    @JsonKey(name: 'emoji_reactions')
        required List<PleromaApiStatusEmojiReaction>? emojiReactions,
  }) = _PleromaApiStatusPleromaPart;

  factory PleromaApiStatusPleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiStatusPleromaPartFromJson(json);
}

extension IPleromaApiStatusInterfaceExtension on IPleromaApiStatus {
  // ignore: long-method
  PleromaApiStatus toPleromaApiStatus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiStatus(
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
          reblog: reblog?.toPleromaApiStatus(
            forceNewObject: forceNewObject,
          ),
          application: application?.toPleromaApiApplication(
            forceNewObject: forceNewObject,
          ),
          account: account.toPleromaApiAccount(
            forceNewObject: forceNewObject,
          ),
          mediaAttachments: mediaAttachments?.toPleromaApiMediaAttachmentList(
            forceNewObject: forceNewObject,
          ),
          mentions: mentions?.toPleromaApiMentionList(
            forceNewObject: forceNewObject,
          ),
          tags: tags?.toPleromaApiTagList(
            forceNewObject: forceNewObject,
          ),
          emojis: emojis?.toPleromaApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          poll: poll?.toPleromaApiPoll(forceNewObject: forceNewObject),
          card: card?.toPleromaApiCard(forceNewObject: forceNewObject),
          pleroma: pleroma?.toPleromaApiStatusPleromaPart(
            forceNewObject: forceNewObject,
          ),
          visibility: visibility,
          language: language,
          content: content,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiStatusInterfaceListExtension on List<IPleromaApiStatus> {
  List<PleromaApiStatus> toPleromaApiStatusList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiStatus item) => item.toPleromaApiStatus(),
        forceNewObject: forceNewObject,
      );
}

extension IPleromaApiStatusPleromaPartInterfaceExtension
    on IPleromaApiStatusPleromaPart {
  PleromaApiStatusPleromaPart toPleromaApiStatusPleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiStatusPleromaPart(
          content: content?.toPleromaApiContentVariants(),
          conversationId: conversationId,
          directConversationId: directConversationId,
          inReplyToAccountAcct: inReplyToAccountAcct,
          local: local,
          spoilerText: spoilerText?.toPleromaApiContentVariants(),
          expiresAt: expiresAt,
          threadMuted: threadMuted,
          emojiReactions: emojiReactions?.toPleromaApiStatusEmojiReactionList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
