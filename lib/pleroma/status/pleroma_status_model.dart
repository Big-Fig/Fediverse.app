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
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_status_model.g.dart';

Function eq = const ListEquality().equals;

abstract class IPleromaStatus implements IMastodonStatus {
  @override
  IPleromaApplication? get application;

  @override
  IPleromaAccount get account;

  @override
  List<IPleromaMediaAttachment>? get mediaAttachments;

  @override
  List<IPleromaMention>? get mentions;

  @override
  List<IPleromaTag>? get tags;

  @override
  List<IPleromaEmoji>? get emojis;

  @override
  IPleromaPoll? get poll;

  @override
  IPleromaCard? get card;

  @override
  IPleromaStatus? get reblog;

  PleromaStatusPleromaPart? get pleroma;

  PleromaVisibility get visibilityPleroma;
}

extension IPleromaStatusListExtension on List<IPleromaStatus> {
  List<PleromaStatus> toPleromaStatuses() {
    if (this is List<PleromaStatus>) {
      return this as List<PleromaStatus>;
    } else {
      return map(
        (pleromaStatus) => pleromaStatus.toPleromaStatus(),
      ).toList();
    }
  }
}

extension IPleromaStatusExtension on IPleromaStatus {
  PleromaStatus toPleromaStatus() {
    if (this is PleromaStatus) {
      return this as PleromaStatus;
    } else {
      return PleromaStatus(
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
        reblog: reblog?.toPleromaStatus(),
        application: application?.toPleromaApplication(),
        account: account.toPleromaAccount(),
        mediaAttachments: mediaAttachments?.toPleromaMediaAttachments(),
        mentions: mentions?.toPleromaMentions(),
        tags: tags?.toPleromaTags(),
        emojis: emojis?.toPleromaEmojis(),
        poll: poll?.toPleromaPoll(),
        card: card?.toPleromaCard(),
        pleroma: pleroma,
        visibility: visibility,
        language: language,
        content: content,
      );
    }
  }
}

abstract class IPleromaScheduledStatus extends IMastodonScheduledStatus {
  @override
  IPleromaScheduledStatusParams get params;

  @override
  List<IPleromaMediaAttachment>? get mediaAttachments;
}

abstract class IPleromaScheduledStatusParams
    extends IMastodonScheduledStatusParams {
  List<String>? get to;

  String? get inReplyToConversationId;

  int? get expiresInSeconds;

  PleromaVisibility get visibilityPleroma => visibility.toPleromaVisibility();
}

@JsonSerializable()
class PleromaScheduledStatus extends IPleromaScheduledStatus {
  @override
  final String id;

  @override
  @JsonKey(name: "media_attachments")
  final List<PleromaMediaAttachment>? mediaAttachments;

  @override
  final PleromaScheduledStatusParams params;

  @JsonKey(name: "scheduled_at")
  @override
  final DateTime scheduledAt;

  PleromaScheduledStatus({
    required this.id,
    required this.mediaAttachments,
    required this.params,
    required this.scheduledAt,
  });

  factory PleromaScheduledStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaScheduledStatusFromJson(json);

  factory PleromaScheduledStatus.fromJsonString(String jsonString) =>
      _$PleromaScheduledStatusFromJson(jsonDecode(jsonString));

  static List<PleromaScheduledStatus> listFromJsonString(String str) =>
      List<PleromaScheduledStatus>.from(
        json.decode(str).map((x) => PleromaScheduledStatus.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaScheduledStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaScheduledStatusToJson(this));
}

@JsonSerializable(explicitToJson: true)
class PleromaScheduledStatusParams extends IPleromaScheduledStatusParams {
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
  final PleromaPostStatusPoll? poll;

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
  IPleromaStatus? get inReplyToPleromaStatus => throw UnsupportedError(
        "inReplyToPleromaStatus not possible in PleromaScheduledStatusParams",
      );

  @override
  @JsonKey(name: "to")
  final List<String>? to;

