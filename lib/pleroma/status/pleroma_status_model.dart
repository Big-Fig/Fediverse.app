import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:fedi/mastodon/status/mastodon_status_model.dart';
import 'package:fedi/mastodon/visibility/mastodon_visibility_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/content/pleroma_content_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_status_model.g.dart';

Function eq = const ListEquality().equals;

abstract class IPleromaStatus implements IMastodonStatus {
  set favourited(bool value);

  set favouritesCount(int value);

  set reblogged(bool value);

  set reblogsCount(int value);

  @override
  IPleromaApplication get application;

  @override
  IPleromaAccount get account;

  @override
  List<IPleromaMediaAttachment> get mediaAttachments;

  @override
  List<IPleromaMention> get mentions;

  @override
  List<IPleromaTag> get tags;

  @override
  List<IPleromaEmoji> get emojis;

  @override
  IPleromaPoll get poll;

  @override
  IPleromaCard get card;

  @override
  IPleromaStatus get reblog;

  PleromaStatusPleromaPart get pleroma;

  PleromaVisibility get visibilityPleroma;
}

abstract class IPleromaScheduledStatus extends IMastodonScheduledStatus {
  @override
  IPleromaScheduledStatusParams get params;

  @override
  List<IPleromaMediaAttachment> get mediaAttachments;
}

abstract class IPleromaScheduledStatusParams
    extends IMastodonScheduledStatusParams {
  PleromaVisibility get visibilityPleroma =>
      const PleromaVisibilityTypeConverter().fromJson(visibility);
}

@JsonSerializable()
class PleromaScheduledStatus extends IPleromaScheduledStatus {
  @override
  final String id;

  @override
  @JsonKey(name: "media_attachments")
  final List<PleromaMediaAttachment> mediaAttachments;

  @override
  final PleromaScheduledStatusParams params;

  @JsonKey(name: "scheduled_at")
  @override
  final DateTime scheduledAt;

  PleromaScheduledStatus(
      {this.id, this.mediaAttachments, this.params, this.scheduledAt});

  factory PleromaScheduledStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaScheduledStatusFromJson(json);

  factory PleromaScheduledStatus.fromJsonString(String jsonString) =>
      _$PleromaScheduledStatusFromJson(jsonDecode(jsonString));

  static List<PleromaScheduledStatus> listFromJsonString(String str) =>
      List<PleromaScheduledStatus>.from(
          json.decode(str).map((x) => PleromaScheduledStatus.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaScheduledStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaScheduledStatusToJson(this));
}

@JsonSerializable(explicitToJson: true)
class PleromaScheduledStatusParams extends IPleromaScheduledStatusParams {
  @override
  final String text;

  @override
  @JsonKey(name: "media_ids")
  final List<String> mediaIds;

  @override
  final bool sensitive;

  @override
  @JsonKey(name: "spoiler_text")
  final String spoilerText;

  @override
  final String visibility;

  @override
  @JsonKey(name: "scheduled_at")
  final DateTime scheduledAt;

  @override
  final PleromaPostStatusPoll poll;

  @override
  final String idempotency;

  @override
  @JsonKey(name: "in_reply_to_id")
  final String inReplyToId;

  @override
  @JsonKey(name: "application_id")
  final String applicationId;

  PleromaScheduledStatusParams(
      {this.text,
      this.mediaIds,
      this.sensitive,
      this.spoilerText,
      this.visibility,
      this.scheduledAt,
      this.poll,
      this.idempotency,
      this.inReplyToId,
      this.applicationId});

  factory PleromaScheduledStatusParams.fromJson(Map<String, dynamic> json) =>
      _$PleromaScheduledStatusParamsFromJson(json);

  factory PleromaScheduledStatusParams.fromJsonString(String jsonString) =>
      _$PleromaScheduledStatusParamsFromJson(jsonDecode(jsonString));

