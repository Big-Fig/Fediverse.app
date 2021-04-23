import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:fedi/mastodon/api/status/mastodon_api_status_model.dart';
import 'package:fedi/mastodon/api/visibility/mastodon_api_visibility_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/content/pleroma_api_content_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_status_model.g.dart';

Function eq = const ListEquality().equals;

abstract class IPleromaApiStatus implements IMastodonApiStatus {
  @override
  IPleromaApiApplication? get application;

  @override
  IPleromaApiAccount get account;

  @override
  List<IPleromaApiMediaAttachment>? get mediaAttachments;

  @override
  List<IPleromaApiMention>? get mentions;

  @override
  List<IPleromaApiTag>? get tags;

  @override
  List<IPleromaApiEmoji>? get emojis;

  @override
  IPleromaApiPoll? get poll;

  @override
  IPleromaApiCard? get card;

  @override
  IPleromaApiStatus? get reblog;

  PleromaApiStatusPleromaPart? get pleroma;

  PleromaApiVisibility get visibilityPleroma;
}

extension IPleromaApiStatusListExtension on List<IPleromaApiStatus> {
  List<PleromaApiStatus> toPleromaApiStatuses() {
    if (this is List<PleromaApiStatus>) {
      return this as List<PleromaApiStatus>;
    } else {
      return map(
        (pleromaApiStatus) => pleromaApiStatus.toPleromaApiStatus(),
      ).toList();
    }
  }
}

extension IPleromaApiStatusExtension on IPleromaApiStatus {
  PleromaApiStatus toPleromaApiStatus() {
    if (this is PleromaApiStatus) {
      return this as PleromaApiStatus;
    } else {
      return PleromaApiStatus(
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
        reblog: reblog?.toPleromaApiStatus(),
        application: application?.toPleromaApiApplication(),
        account: account.toPleromaApiAccount(),
        mediaAttachments: mediaAttachments?.toPleromaApiMediaAttachments(),
        mentions: mentions?.toPleromaApiMentions(),
        tags: tags?.toPleromaApiTags(),
        emojis: emojis?.toPleromaApiEmojis(),
        poll: poll?.toPleromaApiPoll(),
        card: card?.toPleromaApiCard(),
        pleroma: pleroma,
        visibility: visibility,
        language: language,
        content: content,
      );
    }
  }
}

abstract class IPleromaApiScheduledStatus extends IMastodonApiScheduledStatus {
  @override
  IPleromaApiScheduledStatusParams get params;

  @override
  List<IPleromaApiMediaAttachment>? get mediaAttachments;
}

abstract class IPleromaApiScheduledStatusParams
    extends IMastodonApiScheduledStatusParams {
  List<String>? get to;

  String? get inReplyToConversationId;

  int? get expiresInSeconds;

  PleromaApiVisibility get visibilityPleroma =>
      visibility.toPleromaApiVisibility();
}

@JsonSerializable()
class PleromaApiScheduledStatus extends IPleromaApiScheduledStatus {
  @override
  final String id;

  @override
  @JsonKey(name: "media_attachments")
  final List<PleromaApiMediaAttachment>? mediaAttachments;

  @override
  final PleromaApiScheduledStatusParams params;

  @JsonKey(name: "scheduled_at")
  @override
  final DateTime scheduledAt;

  PleromaApiScheduledStatus({
    required this.id,
    required this.mediaAttachments,
    required this.params,
    required this.scheduledAt,
  });

  factory PleromaApiScheduledStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiScheduledStatusFromJson(json);

  factory PleromaApiScheduledStatus.fromJsonString(String jsonString) =>
      _$PleromaApiScheduledStatusFromJson(jsonDecode(jsonString));

  static List<PleromaApiScheduledStatus> listFromJsonString(String str) =>
      List<PleromaApiScheduledStatus>.from(
        json.decode(str).map((x) => PleromaApiScheduledStatus.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaApiScheduledStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiScheduledStatusToJson(this));

  @override
  String toString() {
    return 'PleromaApiScheduledStatus{'
        'id: $id, '
        'mediaAttachments: $mediaAttachments, '
        'params: $params, '
        'scheduledAt: $scheduledAt'
        '}';
  }
}

@JsonSerializable(explicitToJson: true)
class PleromaApiScheduledStatusParams extends IPleromaApiScheduledStatusParams {
  @override
  final int? expiresInSeconds;
  @override
  final String? text;

