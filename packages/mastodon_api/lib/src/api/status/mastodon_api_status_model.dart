import '../account/mastodon_api_account_model.dart';
import '../application/mastodon_api_application_model.dart';
import '../card/mastodon_api_card_model.dart';
import '../emoji/mastodon_api_emoji_model.dart';
import '../mastodon_api_model.dart';
import '../media/attachment/mastodon_api_media_attachment_model.dart';
import '../mention/mastodon_api_mention_model.dart';
import '../poll/mastodon_api_poll_model.dart';
import '../tag/mastodon_api_tag_model.dart';
import '../visibility/mastodon_api_visibility_sealed.dart';

abstract class IMastodonApiStatus implements IMastodonApiResponse {
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
}

extension IMastodonApiStatusExtension on IMastodonApiStatus {
  MastodonApiVisibility get visibilityAsMastodonApi =>
      visibility.toMastodonApiVisibility();
}