  static List<PleromaScheduledStatusParams> listFromJsonString(String str) =>
      List<PleromaScheduledStatusParams>.from(json
          .decode(str)
          .map((x) => PleromaScheduledStatusParams.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaScheduledStatusParamsToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaScheduledStatusParamsToJson(this));

  @override
  String toString() {
    return 'PleromaScheduledStatusParams{text: $text, mediaIds: $mediaIds,'
        ' sensitive: $sensitive, spoilerText: $spoilerText,'
        ' visibility: $visibility, scheduledAt: $scheduledAt, poll: $poll, '
        'idempotency: $idempotency, inReplyToId: $inReplyToId, '
        'applicationId: $applicationId}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaScheduledStatusParams &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          eq(mediaIds, other.mediaIds) &&
          sensitive == other.sensitive &&
          spoilerText == other.spoilerText &&
          visibility == other.visibility &&
          scheduledAt == other.scheduledAt &&
          poll == other.poll &&
          idempotency == other.idempotency &&
          inReplyToId == other.inReplyToId &&
          applicationId == other.applicationId;

  @override
  int get hashCode =>
      text.hashCode ^
      mediaIds.hashCode ^
      sensitive.hashCode ^
      spoilerText.hashCode ^
      visibility.hashCode ^
      scheduledAt.hashCode ^
      poll.hashCode ^
      idempotency.hashCode ^
      inReplyToId.hashCode ^
      applicationId.hashCode;
}

@JsonSerializable()
class PleromaStatus extends IPleromaStatus {
  @override
  final String id;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "in_reply_to_id")
  final String inReplyToId;
  @override
  @JsonKey(name: "in_reply_to_account_id")
  String inReplyToAccountId;
  @override
  final bool sensitive;
  @override
  @JsonKey(name: "spoiler_text")
  final String spoilerText;

  @override
  final String uri;
  @override
  final String url;
  @override
  @JsonKey(name: "replies_count")
  final int repliesCount;
  @override
  @JsonKey(name: "reblogs_count")
  int reblogsCount;
  @override
  @JsonKey(name: "favourites_count")
  int favouritesCount;
  @override
  bool favourited;
  @override
  bool reblogged;
  @override
  final bool muted;
  @override
  final bool bookmarked;
  @override
  final bool pinned;
  @override
  final String content;
  @override
  final PleromaStatus reblog;
  @override
  final PleromaApplication application;
  @override
  final PleromaAccount account;
  @override
  @JsonKey(name: "media_attachments")
  final List<PleromaMediaAttachment> mediaAttachments;
  @override
  final List<PleromaMention> mentions;
  @override
  final List<PleromaTag> tags;
  @override
  final List<PleromaEmoji> emojis;
  @override
  final PleromaPoll poll;
  @override
  final PleromaCard card;
  @override
  final PleromaStatusPleromaPart pleroma;

  @override
  final String language;

  @override
  String visibility;

  @override
  MastodonVisibility get visibilityMastodon =>
      const MastodonVisibilityTypeConverter().fromJson(visibility);

  @override
  PleromaVisibility get visibilityPleroma =>
      const PleromaVisibilityTypeConverter().fromJson(visibility);

  PleromaStatus({
    this.id,
    this.createdAt,
    this.inReplyToId,
    this.inReplyToAccountId,
    this.sensitive,
    this.spoilerText,
    this.uri,
    this.url,
    this.repliesCount,
    this.reblogsCount,
    this.favouritesCount,
    this.favourited,
    this.reblogged,
    this.muted,
    this.bookmarked,
    this.pinned,
    this.content,
    this.reblog,
    this.application,
    this.account,
    this.mediaAttachments,
    this.mentions,
    this.tags,
    this.emojis,
    this.poll,
    this.card,
    this.pleroma,
    this.visibility,
    this.language,
  });

  factory PleromaStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaStatusFromJson(json);

  factory PleromaStatus.fromJsonString(String jsonString) =>
      _$PleromaStatusFromJson(jsonDecode(jsonString));

  static List<PleromaStatus> listFromJsonString(String str) =>
      List<PleromaStatus>.from(
          json.decode(str).map((x) => PleromaStatus.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaStatusToJson(this));

  @override
  String toString() {
    return 'PleromaStatus{id: $id, createdAt: $createdAt,'
        ' inReplyToId: $inReplyToId, inReplyToAccountId: $inReplyToAccountId,'
        ' sensitive: $sensitive, spoilerText: $spoilerText, uri: $uri,'
        ' url: $url, repliesCount: $repliesCount, reblogsCount: $reblogsCount,'
        ' favouritesCount: $favouritesCount, favourited: $favourited, '
        'reblogged: $reblogged, muted: $muted, bookmarked: $bookmarked,'
        ' pinned: $pinned, content: $content, reblog: $reblog,'
        ' application: $application, account: $account, '
        'mediaAttachments: $mediaAttachments, mentions: $mentions, '
        'tags: $tags, emojis: $emojis, poll: $poll, card: $card, '
        'pleroma: $pleroma, language: $language, visibility: $visibility}';
  }
}

@JsonSerializable()
class PleromaStatusPleromaPart {
  // a map consisting of alternate representations of the content property with
  // the key being it's mimetype.
  // Currently the only alternate representation supported is text/plain
  PleromaContent content;

  // the ID of the AP context the status is associated with (if any)
  @JsonKey(name: "conversation_id")
  int conversationId;

  // the ID of the Mastodon direct message conversation the status
  // is associated with (if any)
  @JsonKey(name: "direct_conversation_id")
  int directConversationId;

  // the acct property of User entity for replied user (if any)
  @JsonKey(name: "in_reply_to_account_acct")
  String inReplyToAccountAcct;
  bool local;
  @JsonKey(name: "spoiler_text")
  // a map consisting of alternate representations of the spoiler_text property
  // with the key being it's mimetype. Currently the only alternate
  // representation supported is text/plain
  PleromaContent spoilerText;

  // a datetime (iso8601) that states when
  // the post will expire (be deleted automatically),
  // or empty if the post won't expire
  @JsonKey(name: "expires_at")
  //  will be resolved
//  DateTime expiresAt;
  dynamic expiresAt;
  @JsonKey(name: "thread_muted")
  bool threadMuted;

  // A list with emoji / reaction maps. The format is
  // {name: "☕", count: 1, me: true}.
  // Contains no information about the reacting users,
  // for that use the /statuses/:id/reactions endpoint.
  @JsonKey(name: "emoji_reactions")
  List<PleromaStatusEmojiReaction> emojiReactions;

  PleromaStatusPleromaPart(
      {this.content,
      this.conversationId,
      this.directConversationId,
      this.inReplyToAccountAcct,
      this.local,
      this.spoilerText,
      this.expiresAt,
      this.threadMuted,
      this.emojiReactions});

  factory PleromaStatusPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaStatusPleromaPartFromJson(json);

  factory PleromaStatusPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaStatusPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaStatusPleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaStatusPleromaPartToJson(this));
}

abstract class IPleromaPostStatusBase
    implements IMastodonPostStatusBaseRequest {
  PleromaVisibility get pleromaVisibility;

  /// Will reply to a given conversation,
  /// addressing only the people who are part of the recipient
  /// set of that conversation. Sets the visibility to direct.
  String get inReplyToConversationId;

  @override
  IPleromaPostStatusPoll get poll;

  /// A list of nicknames (like lain@soykaf.club or lain on the local server)
  /// that will be used to determine who is going to be addressed by this post.
  /// Using this will disable the implicit addressing by mentioned names in the status body, only the people in the to list will be addressed. The normal rules for for post visibility are not affected by this and will still apply.
  List<String> get to;

  /// if set to true the post won't be actually posted, but the status
  /// entitiy would still be rendered back.
  /// This could be useful for previewing rich text/custom emoji, for example.
  bool get preview;

  /// string, contain the MIME type of the status,
  /// it is transformed into HTML by the backend.
  /// You can get the list of the supported MIME types
  /// with the nodeinfo endpoint.
  String get contentType;

  /// The number of seconds the posted activity should expire in. When a
  /// posted activity expires it will be deleted from the server,
  /// and a delete request for it will be federated.
  /// This needs to be longer than an hour.
  int get expiresInSeconds;

  Map<String, dynamic> toJson();
}

abstract class IPleromaPostStatusPoll
    implements IMastodonPostStatusRequestPoll {}

@JsonSerializable()
class PleromaPostStatusPoll implements IPleromaPostStatusPoll {
  @JsonKey(name: "expires_in")
  @override
  int expiresInSeconds;

