import 'package:fedi/mastodon/api/emoji/mastodon_api_emoji_model.dart';
import 'package:fedi/mastodon/api/field/mastodon_api_field_model.dart';

abstract class IMastodonApiAccount {
  String get username;

  String get url;

  int get statusesCount;

  String? get note;

  bool? get bot;

  bool get locked;

  String get id;

  String get headerStatic;

  String get header;

  int get followingCount;

  int get followersCount;

  List<IMastodonApiField>? get fields;

  List<IMastodonApiEmoji>? get emojis;

  String? get displayName;

  DateTime get createdAt;

  String get avatarStatic;

  String get avatar;

  String get acct;

  DateTime? get lastStatusAt;
}

abstract class IMastodonAccountRelationship {
  bool? get blocking;

  bool? get blockedBy;

  bool? get domainBlocking;

  bool? get endorsed;

  bool? get followedBy;

  bool? get following;

  String? get id;

  bool? get muting;

  bool? get mutingNotifications;

  bool? get requested;

  bool? get showingReblogs;

  bool? get subscribing;

  String? get note;
}

abstract class IMastodonApiAccountIdentityProof {
  String? get provider;

  String? get providerUsername;

  DateTime? get updatedAt;

  String? get proofUrl;

  String? get profileUrl;
}

abstract class IMastodonApiAccountReportRequest {
  /// ID of the account to report
  String get accountId;

  /// Array of Statuses to attach to the report, for context
  List<String>? get statusIds;

  /// Reason for the report (default max 1000 characters)
  String? get comment;

  /// If the account is remote, should the report be forwarded to the remote admin?
  bool? get forward;
}
