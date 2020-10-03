abstract class IMastodonAnnouncement {
  String get id;

  String get text;

  bool get published;

  bool get allDay;

  DateTime get createdAt;

  DateTime get updatedAt;

  bool get read;

  List<IMastodonAnnouncementReaction> get reactions;

  // nullable
  DateTime get scheduledAt;

  // nullable
  DateTime get startsAt;

  // nullable
  DateTime get endsAt;
}

abstract class IMastodonAnnouncementReaction {
  String get name;

  int get count;

  bool get me;

  String get url;

  String get staticUrl;
}