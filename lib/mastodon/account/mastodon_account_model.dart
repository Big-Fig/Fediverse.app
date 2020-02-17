import 'package:fedi/mastodon/emoji/mastodon_emoji_model.dart';
import 'package:fedi/mastodon/field/mastodon_field_model.dart';
import 'package:fedi/mastodon/source/mastodon_source_model.dart';

abstract class IMastodonAccount {
  String get username;

  String get url;

  int get statusesCount;

  String get note;

  bool get locked;

  String get id;

  String get headerStatic;

  String get header;

  int get followingCount;

  int get followersCount;

  List<IMastodonField> get fields;

  List<IMastodonEmoji> get emojis;

  String get displayName;

  DateTime get createdAt;

  bool get bot;

  String get avatarStatic;

  String get avatar;

  String get acct;

  /// Note the extra source property,
  /// which is not visible on accounts other than your own.
  /// Also note that plain-text is used within source and
  /// HTML is used for their corresponding properties such as note and fields.
  IMastodonSource get source;

  DateTime get lastStatusAt;
}
