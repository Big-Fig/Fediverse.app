import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/content/pleroma_content_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

typedef IStatusCallback(BuildContext context, IStatus status);

abstract class IStatus {
  IStatus get reblog;

  int get localId;

  String get remoteId;

  DateTime get createdAt;

  String get inReplyToRemoteId;

  String get inReplyToAccountRemoteId;

  bool get nsfwSensitive;

  String get spoilerText;

  String get uri;

  String get url;

  int get repliesCount;

  int get reblogsCount;

  int get favouritesCount;

  bool get favourited;

  bool get reblogged;

  bool get pinned;

  bool get muted;

  bool get bookmarked;

  String get content;

  String get reblogStatusRemoteId;

  PleromaApplication get application;

  IAccount get account;

  List<PleromaMediaAttachment> get mediaAttachments;

  List<PleromaMention> get mentions;

  List<PleromaTag> get tags;

  List<PleromaEmoji> get emojis;

  PleromaPoll get poll;

  PleromaCard get card;

  PleromaVisibility get visibility;

  String get language;

  // expanded pleroma object fields

  /// a map consisting of alternate representations of the content property with
  /// the key being it's mimetype.
  /// Currently the only alternate representation supported is text/plain
  PleromaContent get pleromaContent;

  /// the ID of the AP context the status is associated with (if any)

  int get pleromaConversationId;

  /// the ID of the Mastodon direct message conversation the status
  /// is associated with (if any)
  int get pleromaDirectConversationId;

  /// the acct property of User entity for replied user (if any)
  String get pleromaInReplyToAccountAcct;

  bool get pleromaLocal;

  /// a map consisting of alternate representations of the spoiler_text property
  /// with the key being it's mimetype. Currently the only alternate
  /// representation supported is text/plain
  PleromaContent get pleromaSpoilerText;

  /// a datetime (iso8601) that states when
  /// the post will expire (be deleted automatically),
  /// or empty if the post won't expire
  DateTime get pleromaExpiresAt;

  bool get pleromaThreadMuted;

  /// A list with emoji / reaction maps. The format is
  /// {name: "☕", count: 1, me: true}.
  /// Contains no information about the reacting users,
  /// for that use the /statuses/:id/reactions endpoint.
  List<PleromaStatusEmojiReaction> get pleromaEmojiReactions;

  IStatus copyWith(
      {IAccount account,
      IStatus reblog,
      int id,
      String remoteId,
      DateTime createdAt,
      String inReplyToRemoteId,
      String inReplyToAccountRemoteId,
      bool nsfwSensitive,
      String spoilerText,
      PleromaVisibility visibility,
      String uri,
      String url,
      int repliesCount,
      int reblogsCount,
      int favouritesCount,
      bool favourited,
      bool reblogged,
      bool muted,
      bool bookmarked,
      bool pinned,
      String content,
      String reblogStatusRemoteId,
      PleromaApplication application,
      String accountRemoteId,
      List<PleromaMediaAttachment> mediaAttachments,
      List<PleromaMention> mentions,
      List<PleromaTag> tags,
      List<PleromaEmoji> emojis,
      PleromaPoll poll,
      PleromaCard card,
      String language,
      PleromaContent pleromaContent,
      int pleromaConversationId,
      int pleromaDirectConversationId,
      String pleromaInReplyToAccountAcct,
      bool pleromaLocal,
      PleromaContent pleromaSpoilerText,
      DateTime pleromaExpiresAt,
      bool pleromaThreadMuted,
      List<PleromaStatusEmojiReaction> pleromaEmojiReactions});
}

class DbStatusPopulatedWrapper implements IStatus {
  final DbStatusPopulated dbStatusPopulated;

  DbStatusPopulatedWrapper(this.dbStatusPopulated);

  @override
  DbAccountWrapper get account => DbAccountWrapper(dbStatusPopulated.dbAccount);

  @override
  PleromaApplication get application => dbStatusPopulated.dbStatus.application;

  @override
  bool get bookmarked => dbStatusPopulated.dbStatus.bookmarked;

  @override
  PleromaCard get card => dbStatusPopulated.dbStatus.card;

  @override
  String get content => dbStatusPopulated.dbStatus.content;

  @override
  DateTime get createdAt => dbStatusPopulated.dbStatus.createdAt;