  PleromaScheduledStatusParams({
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

  PleromaScheduledStatusParams.only({
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaScheduledStatusParams &&
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
    return 'PleromaScheduledStatusParams{expiresInSeconds: $expiresInSeconds, text: $text, mediaIds: $mediaIds, sensitive: $sensitive, spoilerText: $spoilerText, visibility: $visibility, language: $language, scheduledAt: $scheduledAt, poll: $poll, idempotency: $idempotency, inReplyToId: $inReplyToId, applicationId: $applicationId, inReplyToConversationId: $inReplyToConversationId, to: $to}';
  }
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
  final String? content;
  @override
  final PleromaStatus? reblog;
  @override
  final PleromaApplication? application;
  @override
  final PleromaAccount account;
  @override
  @JsonKey(name: "media_attachments")
  final List<PleromaMediaAttachment>? mediaAttachments;
  @override
  final List<PleromaMention>? mentions;
  @override
  final List<PleromaTag>? tags;
  @override
  final List<PleromaEmoji>? emojis;
  @override
  final PleromaPoll? poll;
  @override
  final PleromaCard? card;
  @override
  final PleromaStatusPleromaPart? pleroma;

  @override
  final String? language;

  @override
  String visibility;

  @override
  MastodonVisibility get visibilityMastodon =>
      visibility.toMastodonVisibility();

  @override
  PleromaVisibility get visibilityPleroma => visibility.toPleromaVisibility();

  PleromaStatus({
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

  factory PleromaStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaStatusFromJson(json);

  factory PleromaStatus.fromJsonString(String jsonString) =>
      _$PleromaStatusFromJson(jsonDecode(jsonString));

  static List<PleromaStatus> listFromJsonString(String str) =>
      List<PleromaStatus>.from(
        json.decode(str).map((x) => PleromaStatus.fromJson(x)),
      );

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
  final PleromaContent? content;

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
  final PleromaContent? spoilerText;

  // a datetime (iso8601) that states when
  // the post will expire (be deleted automatically),
  // or empty if the post won't expire
  @JsonKey(name: "expires_at")
  //  will be resolved
//  DateTime expiresAt;
  final dynamic expiresAt;
  @JsonKey(name: "thread_muted")
  final bool? threadMuted;

  // A list with emoji / reaction maps. The format is
  // {name: "☕", count: 1, me: true}.
  // Contains no information about the reacting users,
  // for that use the /statuses/:id/reactions endpoint.
  @JsonKey(name: "emoji_reactions")
  final List<PleromaStatusEmojiReaction>? emojiReactions;

  PleromaStatusPleromaPart({
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
  String? get inReplyToConversationId;

  @override
  IPleromaPostStatusPoll? get poll;

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

abstract class IPleromaPostStatusPoll
    implements IMastodonPostStatusRequestPoll {}

@JsonSerializable()
class PleromaPostStatusPoll implements IPleromaPostStatusPoll {
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

  PleromaPostStatusPoll({
    required this.expiresInSeconds,
    required this.hideTotals,
    required this.multiple,
    required this.options,
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
  MastodonVisibility get mastodonVisibility =>
      visibility.toMastodonVisibility();

  @JsonKey(ignore: true)
  @override
  PleromaVisibility get pleromaVisibility => visibility.toPleromaVisibility();

  @JsonKey(name: "media_ids")
  @override
  final List<String>? mediaIds;

  @override
  final PleromaPostStatusPoll? poll;
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

  PleromaPostStatus({
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
  MastodonVisibility get mastodonVisibility =>
      visibility.toMastodonVisibility();

  @JsonKey(ignore: true)
  @override
  PleromaVisibility get pleromaVisibility => visibility.toPleromaVisibility();

  @JsonKey(name: "media_ids")
  @override
  final List<String>? mediaIds;

  @override
  final PleromaPostStatusPoll? poll;
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

  PleromaScheduleStatus({
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

  factory PleromaScheduleStatus.fromJson(Map<String, dynamic> json) =>
      _$PleromaScheduleStatusFromJson(json);

  factory PleromaScheduleStatus.fromJsonString(String jsonString) =>
      _$PleromaScheduleStatusFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaScheduleStatusToJson(this);

  String toJsonString() => jsonEncode(_$PleromaScheduleStatusToJson(this));

  static String toUTCIsoString(DateTime scheduledAt) =>
      scheduledAt.toUtc().toIso8601String();
}

abstract class IPleromaStatusEmojiReaction {
  String get name;

  int get count;

  bool get me;

  List<IPleromaAccount>? get accounts;
}

extension IPleromaStatusEmojiReactionListExtension
    on List<IPleromaStatusEmojiReaction> {
  int sumPleromaEmojiReactions() => fold(
        0,
        (int previousValue, IPleromaStatusEmojiReaction element) =>
            previousValue + element.count,
      );

  List<IPleromaStatusEmojiReaction> mergeEmojiReactionsLists(
    List<IPleromaStatusEmojiReaction>? emojiReactionsListToMerge,
  ) {
    if (emojiReactionsListToMerge?.isNotEmpty != true) {
      return this;
    }
    var mergedList = <IPleromaStatusEmojiReaction>[];

    mergedList.addAll(this);

    emojiReactionsListToMerge?.forEach((emojiReaction) {
      var alreadyExistEmojiReaction = mergedList.firstWhereOrNull(
        (currentEmojiReaction) =>
            currentEmojiReaction.name == emojiReaction.name,
      );

      if (alreadyExistEmojiReaction != null) {
        mergedList.remove(alreadyExistEmojiReaction);
        var mergedEmojiReaction = PleromaStatusEmojiReaction(
          name: alreadyExistEmojiReaction.name,
          me: alreadyExistEmojiReaction.me || emojiReaction.me,
          count: alreadyExistEmojiReaction.count + emojiReaction.count,
          accounts: [
            ...alreadyExistEmojiReaction.accounts?.toPleromaAccounts() ?? [],
            ...emojiReaction.accounts?.toPleromaAccounts() ?? [],
          ],
        );
        mergedList.add(mergedEmojiReaction);
      } else {
        mergedList.add(emojiReaction);
      }
    });

    return mergedList;
  }

  List<PleromaStatusEmojiReaction> toPleromaStatusEmojiReactions() {
    if (this is List<PleromaStatusEmojiReaction>) {
      return this as List<PleromaStatusEmojiReaction>;
    } else {
      return map(
        (reaction) => reaction.toPleromaStatusEmojiReaction(),
      ).toList();
    }
  }
}

extension IPleromaStatusEmojiReactionExtension on IPleromaStatusEmojiReaction {
  PleromaStatusEmojiReaction toPleromaStatusEmojiReaction() {
    if (this is PleromaStatusEmojiReaction) {
      return this as PleromaStatusEmojiReaction;
    } else {
      return PleromaStatusEmojiReaction(
        name: name,
        count: count,
        me: me,
        accounts: accounts?.toPleromaAccounts(),
      );
    }
  }
}

@JsonSerializable()
class PleromaStatusEmojiReaction implements IPleromaStatusEmojiReaction {
  @override
  final String name;
  @override
  final int count;
  @override
  final bool me;

  @override
  List<PleromaAccount>? accounts;

  PleromaStatusEmojiReaction({
    required this.name,
    required this.count,
    required this.me,
    required this.accounts,
  });

  PleromaStatusEmojiReaction.only({
    required this.name,
    required this.count,
    required this.me,
    this.accounts,
  });

  PleromaStatusEmojiReaction copyWith({
    String? name,
    int? count,
    bool? me,
    List<PleromaAccount>? accounts,
  }) =>
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
        json.decode(str).map((x) => PleromaStatusEmojiReaction.fromJson(x)),
      );

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
