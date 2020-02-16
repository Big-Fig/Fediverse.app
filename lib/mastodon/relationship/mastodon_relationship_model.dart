abstract class IMastodonRelationship {
  bool get blocking;

// TODO: should be removed after refactoring
  set blocking(bool value);

  bool get domainBlocking;

  bool get endorsed;

  bool get followedBy;

  bool get following;

// TODO: should be removed after refactoring
  set following(bool value);

  String get id;

  bool get muting;

// TODO: should be removed after refactoring
  set muting(bool value);

  bool get mutingNotifications;

  bool get requested;

  bool get showingReblogs;

  bool get subscribing;
}
