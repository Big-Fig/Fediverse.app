import '../../mastodon_api_model.dart';

abstract class IMastodonApiAccountRelationship implements IMastodonApiResponse {
  bool? get blocking;

  bool? get blockedBy;

  bool? get domainBlocking;

  bool? get endorsed;

  bool? get followedBy;

  bool? get following;

  bool? get notifying;

  String? get id;

  bool? get muting;

  bool? get mutingNotifications;

  bool? get requested;

  bool? get showingReblogs;

  String? get note;
}
