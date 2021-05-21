abstract class IMastodonApiAnnouncement {
  String get id;

  String get text;

  bool get published;

  bool get allDay;

  DateTime get createdAt;

  DateTime get updatedAt;

  bool get read;

  List<IMastodonApiAnnouncementReaction> get reactions;

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