  @JsonKey(name: "hide_totals", includeIfNull: false)
  @override
  bool hideTotals;

  @override
  bool multiple;

  @JsonKey(name: "options")
  @override
  List<String> options;

  PleromaPostStatusPoll({
    @required this.expiresInSeconds,
    this.hideTotals,
    @required this.multiple,
    @required this.options,
  });

  factory PleromaPostStatusPoll.fromJson(Map<String, dynamic> json) =>
      _$PleromaPostStatusPollFromJson(json);

  factory PleromaPostStatusPoll.fromJsonString(String jsonString) =>
      _$PleromaPostStatusPollFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPostStatusPollToJson(this);

  String toJsonString() => jsonEncode(_$PleromaPostStatusPollToJson(this));
}

abstract class IPleromaPostStatus
    implements IPleromaPostStatusBase, IMastodonPostStatusRequest {}

abstract class IPleromaScheduleStatus
    implements IPleromaPostStatusBase, IMastodonScheduleStatusRequest {}

@JsonSerializable()
class PleromaPostStatus implements IPleromaPostStatus {
  @JsonKey(name: "content_type")
  @override
  final String contentType;
  @override
  @JsonKey(name: "expires_in")
  final int expiresInSeconds;
  @override
  @JsonKey(ignore: true)
  final String idempotencyKey;
  @override
  @JsonKey(name: "in_reply_to_conversation_id", includeIfNull: false)
  final String inReplyToConversationId;
  @override
  @JsonKey(name: "in_reply_to_id", includeIfNull: false)
  final String inReplyToId;
  @override
  final String language;