  @override
  @JsonKey(name: "media_ids")
  final List<String>? mediaIds;

  @override
  final bool sensitive;

  @override
  @JsonKey(name: "spoiler_text")
  final String? spoilerText;

  @override
  final String visibility;

  @override
  final String? language;

  @override
  @JsonKey(name: "scheduled_at")
  final DateTime scheduledAt;

  @override
  final PleromaApiPostStatusPoll? poll;

  @override
  final String? idempotency;

  @override
  @JsonKey(name: "in_reply_to_id")
  final String? inReplyToId;

  @override
  @JsonKey(name: "application_id")
  // int or String
  final dynamic applicationId;

  @override
  @JsonKey(name: "in_reply_to_conversation_id")
  final String? inReplyToConversationId;

  @override
  IPleromaApiStatus? get inReplyToPleromaApiStatus => null;

  @override
  @JsonKey(name: "to")
  final List<String>? to;

  PleromaApiScheduledStatusParams({
    required this.text,
    required this.mediaIds,
    required this.sensitive,
    required this.spoilerText,
    required this.visibility,
    required this.scheduledAt,
    required this.poll,
    required this.idempotency,
    required this.inReplyToId,
    required this.applicationId,
    required this.language,
    required this.expiresInSeconds,
    required this.to,
    required this.inReplyToConversationId,
  });

  PleromaApiScheduledStatusParams.only({
    this.text,
    this.mediaIds,
    required this.sensitive,
    this.spoilerText,
    required this.visibility,
    required this.scheduledAt,
    this.poll,
    this.idempotency,
    this.inReplyToId,
    this.applicationId,
    this.language,
    this.expiresInSeconds,
    this.to,
    this.inReplyToConversationId,
  });

  factory PleromaApiScheduledStatusParams.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiScheduledStatusParamsFromJson(json);

  factory PleromaApiScheduledStatusParams.fromJsonString(String jsonString) =>
      _$PleromaApiScheduledStatusParamsFromJson(jsonDecode(jsonString));

  static List<PleromaApiScheduledStatusParams> listFromJsonString(String str) =>
      List<PleromaApiScheduledStatusParams>.from(json
          .decode(str)
          .map((x) => PleromaApiScheduledStatusParams.fromJson(x)));

  Map<String, dynamic> toJson() =>
      _$PleromaApiScheduledStatusParamsToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaApiScheduledStatusParamsToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiScheduledStatusParams &&
          runtimeType == other.runtimeType &&
          expiresInSeconds == other.expiresInSeconds &&
          text == other.text &&
          eq(mediaIds, other.mediaIds) &&
          sensitive == other.sensitive &&
          spoilerText == other.spoilerText &&
          visibility == other.visibility &&
          language == other.language &&
          scheduledAt == other.scheduledAt &&
          poll == other.poll &&
          idempotency == other.idempotency &&
          inReplyToId == other.inReplyToId &&
          applicationId == other.applicationId &&
          inReplyToConversationId == other.inReplyToConversationId &&
          eq(to, other.to);

  @override
  int get hashCode =>
      expiresInSeconds.hashCode ^
      text.hashCode ^
      mediaIds.hashCode ^
      sensitive.hashCode ^
      spoilerText.hashCode ^
      visibility.hashCode ^
      language.hashCode ^
      scheduledAt.hashCode ^
      poll.hashCode ^
      idempotency.hashCode ^
      inReplyToId.hashCode ^
      applicationId.hashCode ^
      inReplyToConversationId.hashCode ^
      to.hashCode;