  @override
  List<PleromaEmoji> get emojis => dbStatusPopulated.dbStatus.emojis;

  @override
  bool get favourited => dbStatusPopulated.dbStatus.favourited;

  @override
  int get favouritesCount => dbStatusPopulated.dbStatus.favouritesCount;

  @override
  String get inReplyToAccountRemoteId =>
      dbStatusPopulated.dbStatus.inReplyToAccountRemoteId;

  @override
  String get inReplyToRemoteId => dbStatusPopulated.dbStatus.inReplyToRemoteId;

  @override
  int get localId => dbStatusPopulated.dbStatus.id;

  @override
  List<PleromaMediaAttachment> get mediaAttachments =>
      dbStatusPopulated.dbStatus.mediaAttachments;

  @override
  List<PleromaMention> get mentions => dbStatusPopulated.dbStatus.mentions;

  @override
  bool get muted => dbStatusPopulated.dbStatus.muted;

  @override
  PleromaContent get pleromaContent =>
      dbStatusPopulated.dbStatus.pleromaContent;

  @override
  int get pleromaConversationId =>
      dbStatusPopulated.dbStatus.pleromaConversationId;

  @override
  int get pleromaDirectConversationId =>
      dbStatusPopulated.dbStatus.pleromaDirectConversationId;

  @override
  List<PleromaStatusEmojiReaction> get pleromaEmojiReactions =>
      dbStatusPopulated.dbStatus.pleromaEmojiReactions;

  @override
  DateTime get pleromaExpiresAt => dbStatusPopulated.dbStatus.pleromaExpiresAt;

  @override
  String get pleromaInReplyToAccountAcct =>
      dbStatusPopulated.dbStatus.pleromaInReplyToAccountAcct;

  @override
  bool get pleromaLocal => dbStatusPopulated.dbStatus.pleromaLocal;

  @override
  PleromaContent get pleromaSpoilerText =>
      dbStatusPopulated.dbStatus.pleromaSpoilerText;

  @override
  bool get pleromaThreadMuted => dbStatusPopulated.dbStatus.pleromaThreadMuted;

  @override
  PleromaPoll get poll => dbStatusPopulated.dbStatus.poll;

  @override
  String get reblogStatusRemoteId =>
      dbStatusPopulated.dbStatus.reblogStatusRemoteId;

  @override
  bool get reblogged => dbStatusPopulated.dbStatus.reblogged;

  @override
  int get reblogsCount => dbStatusPopulated.dbStatus.reblogsCount;

  @override
  String get remoteId => dbStatusPopulated.dbStatus.remoteId;

  @override
  int get repliesCount => dbStatusPopulated.dbStatus.repliesCount;

  @override
  bool get nsfwSensitive => dbStatusPopulated.dbStatus.sensitive;

  @override
  String get spoilerText => dbStatusPopulated.dbStatus.spoilerText;

  @override
  List<PleromaTag> get tags => dbStatusPopulated.dbStatus.tags;

  @override
  String get uri => dbStatusPopulated.dbStatus.uri;

  @override
  String get url => dbStatusPopulated.dbStatus.url;

  @override
  PleromaVisibility get visibility => dbStatusPopulated.dbStatus.visibility;

  @override
  String get language => dbStatusPopulated.dbStatus.language;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbStatusPopulatedWrapper &&
          runtimeType == other.runtimeType &&
          dbStatusPopulated == other.dbStatusPopulated;

  @override
  int get hashCode => dbStatusPopulated.hashCode;

  @override
  String toString() {
    return 'DbStatusPopulatedWrapper{dbStatusPopulated: $dbStatusPopulated}';
  }

  @override
  bool get pinned => dbStatusPopulated.dbStatus.pinned;

  @override
  IStatus get reblog {
    if (dbStatusPopulated.reblogDbStatus != null &&
        dbStatusPopulated.reblogDbStatusAccount != null) {
      return DbStatusPopulatedWrapper(DbStatusPopulated(
          dbStatus: dbStatusPopulated.reblogDbStatus,
          dbAccount: dbStatusPopulated.reblogDbStatusAccount,
          reblogDbStatus: null,
          reblogDbStatusAccount: null));
    } else {
      return null;
    }
  }

