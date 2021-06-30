import 'package:fedi/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:fedi/mastodon/api/application/mastodon_api_application_model.dart';
import 'package:fedi/mastodon/api/card/mastodon_api_card_model.dart';
import 'package:fedi/mastodon/api/emoji/mastodon_api_emoji_model.dart';
import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:fedi/mastodon/api/mention/mastodon_api_mention_model.dart';
import 'package:fedi/mastodon/api/poll/mastodon_api_poll_model.dart';
import 'package:fedi/mastodon/api/tag/mastodon_api_tag_model.dart';
import 'package:fedi/mastodon/api/visibility/mastodon_api_visibility_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IMastodonApiStatus {
  String get id;

  DateTime get createdAt;

  String? get inReplyToId;

  String? get inReplyToAccountId;

  bool get sensitive;

  String? get spoilerText;

  String get visibility;

  String get uri;

  String? get url;

  int? get repliesCount;

  int? get reblogsCount;

  int? get favouritesCount;

  bool? get favourited;

  bool? get reblogged;

  bool? get muted;

  bool? get bookmarked;

  bool? get pinned;

  String? get content;

  IMastodonApiStatus? get reblog;

  IMastodonApiApplication? get application;

  IMastodonApiAccount get account;

  List<IMastodonApiMediaAttachment>? get mediaAttachments;

  List<IMastodonApiMention>? get mentions;

  List<IMastodonApiTag>? get tags;

  List<IMastodonApiEmoji>? get emojis;

  IMastodonApiPoll? get poll;

  IMastodonApiCard? get card;

  String? get language;

  MastodonApiVisibility get visibilityAsMastodonApi =>
      visibility.toMastodonApiVisibility();
}

abstract class IMastodonApiScheduledStatus {
  String get id;

  DateTime get scheduledAt;

  IMastodonApiScheduledStatusParams get params;

  List<IMastodonApiMediaAttachment>? get mediaAttachments;
}

abstract class IMastodonApiScheduledStatusParams {
  String? get text;

  List<String>? get mediaIds;

  bool get sensitive;

  String? get spoilerText;

  String get visibility;

  DateTime get scheduledAt;

  PleromaApiPostStatusPoll? get poll;

  String? get idempotency;

  String? get inReplyToId;

  IPleromaApiStatus? get inReplyToPleromaApiStatus;

  String? get language;

  dynamic get applicationId;

  MastodonApiVisibility get visibilityAsMastodonApi =>
      visibility.toMastodonApiVisibility();
}

abstract class IMastodonApiPostStatusBaseRequest {
  /// Prevent duplicate submissions of the same status.
  /// Idempotency keys are stored for up to 1 hour,
  /// and can be any arbitrary string.
  /// Consider using a hash or UUID generated client-side.
  String? get idempotencyKey;

  String? get status;

  List<String>? get mediaIds;

  IMastodonApiPostStatusRequestPoll? get poll;

  bool get sensitive;

  String? get spoilerText;

  String get visibility;

  String? get language;

  MastodonApiVisibility get visibilityAsMastodonApi;

  String? get inReplyToId;
}

abstract class IMastodonApiPostStatusRequest
    implements IMastodonApiPostStatusBaseRequest {}

abstract class IMastodonApiScheduleStatusRequest
    implements IMastodonApiPostStatusBaseRequest {
  DateTime get scheduledAt;
}

abstract class IMastodonApiPostStatusRequestPoll {
  /// Array of possible answers. If provided, media_ids cannot be used, and
  /// poll.expires_in must be provided.
  List<String> get options;

  /// Duration the poll should be open, in seconds. If provided, media_ids
  /// cannot be used, and poll[options] must be provided.
  int get expiresInSeconds;

  ///   Allow multiple choices?
  bool get multiple;

  ///   Hide vote counts until the poll ends?
  bool get hideTotals;
}
