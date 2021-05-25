import 'package:fedi/mastodon/api/mention/mastodon_api_mention_model.dart';
import 'package:fedi/mastodon/api/status/mastodon_api_status_model.dart';
import 'package:fedi/mastodon/api/tag/mastodon_api_tag_model.dart';

abstract class IMastodonApiAnnouncement {
  String get id;

  String get content;

  bool get allDay;

  DateTime get publishedAt;

  DateTime get updatedAt;

  bool? get read;

  List<IMastodonApiAnnouncementReaction>? get reactions;

  List<IMastodonApiMention>? get mentions;

  List<IMastodonApiStatus>? get statuses;

  List<IMastodonApiTag>? get tags;

  DateTime? get scheduledAt;

  DateTime? get startsAt;

  DateTime? get endsAt;
}

abstract class IMastodonApiAnnouncementReaction {
  String get name;

  int get count;

  bool get me;

  String? get url;

  String? get staticUrl;

  IMastodonApiAnnouncementReaction copyWith({
    String? name,
    int? count,
    bool? me,
    String? url,
    String? staticUrl,
  });
}