  @override
  String toString() {
    return 'PleromaApiScheduledStatusParams{'
        'expiresInSeconds: $expiresInSeconds, '
        'text: $text, '
        'mediaIds: $mediaIds, '
        'sensitive: $sensitive, '
        'spoilerText: $spoilerText, '
        'visibility: $visibility, '
        'language: $language, '
        'scheduledAt: $scheduledAt, '
        'poll: $poll, '
        'idempotency: $idempotency, '
        'inReplyToId: $inReplyToId, '
        'applicationId: $applicationId, '
        'inReplyToConversationId: $inReplyToConversationId, '
        'to: $to'
        '}';
  }
}

@JsonSerializable(explicitToJson: true)
class PleromaApiStatus extends IPleromaApiStatus {
  @override
  final String id;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "in_reply_to_id")
  final String? inReplyToId;
  @override
  @JsonKey(name: "in_reply_to_account_id")
  String? inReplyToAccountId;
  @override
  final bool sensitive;
  @override
  @JsonKey(name: "spoiler_text")
  final String? spoilerText;

  @override
  final String uri;
  @override
  final String? url;
  @override
  @JsonKey(name: "replies_count")
  final int? repliesCount;
  @override
  @JsonKey(name: "reblogs_count")
  final int? reblogsCount;
  @override
  @JsonKey(name: "favourites_count")
  final int? favouritesCount;
  @override
  final bool? favourited;
  @override
  final bool? reblogged;
  @override
  final bool? muted;
  @override
  final bool? bookmarked;
  @override
  final bool? pinned;
  @override
  final String? content;
  @override
  final PleromaApiStatus? reblog;
  @override
  final PleromaApiApplication? application;
  @override
  final PleromaApiAccount account;
  @override
  @JsonKey(name: "media_attachments")
  final List<PleromaApiMediaAttachment>? mediaAttachments;
  @override
  final List<PleromaApiMention>? mentions;
  @override
  final List<PleromaApiTag>? tags;
  @override
  final List<PleromaApiEmoji>? emojis;
  @override
  final PleromaApiPoll? poll;
  @override
  final PleromaApiCard? card;
  @override
  final PleromaApiStatusPleromaPart? pleroma;

  @override
  final String? language;

  @override
  String visibility;

  @override
  MastodonApiVisibility get visibilityAsMastodonApi =>
      visibility.toMastodonApiVisibility();

  @override
  PleromaApiVisibility get visibilityPleroma =>
      visibility.toPleromaApiVisibility();

  PleromaApiStatus({
    required this.id,
    required this.createdAt,
    required this.inReplyToId,
    required this.inReplyToAccountId,
    required this.sensitive,
    required this.spoilerText,
    required this.uri,
    required this.url,
    required this.repliesCount,
    required this.reblogsCount,
    required this.favouritesCount,
    required this.favourited,
    required this.reblogged,
    required this.muted,
    required this.bookmarked,
    required this.pinned,
    required this.content,
    required this.reblog,
    required this.application,
    required this.account,
    required this.mediaAttachments,
    required this.mentions,
    required this.tags,
    required this.emojis,
    required this.poll,
    required this.card,
    required this.pleroma,
    required this.visibility,
    required this.language,
  });

  factory PleromaApiStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiStatusFromJson(json);

  factory PleromaApiStatus.fromJsonString(String jsonString) =>
      _$PleromaApiStatusFromJson(jsonDecode(jsonString));