  DbStatusPopulatedWrapper copyWith(
      {IAccount account,
      IStatus reblog,
      int id,
      String remoteId,
      DateTime createdAt,
      String inReplyToRemoteId,
      String inReplyToAccountRemoteId,
      bool nsfwSensitive,
      String spoilerText,
      PleromaVisibility visibility,
      String uri,
      String url,
      int repliesCount,
      int reblogsCount,
      int favouritesCount,
      bool favourited,
      bool reblogged,
      bool muted,
      bool bookmarked,
      bool pinned,
      String content,
      String reblogStatusRemoteId,
      PleromaApplication application,
      String accountRemoteId,
      List<PleromaMediaAttachment> mediaAttachments,
      List<PleromaMention> mentions,
      List<PleromaTag> tags,
      List<PleromaEmoji> emojis,
      PleromaPoll poll,
      PleromaCard card,
      String language,
      PleromaContent pleromaContent,
      int pleromaConversationId,
      int pleromaDirectConversationId,
      String pleromaInReplyToAccountAcct,
      bool pleromaLocal,
      PleromaContent pleromaSpoilerText,
      DateTime pleromaExpiresAt,
      bool pleromaThreadMuted,
      List<PleromaStatusEmojiReaction> pleromaEmojiReactions}) {
    DbStatus reblogStatus;
    DbAccount reblogStatusAccount;

    if (reblog != null) {
      reblogStatus = DbStatus(
        id: reblog.localId,
        remoteId: reblog.remoteId,
        createdAt: reblog.createdAt,
        inReplyToRemoteId: reblog.inReplyToRemoteId,
        inReplyToAccountRemoteId: reblog.inReplyToAccountRemoteId,
        sensitive: reblog.nsfwSensitive,
        spoilerText: reblog.spoilerText,
        visibility: reblog.visibility,
        uri: reblog.uri,
        url: reblog.url,
        repliesCount: reblog.repliesCount,
        reblogsCount: reblog.reblogsCount,
        favouritesCount: reblog.favouritesCount,
        favourited: reblog.favourited,
        reblogged: reblog.reblogged,
        muted: reblog.muted,
        bookmarked: reblog.bookmarked,
        pinned: reblog.pinned,
        content: reblog.content,
        reblogStatusRemoteId: reblog.reblogStatusRemoteId,
        application: reblog.application,
        accountRemoteId: reblog.account.remoteId,
        mediaAttachments: reblog.mediaAttachments,
        mentions: reblog.mentions,
        tags: reblog.tags,
        emojis: reblog.emojis,
        poll: reblog.poll,
        card: reblog.card,
        language: reblog.language,
        pleromaContent: reblog.pleromaContent,
        pleromaConversationId: reblog.pleromaConversationId,
        pleromaDirectConversationId: reblog.pleromaDirectConversationId,
        pleromaInReplyToAccountAcct: reblog.pleromaInReplyToAccountAcct,
        pleromaLocal: reblog.pleromaLocal,
        pleromaSpoilerText: reblog.pleromaSpoilerText,
        pleromaExpiresAt: reblog.pleromaExpiresAt,
        pleromaThreadMuted: reblog.pleromaThreadMuted,
        pleromaEmojiReactions: reblog.pleromaEmojiReactions,
      );

      reblogStatusAccount = DbAccount(
          id: reblog.account?.localId,
          remoteId: reblog.account?.remoteId,
          username: reblog.account?.username,
          url: reblog.account?.url,
          note: reblog.account?.note,
          locked: reblog.account?.locked,
          headerStatic: reblog.account?.headerStatic,
          header: reblog.account?.header,
          followingCount: reblog.account?.followingCount,
          followersCount: reblog.account?.followersCount,
          statusesCount: reblog.account?.statusesCount,
          displayName: reblog.account?.displayName,
          createdAt: reblog.account?.createdAt,
          bot: reblog.account?.bot,
          avatarStatic: reblog.account?.avatarStatic,
          avatar: reblog.account?.avatar,
          acct: reblog.account?.acct,
          lastStatusAt: reblog.account?.lastStatusAt,
          fields: reblog.account?.fields,
          emojis: reblog.account?.emojis,
          pleromaRelationship: reblog.account?.pleromaRelationship,
          pleromaTags: reblog.account?.pleromaTags,
          pleromaIsAdmin: reblog.account?.pleromaIsAdmin,
          pleromaIsModerator: reblog.account?.pleromaIsModerator,
          pleromaConfirmationPending:
              reblog.account?.pleromaConfirmationPending,
          pleromaHideFavorites: reblog.account?.pleromaHideFavorites,
          pleromaHideFollowers: reblog.account?.pleromaHideFollowers,
          pleromaHideFollows: reblog.account?.pleromaHideFollows,
          pleromaHideFollowersCount: reblog.account?.pleromaHideFollowersCount,
          pleromaHideFollowsCount: reblog.account?.pleromaHideFollowsCount,
          pleromaDeactivated: reblog.account?.pleromaDeactivated,
          pleromaAllowFollowingMove: reblog.account?.pleromaAllowFollowingMove,
          pleromaSkipThreadContainment:
              reblog.account?.pleromaSkipThreadContainment);
    }

    return DbStatusPopulatedWrapper(dbStatusPopulated.copyWith(
        status: dbStatusPopulated.dbStatus.copyWith(
          id: id,
          remoteId: remoteId,
          createdAt: createdAt,
          inReplyToRemoteId: inReplyToRemoteId,
          inReplyToAccountRemoteId: inReplyToAccountRemoteId,
          sensitive: nsfwSensitive,
          spoilerText: spoilerText,
          visibility: visibility,
          uri: uri,
          url: url,
          repliesCount: repliesCount,
          reblogsCount: reblogsCount,
          favouritesCount: favouritesCount,
          favourited: favourited,
          reblogged: reblogged,
          muted: muted,
          bookmarked: bookmarked,
          pinned: pinned,
          content: content,
          reblogStatusRemoteId: reblogStatusRemoteId,
          application: application,
          accountRemoteId: accountRemoteId,
          mediaAttachments: mediaAttachments,
          mentions: mentions,
          tags: tags,
          emojis: emojis,
          poll: poll,
          card: card,
          language: language,
          pleromaContent: pleromaContent,
          pleromaConversationId: pleromaConversationId,
          pleromaDirectConversationId: pleromaDirectConversationId,
          pleromaInReplyToAccountAcct: pleromaInReplyToAccountAcct,
          pleromaLocal: pleromaLocal,
          pleromaSpoilerText: pleromaSpoilerText,
          pleromaExpiresAt: pleromaExpiresAt,
          pleromaThreadMuted: pleromaThreadMuted,
          pleromaEmojiReactions: pleromaEmojiReactions,
        ),
        account: dbStatusPopulated.dbAccount.copyWith(
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
            pleromaSkipThreadContainment:
                account?.pleromaSkipThreadContainment),
        reblogDbStatus: reblogStatus,
        reblogDbStatusAccount: reblogStatusAccount));
  }
}

