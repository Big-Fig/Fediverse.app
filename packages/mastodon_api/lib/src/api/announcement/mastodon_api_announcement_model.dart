import '../mastodon_api_model.dart';
import '../mention/mastodon_api_mention_model.dart';
import '../status/mastodon_api_status_model.dart';
import '../tag/mastodon_api_tag_model.dart';
import 'emoji_reaction/mastodon_api_announcement_emoji_reaction_model.dart';

abstract class IMastodonApiAnnouncement implements IMastodonApiResponse {
  String get id;

  String get content;

  bool get allDay;

  DateTime get publishedAt;

  DateTime get updatedAt;

  bool? get read;

  List<IMastodonApiAnnouncementEmojiReaction>? get reactions;

  List<IMastodonApiMention>? get mentions;

  List<IMastodonApiStatus>? get statuses;

  List<IMastodonApiTag>? get tags;

  DateTime? get scheduledAt;

  DateTime? get startsAt;

  DateTime? get endsAt;
}