  static List<PleromaApiStatus> listFromJsonString(String str) =>
      List<PleromaApiStatus>.from(
        json.decode(str).map((x) => PleromaApiStatus.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaApiStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiStatusToJson(this));

  @override
  // ignore: code-metrics
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiStatus &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          inReplyToId == other.inReplyToId &&
          inReplyToAccountId == other.inReplyToAccountId &&
          sensitive == other.sensitive &&
          spoilerText == other.spoilerText &&
          uri == other.uri &&
          url == other.url &&
          repliesCount == other.repliesCount &&
          reblogsCount == other.reblogsCount &&
          favouritesCount == other.favouritesCount &&
          favourited == other.favourited &&
          reblogged == other.reblogged &&
          muted == other.muted &&
          bookmarked == other.bookmarked &&
          pinned == other.pinned &&
          content == other.content &&
          reblog == other.reblog &&
          application == other.application &&
          account == other.account &&
          eq(mediaAttachments, other.mediaAttachments) &&
          eq(mentions, other.mentions) &&
          eq(tags, other.tags) &&
          eq(emojis, other.emojis) &&
          poll == other.poll &&
          card == other.card &&
          pleroma == other.pleroma &&
          language == other.language &&
          visibility == other.visibility;

  @override
  int get hashCode =>
      id.hashCode ^
      createdAt.hashCode ^
      inReplyToId.hashCode ^
      inReplyToAccountId.hashCode ^
      sensitive.hashCode ^
      spoilerText.hashCode ^
      uri.hashCode ^
      url.hashCode ^
      repliesCount.hashCode ^
      reblogsCount.hashCode ^
      favouritesCount.hashCode ^
      favourited.hashCode ^
      reblogged.hashCode ^
      muted.hashCode ^
      bookmarked.hashCode ^
      pinned.hashCode ^
      content.hashCode ^
      reblog.hashCode ^
      application.hashCode ^
      account.hashCode ^
      mediaAttachments.hashCode ^
      mentions.hashCode ^
      tags.hashCode ^
      emojis.hashCode ^
      poll.hashCode ^
      card.hashCode ^
      pleroma.hashCode ^
      language.hashCode ^
      visibility.hashCode;

  @override
  String toString() {
    return 'PleromaApiStatus{'
        'id: $id, '
        'createdAt: $createdAt, '
        'inReplyToId: $inReplyToId, '
        'inReplyToAccountId: $inReplyToAccountId,'
        'sensitive: $sensitive, '
        'spoilerText: $spoilerText, '
        'uri: $uri, '
        'url: $url, '
        'repliesCount: $repliesCount, '
        'reblogsCount: $reblogsCount,'
        'favouritesCount: $favouritesCount, '
        'favourited: $favourited, '
        'reblogged: $reblogged, '
        'muted: $muted, '
        'bookmarked: $bookmarked, '
        'pinned: $pinned, '
        'content: $content, '
        'reblog: $reblog, '
        'application: $application, '
        'account: $account, '
        'mediaAttachments: $mediaAttachments, '
        'mentions: $mentions, '
        'tags: $tags, '
        'emojis: $emojis, '
        'poll: $poll, '
        'card: $card, '
        'pleroma: $pleroma, '
        'language: $language, '
        'visibility: $visibility'
        '}';
  }
}

@JsonSerializable(explicitToJson: true)
class PleromaApiStatusPleromaPart {
  // a map consisting of alternate representations of the content property with
  // the key being it's mimetype.
  // Currently the only alternate representation supported is text/plain
  final PleromaApiContent? content;

  // the ID of the AP context the status is associated with (if any)
  @JsonKey(name: "conversation_id")
  final int? conversationId;

  // the ID of the Mastodon direct message conversation the status
  // is associated with (if any)
  @JsonKey(name: "direct_conversation_id")
  final int? directConversationId;

  // the acct property of User entity for replied user (if any)
  @JsonKey(name: "in_reply_to_account_acct")
  final String? inReplyToAccountAcct;
  final bool? local;
  @JsonKey(name: "spoiler_text")
  // a map consisting of alternate representations of the spoiler_text property
  // with the key being it's mimetype. Currently the only alternate
  // representation supported is text/plain
  final PleromaApiContent? spoilerText;

  // a datetime (iso8601) that states when
  // the post will expire (be deleted automatically),
  // or empty if the post won't expire
  @JsonKey(name: "expires_at")
  //  will be resolved
//  DateTime expiresAt;
  final DateTime? expiresAt;
  @JsonKey(name: "thread_muted")
  final bool? threadMuted;

  // A list with emoji / reaction maps. The format is
  // {name: "☕", count: 1, me: true}.
  // Contains no information about the reacting users,
  // for that use the /statuses/:id/reactions endpoint.
  @JsonKey(name: "emoji_reactions")
  final List<PleromaApiStatusEmojiReaction>? emojiReactions;