  @override
  final String visibility;

  @JsonKey(ignore: true)
  @override
  MastodonVisibility get mastodonVisibility =>
      mastodonVisibilityValues.valueToEnumMap[visibility];

  @JsonKey(ignore: true)
  @override
  PleromaVisibility get pleromaVisibility => visibility.toPleromaVisibility();

  @JsonKey(name: "media_ids")
  @override
  final List<String> mediaIds;

  @override
  final PleromaPostStatusPoll poll;
  @override
  final bool preview;

  @override
  final bool sensitive;
  @override
  @JsonKey(name: "spoiler_text")
  final String spoilerText;
  @override
  final String status;
  @override
  final List<String> to;

  PleromaPostStatus(
      {this.contentType,
      this.expiresInSeconds,
      this.idempotencyKey,
      this.inReplyToConversationId,
      this.inReplyToId,
      this.language,
      this.visibility,
      this.mediaIds,
      this.poll,
      this.preview,
      this.sensitive,
      this.spoilerText,
      this.status,
      this.to}) {
    var isPollExist = poll != null;
    var isMediaExist = mediaIds?.isNotEmpty == true;
    var isTextExist = status?.isNotEmpty == true;

    // poll & media can't be set in one time
//    assert(!(isPollExist && isMediaExist));
    // media, poll or status should exist
    assert(isPollExist || isMediaExist || isTextExist);

//    assert(idempotencyKey != null);
  }

  factory PleromaPostStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaPostStatusFromJson(json);

  factory PleromaPostStatus.fromJsonString(String jsonString) =>
      _$PleromaPostStatusFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaPostStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaPostStatusToJson(this));
}

@JsonSerializable()
class PleromaScheduleStatus implements IPleromaScheduleStatus {
  @JsonKey(name: "content_type")
  @override
  final String contentType;
  @override
  @JsonKey(name: "expires_in")
  final int expiresInSeconds;
  @override
  @JsonKey(ignore: true)
  final String idempotencyKey;
  @override
  @JsonKey(name: "in_reply_to_conversation_id")
  final String inReplyToConversationId;
  @override
  @JsonKey(name: "in_reply_to_id")
  final String inReplyToId;
  @override
  final String language;

  @override
  final String visibility;

  @JsonKey(ignore: true)
  @override
  MastodonVisibility get mastodonVisibility =>
      mastodonVisibilityValues.valueToEnumMap[visibility];

  @JsonKey(ignore: true)
  @override
  PleromaVisibility get pleromaVisibility => visibility.toPleromaVisibility();

  @JsonKey(name: "media_ids")
  @override
  final List<String> mediaIds;

