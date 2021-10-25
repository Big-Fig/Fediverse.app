import '../emoji/mastodon_api_emoji_model.dart';
import '../field/mastodon_api_field_model.dart';
import '../mastodon_api_model.dart';

abstract class IMastodonApiAccount implements IMastodonApiResponse {
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

  bool? get suspended;

  DateTime? get muteExpiresAt;
}