  PleromaApiStatusPleromaPart({
    required this.content,
    required this.conversationId,
    required this.directConversationId,
    required this.inReplyToAccountAcct,
    required this.local,
    required this.spoilerText,
    required this.expiresAt,
    required this.threadMuted,
    required this.emojiReactions,
  });

  factory PleromaApiStatusPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiStatusPleromaPartFromJson(json);

  factory PleromaApiStatusPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaApiStatusPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaApiStatusPleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaApiStatusPleromaPartToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiStatusPleromaPart &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          conversationId == other.conversationId &&
          directConversationId == other.directConversationId &&
          inReplyToAccountAcct == other.inReplyToAccountAcct &&
          local == other.local &&
          spoilerText == other.spoilerText &&
          expiresAt == other.expiresAt &&
          threadMuted == other.threadMuted &&
          eq(emojiReactions, other.emojiReactions);

  @override
  int get hashCode =>
      content.hashCode ^
      conversationId.hashCode ^
      directConversationId.hashCode ^
      inReplyToAccountAcct.hashCode ^
      local.hashCode ^
      spoilerText.hashCode ^
      expiresAt.hashCode ^
      threadMuted.hashCode ^
      emojiReactions.hashCode;

  @override
  String toString() {
    return 'PleromaApiStatusPleromaPart{'
        'content: $content, '
        'conversationId: $conversationId, '
        'directConversationId: $directConversationId, '
        'inReplyToAccountAcct: $inReplyToAccountAcct, '
        'local: $local, '
        'spoilerText: $spoilerText, '
        'expiresAt: $expiresAt, '
        'threadMuted: $threadMuted, '
        'emojiReactions: $emojiReactions'
        '}';
  }
}

abstract class IPleromaApiPostStatusBase
    implements IMastodonApiPostStatusBaseRequest {
  PleromaApiVisibility get visibilityAsPleromaApi;

  /// Will reply to a given conversation,
  /// addressing only the people who are part of the recipient
  /// set of that conversation. Sets the visibility to direct.
  String? get inReplyToConversationId;

  @override
  IPleromaApiPostStatusPoll? get poll;

  /// A list of nicknames (like lain@soykaf.club or lain on the local server)
  /// that will be used to determine who is going to be addressed by this post.
  /// Using this will disable the implicit addressing by mentioned names in the status body, only the people in the to list will be addressed. The normal rules for for post visibility are not affected by this and will still apply.
  List<String?>? get to;

  /// if set to true the post won't be actually posted, but the status
  /// entity would still be rendered back.
  /// This could be useful for previewing rich text/custom emoji, for example.
  bool? get preview;

  /// string, contain the MIME type of the status,
  /// it is transformed into HTML by the backend.
  /// You can get the list of the supported MIME types
  /// with the nodeinfo endpoint.
  String? get contentType;

  /// The number of seconds the posted activity should expire in. When a
  /// posted activity expires it will be deleted from the server,
  /// and a delete request for it will be federated.
  /// This needs to be longer than an hour.
  int? get expiresInSeconds;

  Map<String, dynamic> toJson();
}

abstract class IPleromaApiPostStatusPoll
    implements IMastodonApiPostStatusRequestPoll {}

@JsonSerializable()
class PleromaApiPostStatusPoll implements IPleromaApiPostStatusPoll {
  @JsonKey(name: "expires_in")
  @override
  final int expiresInSeconds;

  @JsonKey(name: "hide_totals", includeIfNull: false)
  @override
  final bool hideTotals;

  @override
  final bool multiple;

  @JsonKey(name: "options")
  @override
  final List<String> options;

  PleromaApiPostStatusPoll({
    required this.expiresInSeconds,
    required this.hideTotals,
    required this.multiple,
    required this.options,
  });

  factory PleromaApiPostStatusPoll.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPostStatusPollFromJson(json);