  @override
  final PleromaPostStatusPoll poll;
  @override
  final bool preview;

  @override
  final bool sensitive;
  @override
  @JsonKey(name: "spoiler_text")
  final String spoilerText;
  @override
  final String status;
  @override
  final List<String> to;

  @JsonKey(name: "scheduled_at", toJson: toUTCIsoString)
  @override
  DateTime scheduledAt;

  PleromaScheduleStatus(
      {this.contentType,
      this.expiresInSeconds,
      this.idempotencyKey,
      this.inReplyToConversationId,
      this.inReplyToId,
      this.language,
      this.visibility,
      this.mediaIds,
      this.poll,
      this.preview,
      this.sensitive,
      this.spoilerText,
      this.status,
      this.to,
      @required this.scheduledAt}) {
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

  factory PleromaScheduleStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaScheduleStatusFromJson(json);

  factory PleromaScheduleStatus.fromJsonString(String jsonString) =>
      _$PleromaScheduleStatusFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaScheduleStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaScheduleStatusToJson(this));

  static String toUTCIsoString(DateTime scheduledAt) =>
      scheduledAt.toUtc()?.toIso8601String();
}

abstract class IPleromaStatusEmojiReaction {
  String get name;

  int get count;

  bool get me;

  List<IPleromaAccount> get accounts;
}

@JsonSerializable()
class PleromaStatusEmojiReaction implements IPleromaStatusEmojiReaction {
  @override
  String name;
  @override
  int count;
  @override
  bool me;

  @override
  List<PleromaAccount> accounts;

  PleromaStatusEmojiReaction({this.name, this.count, this.me, this.accounts});

  PleromaStatusEmojiReaction copyWith(
          {String name, int count, bool me, List<PleromaAccount> accounts}) =>
      PleromaStatusEmojiReaction(
        name: name ?? this.name,
        count: count ?? this.count,
        me: me ?? this.me,
        accounts: accounts ?? this.accounts,
      );

  factory PleromaStatusEmojiReaction.fromJson(Map<String, dynamic> json) =>
      _$PleromaStatusEmojiReactionFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaStatusEmojiReactionToJson(this);

  static List<PleromaStatusEmojiReaction> listFromJsonString(String str) =>
      List<PleromaStatusEmojiReaction>.from(
          json.decode(str).map((x) => PleromaStatusEmojiReaction.fromJson(x)));

  factory PleromaStatusEmojiReaction.fromJsonString(String jsonString) =>
      _$PleromaStatusEmojiReactionFromJson(jsonDecode(jsonString));

  String toJsonString() => jsonEncode(_$PleromaStatusEmojiReactionToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaStatusEmojiReaction &&
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
    return 'PleromaStatusEmojiReaction{name: $name, count: $count,'
        ' me: $me, accounts: $accounts}';
  }
}

List<IPleromaStatusEmojiReaction> mergeEmojiReactionsLists(
    List<IPleromaStatusEmojiReaction> emojiReactionsOriginal,
    List<IPleromaStatusEmojiReaction> emojiReactionsReblog) {
  if (emojiReactionsReblog?.isNotEmpty != true) {
    return emojiReactionsOriginal;
  }
  var mergedList = <IPleromaStatusEmojiReaction>[];

  mergedList.addAll(emojiReactionsOriginal ?? []);

  emojiReactionsReblog?.forEach((emojiReaction) {
    var alreadyExistEmojiReaction = mergedList.firstWhere(
        (currentEmojiReaction) =>
            currentEmojiReaction.name == emojiReaction.name,
        orElse: () => null);

    if (alreadyExistEmojiReaction != null) {
      mergedList.remove(alreadyExistEmojiReaction);
      var mergedEmojiReaction = PleromaStatusEmojiReaction(
          name: alreadyExistEmojiReaction.name,
          me: alreadyExistEmojiReaction.me || emojiReaction.me,
          count: alreadyExistEmojiReaction.count + emojiReaction.count,
          accounts: [
            ...alreadyExistEmojiReaction.accounts,
            ...emojiReaction.accounts,
          ]);
      mergedList.add(mergedEmojiReaction);
    } else {
      mergedList.add(emojiReaction);
    }
  });

  return mergedList;
}
