import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/field/pleroma_field_model.dart';
import 'package:fedi/Pleroma/relationship/pleroma_relationship_model.dart';
import 'package:fedi/Pleroma/source/pleroma_source_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/app/database/app_database.dart';

abstract class IAccount {
  int get localId;

  String get remoteId;

  String get username;

  String get url;

  int get statusesCount;

  String get note;

  bool get locked;

  String get headerStatic;

  String get header;

  int get followingCount;

  int get followersCount;

  String get displayName;

  DateTime get createdAt;

  bool get bot;

  String get avatarStatic;

  String get avatar;

  String get acct;

  DateTime get lastStatusAt;

  List<IPleromaField> get fields;

  List<IPleromaEmoji> get emojis;

  PleromaSource get source;

  // start pleroma related fields

  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  // TODO: add when type will be found
//  dynamic get pleromaBackgroundImage;

  ///  Lists an array of tags for the user
  List<PleromaTag> get pleromaTags;

  /// Includes fields as documented for
  /// Mastodon API https://docs.joinmastodon.org/entities/relationship/
  PleromaRelationship get pleromaRelationship;

  /// boolean, nullable, true if user is an admin
  bool get pleromaIsAdmin;

  /// boolean, nullable, true if user is a moderator
  bool get pleromaIsModerator;

  /// boolean, true if a new user account is waiting on email confirmation to
  /// be activated
  bool get pleromaConfirmationPending;

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/

  bool get pleromaHideFavorites;

  bool get pleromaHideFollowers;

  bool get pleromaHideFollows;

  bool get pleromaHideFollowersCount;

  bool get pleromaHideFollowsCount;

  ///  A generic map of settings for frontends.
  ///  Opaque to the backend.
  ///  Only returned in verify_credentials and update_credentials
// TODO: add when schema will be found
//  dynamic get pleromaSettingsStore;

  /// The token needed for Pleroma chat. Only returned in verify_credentials
  String get pleromaChatToken;

  bool get pleromaDeactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  bool get pleromaAllowFollowingMove;

  /// The count of unread conversations. Only returned to the account owner.
  int get pleromaUnreadConversationCount;

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  bool get pleromaSkipThreadContainment;

  PleromaAccountPleromaPartNotificationsSettings
      get pleromaNotificationSettings;
}

class DbAccountWrapper implements IAccount {
  final DbAccount dbAccount;

  DbAccountWrapper(this.dbAccount);

  @override
  String get acct => dbAccount.acct;

  @override
  String get avatar => dbAccount.avatar;

  @override
  String get avatarStatic => dbAccount.avatarStatic;

  @override
  bool get bot => dbAccount.bot;

  @override
  DateTime get createdAt => dbAccount.createdAt;

  @override
  String get displayName => dbAccount.displayName;

  @override
  List<IPleromaEmoji> get emojis => dbAccount.emojis;

  @override
  List<IPleromaField> get fields => dbAccount.fields;

  @override
  int get followersCount => dbAccount.followersCount;

  @override
  int get followingCount => dbAccount.followingCount;

  @override
  String get header => dbAccount.header;

  @override
  String get headerStatic => dbAccount.headerStatic;

  @override
  DateTime get lastStatusAt => dbAccount.lastStatusAt;

  @override
  int get localId => dbAccount.id;

  @override
  bool get locked => dbAccount.locked;

  @override
  String get note => dbAccount.note;

  @override
  bool get pleromaAllowFollowingMove => dbAccount.pleromaAllowFollowingMove;

  @override
  String get pleromaChatToken => dbAccount.pleromaChatToken;

  @override
  bool get pleromaConfirmationPending => dbAccount.pleromaConfirmationPending;

  @override
  bool get pleromaDeactivated => dbAccount.pleromaDeactivated;

  @override
  bool get pleromaHideFavorites => dbAccount.pleromaHideFavorites;

  @override
  bool get pleromaHideFollowers => dbAccount.pleromaHideFollowers;

  @override
  bool get pleromaHideFollowersCount => dbAccount.pleromaHideFollowersCount;

  @override
  bool get pleromaHideFollows => dbAccount.pleromaHideFollows;

  @override
  bool get pleromaHideFollowsCount => dbAccount.pleromaHideFollowsCount;

  @override
  bool get pleromaIsAdmin => dbAccount.pleromaIsAdmin;

  @override
  bool get pleromaIsModerator => dbAccount.pleromaIsModerator;

  @override
  PleromaAccountPleromaPartNotificationsSettings
      get pleromaNotificationSettings => dbAccount.pleromaNotificationSettings;

  @override
  PleromaRelationship get pleromaRelationship => dbAccount.pleromaRelationship;

  @override
  bool get pleromaSkipThreadContainment =>
      dbAccount.pleromaSkipThreadContainment;

  @override
  List<PleromaTag> get pleromaTags => dbAccount.pleromaTags;

  @override
  int get pleromaUnreadConversationCount =>
      dbAccount.pleromaUnreadConversationCount;

  @override
  String get remoteId => dbAccount.remoteId;

  @override
  PleromaSource get source => dbAccount.source;

  @override
  int get statusesCount => dbAccount.statusesCount;

  @override
  String get url => dbAccount.url;

  @override
  String get username => dbAccount.username;

  @override
  String toString() {
    return 'DbAccountWrapper{dbAccount: $dbAccount}';
  }


}