  factory PleromaApiPostStatusPoll.fromJsonString(String jsonString) =>
      _$PleromaApiPostStatusPollFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaApiPostStatusPollToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiPostStatusPollToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPostStatusPoll &&
          runtimeType == other.runtimeType &&
          expiresInSeconds == other.expiresInSeconds &&
          hideTotals == other.hideTotals &&
          multiple == other.multiple &&
          options == other.options;

  @override
  int get hashCode =>
      expiresInSeconds.hashCode ^
      hideTotals.hashCode ^
      multiple.hashCode ^
      options.hashCode;

  @override
  String toString() {
    return 'PleromaApiPostStatusPoll{'
        'expiresInSeconds: $expiresInSeconds, '
        'hideTotals: $hideTotals, '
        'multiple: $multiple, '
        'options: $options'
        '}';
  }
}

abstract class IPleromaApiPostStatus
    implements IPleromaApiPostStatusBase, IMastodonApiPostStatusRequest {}

abstract class IPleromaApiScheduleStatus
    implements IPleromaApiPostStatusBase, IMastodonApiScheduleStatusRequest {}

@JsonSerializable()
class PleromaApiPostStatus implements IPleromaApiPostStatus {
  @JsonKey(name: "content_type")
  @override
  final String? contentType;
  @override
  @JsonKey(name: "expires_in")
  final int? expiresInSeconds;
  @override
  @JsonKey(ignore: true)
  final String? idempotencyKey;
  @override
  @JsonKey(name: "in_reply_to_conversation_id", includeIfNull: false)
  final String? inReplyToConversationId;
  @override
  @JsonKey(name: "in_reply_to_id", includeIfNull: false)
  final String? inReplyToId;
  @override
  final String? language;

  @override
  final String visibility;

  @JsonKey(ignore: true)
  @override
  MastodonApiVisibility get visibilityAsMastodonApi =>
      visibility.toMastodonApiVisibility();

  @JsonKey(ignore: true)
  @override
  PleromaApiVisibility get visibilityAsPleromaApi =>
      visibility.toPleromaApiVisibility();

  @JsonKey(name: "media_ids")
  @override
  final List<String>? mediaIds;

  @override
  final PleromaApiPostStatusPoll? poll;
  @override
  final bool? preview;

  @override
  final bool sensitive;
  @override
  @JsonKey(name: "spoiler_text")
  final String? spoilerText;
  @override
  final String? status;
  @override
  final List<String?>? to;

  PleromaApiPostStatus({
    required this.contentType,
    required this.expiresInSeconds,
    this.idempotencyKey,
    required this.inReplyToConversationId,
    required this.inReplyToId,
    required this.language,
    required this.visibility,
    required this.mediaIds,
    required this.poll,
    required this.preview,
    required this.sensitive,
    required this.spoilerText,
    required this.status,
    required this.to,
  }) {
    var isPollExist = poll != null;
    var isMediaExist = mediaIds?.isNotEmpty == true;
    var isTextExist = status?.isNotEmpty == true;

    // poll & media can't be set in one time
//    assert(!(isPollExist && isMediaExist));
    // media, poll or status should exist
    assert(isPollExist || isMediaExist || isTextExist);

//    assert(idempotencyKey != null);
  }

  factory PleromaApiPostStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPostStatusFromJson(json);

  factory PleromaApiPostStatus.fromJsonString(String jsonString) =>
      _$PleromaApiPostStatusFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaApiPostStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiPostStatusToJson(this));

  @override
  String toString() {
    return 'PleromaApiPostStatus{'
        'contentType: $contentType, '
        'expiresInSeconds: $expiresInSeconds, '
        'idempotencyKey: $idempotencyKey, '
        'inReplyToConversationId: $inReplyToConversationId, '
        'inReplyToId: $inReplyToId, '
        'language: $language, '
        'visibility: $visibility, '
        'mediaIds: $mediaIds, '
        'poll: $poll, '
        'preview: $preview, '
        'sensitive: $sensitive, '
        'spoilerText: $spoilerText, '
        'status: $status, '
        'to: $to'
        '}';
  }
}

