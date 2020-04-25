import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/refactored/pleroma/tag/pleroma_tag_model.dart';

typedef AccountSelectedCallback(IAccount account);

abstract class IAccount {

  static List<IAccount> excludeAccountFromList(
      List<IAccount> accounts, bool predicate(IAccount account)) =>
      accounts?.where((account) => predicate(account))?.toList();


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

  // start pleroma related fields

  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  // TODO: add when type will be found
//  dynamic get pleromaBackgroundImage;

  ///  Lists an array of tags for the user
  List<dynamic> get pleromaTags;

  /// Includes fields as documented for
  /// Mastodon API https://docs.joinmastodon.org/entities/relationship/
  PleromaAccountRelationship get pleromaRelationship;

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

  bool get pleromaDeactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  bool get pleromaAllowFollowingMove;

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  bool get pleromaSkipThreadContainment;

  IAccount copyWith(
      {String remoteId,
      String username,
      String url,
      String note,
      bool locked,
      String headerStatic,
      String header,
      int followingCount,
      int followersCount,
      int statusesCount,
      String displayName,
      DateTime createdAt,
      bool bot,
      String avatarStatic,
      String avatar,
      String acct,
      DateTime lastStatusAt,
      List<PleromaField> fields,
      List<PleromaEmoji> emojis,
      List<PleromaTag> pleromaTags,
      PleromaAccountRelationship pleromaRelationship,
      bool pleromaIsAdmin,
      bool pleromaIsModerator,
      bool pleromaConfirmationPending,
      bool pleromaHideFavorites,
      bool pleromaHideFollowers,
      bool pleromaHideFollows,
      bool pleromaHideFollowersCount,
      bool pleromaHideFollowsCount,
      bool pleromaDeactivated,
      bool pleromaAllowFollowingMove,
      bool pleromaSkipThreadContainment});
}

class DbAccountWrapper implements IAccount {
  final DbAccount dbAccount;

  DbAccountWrapper(this.dbAccount) {
    assert(dbAccount != null);
  }

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
  PleromaAccountRelationship get pleromaRelationship =>
      dbAccount.pleromaRelationship;

  @override
  bool get pleromaSkipThreadContainment =>
      dbAccount.pleromaSkipThreadContainment;

  @override
  List<PleromaTag> get pleromaTags => dbAccount.pleromaTags;

  @override
  String get remoteId => dbAccount.remoteId;

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

  @override
  IAccount copyWith(
          {int id,
          String remoteId,
          String username,
          String url,
          String note,
          bool locked,
          String headerStatic,
          String header,
          int followingCount,
          int followersCount,
          int statusesCount,
          String displayName,
          DateTime createdAt,
          bool bot,
          String avatarStatic,
          String avatar,
          String acct,
          DateTime lastStatusAt,
          List<PleromaField> fields,
          List<PleromaEmoji> emojis,
          List<PleromaTag> pleromaTags,
          PleromaAccountRelationship pleromaRelationship,
          bool pleromaIsAdmin,
          bool pleromaIsModerator,
          bool pleromaConfirmationPending,
          bool pleromaHideFavorites,
          bool pleromaHideFollowers,
          bool pleromaHideFollows,
          bool pleromaHideFollowersCount,
          bool pleromaHideFollowsCount,
          bool pleromaDeactivated,
          bool pleromaAllowFollowingMove,
          bool pleromaSkipThreadContainment}) =>
      DbAccountWrapper(dbAccount.copyWith(
        id: id,
        remoteId: remoteId,
        username: username,
        url: url,
        note: note,
        locked: locked,
        headerStatic: headerStatic,
        header: header,
        followingCount: followingCount,
        followersCount: followersCount,
        statusesCount: statusesCount,
        displayName: displayName,
        createdAt: createdAt,
        bot: bot,
        avatarStatic: avatarStatic,
        avatar: avatar,
        acct: acct,
        lastStatusAt: lastStatusAt,
        fields: fields,
        emojis: emojis,
        pleromaTags: pleromaTags,
        pleromaRelationship: pleromaRelationship,
        pleromaIsAdmin: pleromaIsAdmin,
        pleromaIsModerator: pleromaIsModerator,
        pleromaConfirmationPending: pleromaConfirmationPending,
        pleromaHideFavorites: pleromaHideFavorites,
        pleromaHideFollowers: pleromaHideFollowers,
        pleromaHideFollows: pleromaHideFollows,
        pleromaHideFollowersCount: pleromaHideFollowersCount,
        pleromaHideFollowsCount: pleromaHideFollowsCount,
        pleromaDeactivated: pleromaDeactivated,
        pleromaAllowFollowingMove: pleromaAllowFollowingMove,
        pleromaSkipThreadContainment: pleromaSkipThreadContainment,
      ));
}

DbAccount dbAccountFromAccount(IAccount account) {
  if (account == null) {
    return null;
  }
  return DbAccount(
      id: account?.localId,
      remoteId: account?.remoteId,
      username: account?.username,
      url: account?.url,
      note: account?.note,
      locked: account?.locked,
      headerStatic: account?.headerStatic,
      header: account?.header,
      followingCount: account?.followingCount,
      followersCount: account?.followersCount,
      statusesCount: account?.statusesCount,
      displayName: account?.displayName,
      createdAt: account?.createdAt,
      bot: account?.bot,
      avatarStatic: account?.avatarStatic,
      avatar: account?.avatar,
      acct: account?.acct,
      lastStatusAt: account?.lastStatusAt,
      fields: account?.fields,
      emojis: account?.emojis,
      pleromaRelationship: account?.pleromaRelationship,
      pleromaTags: account?.pleromaTags,
      pleromaIsAdmin: account?.pleromaIsAdmin,
      pleromaIsModerator: account?.pleromaIsModerator,
      pleromaConfirmationPending: account?.pleromaConfirmationPending,
      pleromaHideFavorites: account?.pleromaHideFavorites,
      pleromaHideFollowers: account?.pleromaHideFollowers,
      pleromaHideFollows: account?.pleromaHideFollows,
      pleromaHideFollowersCount: account?.pleromaHideFollowersCount,
      pleromaHideFollowsCount: account?.pleromaHideFollowsCount,
      pleromaDeactivated: account?.pleromaDeactivated,
      pleromaAllowFollowingMove: account?.pleromaAllowFollowingMove,
      pleromaSkipThreadContainment: account?.pleromaSkipThreadContainment);
}