class DbStatusPopulated {
  final DbStatus dbStatus;
  final DbAccount dbAccount;
  final DbStatus reblogDbStatus;
  final DbAccount reblogDbStatusAccount;

  DbStatusPopulated({
    @required this.dbStatus,
    @required this.dbAccount,
    @required this.reblogDbStatus,
    @required this.reblogDbStatusAccount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbStatusPopulated &&
          runtimeType == other.runtimeType &&
          dbStatus == other.dbStatus &&
          dbAccount == other.dbAccount &&
          reblogDbStatus == other.reblogDbStatus &&
          reblogDbStatusAccount == other.reblogDbStatusAccount;

  @override
  int get hashCode =>
      dbStatus.hashCode ^
      dbAccount.hashCode ^
      reblogDbStatus.hashCode ^
      reblogDbStatusAccount.hashCode;

  @override
  String toString() {
    return 'DbStatusPopulated{dbStatus: $dbStatus, dbAccount: $dbAccount,'
        ' reblogDbStatus: $reblogDbStatus,'
        ' reblogDbStatusAccount: $reblogDbStatusAccount}';
  }

  DbStatusPopulated copyWith({
    DbStatus status,
    DbAccount account,
    DbStatus reblogDbStatus,
    DbAccount reblogDbStatusAccount,
  }) =>
      DbStatusPopulated(
          dbStatus: status,
          dbAccount: account,
          reblogDbStatus: reblogDbStatus,
          reblogDbStatusAccount: reblogDbStatusAccount);
}
