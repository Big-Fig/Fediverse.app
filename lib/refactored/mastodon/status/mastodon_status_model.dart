import 'package:fedi/refactored/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/refactored/mastodon/application/mastodon_application_model.dart';
import 'package:fedi/refactored/mastodon/card/mastodon_card_model.dart';
import 'package:fedi/refactored/mastodon/emoji/mastodon_emoji_model.dart';
import 'package:fedi/refactored/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/refactored/mastodon/mention/mastodon_mention_model.dart';
import 'package:fedi/refactored/mastodon/poll/mastodon_poll_model.dart';
import 'package:fedi/refactored/mastodon/tag/mastodon_tag_model.dart';
import 'package:fedi/refactored/mastodon/visibility/mastodon_visibility_model.dart';

abstract class IMastodonStatus {
  String get id;

  DateTime get createdAt;

  String get inReplyToId;

  String get inReplyToAccountId;

  bool get sensitive;

  String get spoilerText;

  String get visibility;

  String get uri;

  String get url;

  int get repliesCount;

  int get reblogsCount;

  int get favouritesCount;

  bool get favourited;

  bool get reblogged;

  bool get muted;

  bool get bookmarked;

  bool get pinned;

  String get content;

  IMastodonStatus get reblog;

  IMastodonApplication get application;

  IMastodonAccount get account;

  List<IMastodonMediaAttachment> get mediaAttachments;

  List<IMastodonMention> get mentions;

  List<IMastodonTag> get tags;

  List<IMastodonEmoji> get emojis;

  IMastodonPoll get poll;

  IMastodonCard get card;

  String get language;

  MastodonVisibility get visibilityMastodon =>
      const MastodonVisibilityTypeConverter().fromJson(visibility);
}

abstract class IMastodonScheduledStatus {
  String get id;

  DateTime get scheduledAt;

  IMastodonScheduledStatusParams get params;

  List<IMastodonMediaAttachment> get mediaAttachments;
}

abstract class IMastodonScheduledStatusParams {
  String get text;

  List<String> get mediaIds;

  bool get sensitive;

  String get spoilerText;

  String get visibility;

  DateTime get scheduledAt;

  // request or result type?
  // IMastodonPostStatusRequestPoll
  // IMastodonPoll
  dynamic get poll;

  String get idempotency;

  String get inReplyToId;

  int get applicationId;

  MastodonVisibility get visibilityMastodon =>
      const MastodonVisibilityTypeConverter().fromJson(visibility);
}

abstract class IMastodonPostStatusBaseRequest {
  /// Prevent duplicate submissions of the same status.
  /// Idempotency keys are stored for up to 1 hour,
  /// and can be any arbitrary string.
  /// Consider using a hash or UUID generated client-side.
  String get idempotencyKey;

  String get status;

  List<String> get mediaIds;

  IMastodonPostStatusRequestPoll get poll;

  bool get sensitive;

  String get spoilerText;

  String get visibility;

  String get language;

  MastodonVisibility get mastodonVisibility;

  String get inReplyToId;
}

abstract class IMastodonPostStatusRequest
    implements IMastodonPostStatusBaseRequest {}

abstract class IMastodonScheduleStatusRequest
    implements IMastodonPostStatusBaseRequest {
  DateTime get scheduledAt;
}

abstract class IMastodonPostStatusRequestPoll {
  /// Array of possible answers. If provided, media_ids cannot be used, and
  /// poll[expires_in] must be provided.
  List<String> get options;

  /// Duration the poll should be open, in seconds. If provided, media_ids
  /// cannot be used, and poll[options] must be provided.
  int get expiresInSeconds;

  ///   Allow multiple choices?
  bool get multiple;

  ///   Hide vote counts until the poll ends?
  bool get hideTotals;
}