@JsonSerializable()
class PleromaApiScheduleStatus implements IPleromaApiScheduleStatus {
  @JsonKey(name: "content_type")
  @override
  final String? contentType;
  @override
  @JsonKey(name: "expires_in")
  final int? expiresInSeconds;
  @override
  @JsonKey(ignore: true)
  final String? idempotencyKey;
  @override
  @JsonKey(name: "in_reply_to_conversation_id")
  final String? inReplyToConversationId;
  @override
  @JsonKey(name: "in_reply_to_id")
  final String? inReplyToId;
  @override
  final String? language;

  @override
  final String visibility;

  @JsonKey(ignore: true)
  @override
  MastodonApiVisibility get visibilityAsMastodonApi =>
      visibility.toMastodonApiVisibility();

  @JsonKey(ignore: true)
  @override
  PleromaApiVisibility get visibilityAsPleromaApi =>
      visibility.toPleromaApiVisibility();

  @JsonKey(name: "media_ids")
  @override
  final List<String>? mediaIds;

  @override
  final PleromaApiPostStatusPoll? poll;
  @override
  final bool? preview;

  @override
  final bool sensitive;
  @override
  @JsonKey(name: "spoiler_text")
  final String? spoilerText;
  @override
  final String? status;
  @override
  final List<String?>? to;

  @JsonKey(name: "scheduled_at", toJson: toUTCIsoString)
  @override
  DateTime scheduledAt;

  PleromaApiScheduleStatus({
    required this.contentType,
    required this.expiresInSeconds,
    this.idempotencyKey,
    required this.inReplyToConversationId,
    required this.inReplyToId,
    required this.language,
    required this.visibility,
    required this.mediaIds,
    required this.poll,
    required this.preview,
    required this.sensitive,
    required this.spoilerText,
    required this.status,
    required this.to,
    required this.scheduledAt,
  }) {
    var isPollExist = poll != null;
    var isMediaExist = mediaIds?.isNotEmpty == true;
    var isTextExist = status?.isNotEmpty == true;

    // poll & media can't be set in one time
    // todo: recheck. Docs says that poll & media not possible in one status,
    //  but actually it works
//    assert(!(isPollExist && isMediaExist));
    // media, poll or status should exist
    assert(isPollExist || isMediaExist || isTextExist);

    // todo: revert assert. Skipped due to drafts/scheduled limitation
//    assert(idempotencyKey != null);
  }

  factory PleromaApiScheduleStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiScheduleStatusFromJson(json);

  factory PleromaApiScheduleStatus.fromJsonString(String jsonString) =>
      _$PleromaApiScheduleStatusFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaApiScheduleStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiScheduleStatusToJson(this));

  static String toUTCIsoString(DateTime scheduledAt) =>
      scheduledAt.toUtc().toIso8601String();

  @override
  String toString() {
    return 'PleromaApiScheduleStatus{'
        'contentType: $contentType, '
        'expiresInSeconds: $expiresInSeconds, '
        'idempotencyKey: $idempotencyKey, '
        'inReplyToConversationId: $inReplyToConversationId, '
        'inReplyToId: $inReplyToId, '
        'language: $language, '
        'visibility: $visibility, '
        'mediaIds: $mediaIds, '
        'poll: $poll, '
        'preview: $preview, '
        'sensitive: $sensitive, '
        'spoilerText: $spoilerText, '
        'status: $status, '
        'to: $to, '
        'scheduledAt: $scheduledAt'
        '}';
  }
}

abstract class IPleromaApiStatusEmojiReaction {
  String get name;

  int get count;

  bool get me;

  List<IPleromaApiAccount>? get accounts;
}

