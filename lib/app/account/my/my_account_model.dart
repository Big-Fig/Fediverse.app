import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:hive/hive.dart';

part 'my_account_model.g.dart';

abstract class IMyAccount extends IAccount implements IPreferencesObject {
  PleromaMyAccountPleromaPartNotificationsSettings
      get pleromaNotificationSettings;

  int get pleromaUnreadConversationCount;

  String get pleromaChatToken;
}

@HiveType()
class MyAccountRemoteWrapper extends IMyAccount {
  @HiveField(0)
  PleromaMyAccount remoteAccount;

  MyAccountRemoteWrapper({this.remoteAccount});

  @override
  String get acct => remoteAccount.acct;

  @override
  String get avatar => remoteAccount.avatar;

  @override
  String get avatarStatic => remoteAccount.avatarStatic;

  @override
  bool get bot => remoteAccount.bot;

  @override
  DateTime get createdAt => remoteAccount.createdAt;

  @override
  String get displayName => remoteAccount.displayName;

  @override
  List<IPleromaEmoji> get emojis => remoteAccount.emojis;

  @override
  List<IPleromaField> get fields => remoteAccount.fields;

  @override
  int get followersCount => remoteAccount.followersCount;

  @override
  int get followingCount => remoteAccount.followingCount;

  @override
  String get header => remoteAccount.header;

  @override
  String get headerStatic => remoteAccount.headerStatic;

  @override
  DateTime get lastStatusAt => remoteAccount.lastStatusAt;

  @override
  int get localId => null;

  @override
  bool get locked => remoteAccount.locked;

  @override
  String get note => remoteAccount.note;

  @override
  bool get pleromaAllowFollowingMove =>
      remoteAccount.pleroma?.allowFollowingMove;

  @override
  bool get pleromaConfirmationPending =>
      remoteAccount.pleroma?.confirmationPending;

  @override
  bool get pleromaDeactivated => remoteAccount.pleroma?.deactivated;

  @override
  bool get pleromaHideFavorites => remoteAccount.pleroma?.hideFavorites;

  @override
  bool get pleromaHideFollowers => remoteAccount.pleroma?.hideFollowers;

  @override
  bool get pleromaHideFollowersCount =>
      remoteAccount.pleroma?.hideFollowersCount;

  @override
  bool get pleromaHideFollows => remoteAccount.pleroma?.hideFollows;

  @override
  bool get pleromaHideFollowsCount => remoteAccount.pleroma?.hideFollowsCount;

  @override
  bool get pleromaIsAdmin => remoteAccount.pleroma?.isAdmin;

  @override
  bool get pleromaIsModerator => remoteAccount.pleroma?.isModerator;

  @override
  PleromaAccountRelationship get pleromaRelationship =>
      remoteAccount.pleroma?.relationship;

  @override
  bool get pleromaSkipThreadContainment =>
      remoteAccount.pleroma?.skipThreadContainment;

  @override
  List<dynamic> get pleromaTags => remoteAccount.pleroma?.tags;

  @override
  String get remoteId => remoteAccount.id;

  @override
  int get statusesCount => remoteAccount.statusesCount;

  @override
  String get url => remoteAccount.url;

  @override
  String get username => remoteAccount.username;

  @override
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
          bool pleromaSkipThreadContainment}) =>
      MyAccountRemoteWrapper(
          remoteAccount: remoteAccount.copyWith(
              id: remoteId,
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
              pleroma: PleromaMyAccountPleromaPart(
                  tags: pleromaTags ?? this.pleromaTags,
                  relationship: pleromaRelationship ?? this.pleromaRelationship,
                  isAdmin: pleromaIsAdmin ?? this.pleromaIsAdmin,
                  isModerator: pleromaIsModerator ?? this.pleromaIsModerator,
                  confirmationPending: pleromaConfirmationPending ??
                      this.pleromaConfirmationPending,
                  hideFavorites:
                      pleromaHideFavorites ?? this.pleromaHideFavorites,
                  hideFollowers:
                      pleromaHideFollowers ?? this.pleromaHideFollowers,
                  hideFollows: pleromaHideFollows ?? this.pleromaHideFollows,
                  hideFollowersCount: pleromaHideFollowersCount ??
                      this.pleromaHideFollowersCount,
                  hideFollowsCount:
                      pleromaHideFollowsCount ?? this.pleromaHideFollowsCount,
                  deactivated: pleromaDeactivated ?? this.pleromaDeactivated,
                  allowFollowingMove: pleromaAllowFollowingMove ??
                      this.pleromaAllowFollowingMove,
                  skipThreadContainment: pleromaSkipThreadContainment ??
                      this.pleromaSkipThreadContainment)));

  @override
  String get pleromaChatToken => remoteAccount.pleroma?.chatToken;

  @override
  PleromaMyAccountPleromaPartNotificationsSettings
      get pleromaNotificationSettings =>
          remoteAccount.pleroma?.notificationSettings;

  @override
  int get pleromaUnreadConversationCount =>
      remoteAccount.pleroma?.unreadConversationCount;

  @override
  String toString() {
    return 'MyAccountRemoteWrapper{remoteAccount: $remoteAccount}';
  }

  @override
  String get pleromaBackgroundImage => remoteAccount.pleroma?.backgroundImage;
}

class SelfActionNotPossibleException implements Exception {
  const SelfActionNotPossibleException();

  @override
  String toString() {
    return 'SelfActionNotPossibleException: '
        '"You cant retrieve or perform actions with yourself"';
  }
}
