import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/mastodon/application/mastodon_application_model.dart';
import 'package:fedi/mastodon/emoji/mastodon_emoji_model.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/mastodon/mention/mastodon_mention_model.dart';
import 'package:fedi/mastodon/poll/mastodon_poll_model.dart';
import 'package:fedi/mastodon/tag/mastodon_tag_model.dart';
import 'package:fedi/mastodon/visibility/mastodon_visibility_model.dart';

abstract class IMastodonStatus {
  String get id;

  DateTime get createdAt;

  String get inReplyToId;

  String get inReplyToAccountId;

  bool get sensitive;

  String get spoilerText;

  String get visibilityRaw;

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

  MastodonVisibility get visibilityMastodon =>
      const MastodonVisibilityTypeConverter().fromJson(visibilityRaw);
}