extension IPleromaApiStatusEmojiReactionListExtension
    on List<IPleromaApiStatusEmojiReaction> {
  int sumPleromaApiEmojiReactions() => fold(
        0,
        (int previousValue, IPleromaApiStatusEmojiReaction element) =>
            previousValue + element.count,
      );

  List<IPleromaApiStatusEmojiReaction> mergePleromaApiEmojiReactionsLists(
    List<IPleromaApiStatusEmojiReaction>? emojiReactionsListToMerge,
  ) {
    if (emojiReactionsListToMerge?.isNotEmpty != true) {
      return this;
    }
    var mergedList = <IPleromaApiStatusEmojiReaction>[];

    mergedList.addAll(this);

    emojiReactionsListToMerge?.forEach((emojiReaction) {
      var alreadyExistEmojiReaction = mergedList.firstWhereOrNull(
        (currentEmojiReaction) =>
            currentEmojiReaction.name == emojiReaction.name,
      );

      if (alreadyExistEmojiReaction != null) {
        mergedList.remove(alreadyExistEmojiReaction);
        var mergedEmojiReaction = PleromaApiStatusEmojiReaction(
          name: alreadyExistEmojiReaction.name,
          me: alreadyExistEmojiReaction.me || emojiReaction.me,
          count: alreadyExistEmojiReaction.count + emojiReaction.count,
          accounts: [
            ...alreadyExistEmojiReaction.accounts?.toPleromaApiAccounts() ?? [],
            ...emojiReaction.accounts?.toPleromaApiAccounts() ?? [],
          ],
        );
        mergedList.add(mergedEmojiReaction);
      } else {
        mergedList.add(emojiReaction);
      }
    });

    return mergedList;
  }

  List<PleromaApiStatusEmojiReaction> toPleromaApiStatusEmojiReactions() {
    if (this is List<PleromaApiStatusEmojiReaction>) {
      return this as List<PleromaApiStatusEmojiReaction>;
    } else {
      return map(
        (reaction) => reaction.toPleromaApiStatusEmojiReaction(),
      ).toList();
    }
  }
}

extension IPleromaApiStatusEmojiReactionExtension
    on IPleromaApiStatusEmojiReaction {
  PleromaApiStatusEmojiReaction toPleromaApiStatusEmojiReaction() {
    if (this is PleromaApiStatusEmojiReaction) {
      return this as PleromaApiStatusEmojiReaction;
    } else {
      return PleromaApiStatusEmojiReaction(
        name: name,
        count: count,
        me: me,
        accounts: accounts?.toPleromaApiAccounts(),
      );
    }
  }
}

@JsonSerializable()
class PleromaApiStatusEmojiReaction implements IPleromaApiStatusEmojiReaction {
  @override
  final String name;
  @override
  final int count;
  @override
  final bool me;

  @override
  final List<PleromaApiAccount>? accounts;

  PleromaApiStatusEmojiReaction({
    required this.name,
    required this.count,
    required this.me,
    required this.accounts,
  });

  PleromaApiStatusEmojiReaction.only({
    required this.name,
    required this.count,
    required this.me,
    this.accounts,
  });

  PleromaApiStatusEmojiReaction copyWith({
    String? name,
    int? count,
    bool? me,
    List<PleromaApiAccount>? accounts,
  }) =>
      PleromaApiStatusEmojiReaction(
        name: name ?? this.name,
        count: count ?? this.count,
        me: me ?? this.me,
        accounts: accounts ?? this.accounts,
      );

  factory PleromaApiStatusEmojiReaction.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiStatusEmojiReactionFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiStatusEmojiReactionToJson(this);

  static List<PleromaApiStatusEmojiReaction> listFromJsonString(String str) =>
      List<PleromaApiStatusEmojiReaction>.from(
        json.decode(str).map((x) => PleromaApiStatusEmojiReaction.fromJson(x)),
      );

  factory PleromaApiStatusEmojiReaction.fromJsonString(String jsonString) =>
      _$PleromaApiStatusEmojiReactionFromJson(jsonDecode(jsonString));

  String toJsonString() =>
      jsonEncode(_$PleromaApiStatusEmojiReactionToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiStatusEmojiReaction &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          count == other.count &&
          me == other.me &&
          eq(accounts, other.accounts);

  @override
  int get hashCode =>
      name.hashCode ^ count.hashCode ^ me.hashCode ^ accounts.hashCode;

  @override
  String toString() {
    return 'PleromaApiStatusEmojiReaction{'
        'name: $name, '
        'count: $count, '
        'me: $me, '
        'accounts: $accounts'
        '}';
  }
}
