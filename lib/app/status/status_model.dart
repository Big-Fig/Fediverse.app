import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'status_model.freezed.dart';

final _logger = Logger('status_model.dart');

typedef StatusAndContextCallback = Function(
  BuildContext context,
  IStatus status,
);
typedef StatusCallback = Function(IStatus? status);

abstract class IStatus implements IEqualComparableObj<IStatus> {
  static bool isItemsEqual(IStatus a, IStatus b) => a.remoteId == b.remoteId;

  static int compareItemsToSort(IStatus? a, IStatus? b) {
    if (a == null && b == null) {
      return 0;
    } else if (a != null && b == null) {
      return 1;
    } else if (a == null && b != null) {
      return -1;
    } else {
      return a!.remoteId!.compareTo(b!.remoteId!);
    }
  }

  IStatus? get reblog;

  int? get localId;

  String? get remoteId;

  DateTime get createdAt;

  IStatus? get inReplyToStatus;

  String? get inReplyToRemoteId;

  String? get inReplyToAccountRemoteId;

  bool get nsfwSensitive;

  String? get spoilerText;

  String get uri;

  String? get url;

  int get repliesCount;

  int get reblogsCount;

  int get favouritesCount;

  bool get favourited;

  bool get reblogged;

  bool get pinned;

  bool get muted;

  bool get bookmarked;

  String? get content;

  String? get reblogStatusRemoteId;

  UnifediApiApplication? get application;

  IAccount get account;

  List<UnifediApiMediaAttachment>? get mediaAttachments;

  List<UnifediApiMention>? get mentions;

  List<UnifediApiTag>? get tags;

  List<UnifediApiEmoji>? get emojis;

  UnifediApiPoll? get poll;

  UnifediApiCard? get card;

  UnifediApiVisibility get visibility;

  String? get language;

  // expanded pleroma object fields

  /// a map consisting of alternate representations of the content property with
  /// the key being it's mimetype.
  /// Currently the only alternate representation supported is text/plain
  UnifediApiContentVariants? get contentVariants;

  /// the ID of the AP context the status is associated with (if any)

  int? get conversationId;

  /// the ID of the Mastodon direct message conversation the status
  /// is associated with (if any)
  int? get directConversationId;

  /// the acct property of User entity for replied user (if any)
  String? get inReplyToAccountAcct;

  bool? get local;

  /// a map consisting of alternate representations of the spoiler_text property
  /// with the key being it's mimetype. Currently the only alternate
  /// representation supported is text/plain
  UnifediApiContentVariants? get spoilerTextVariants;

  /// a datetime (iso8601) that states when
  /// the post will expire (be deleted automatically),
  /// or empty if the post wont expire
  DateTime? get expiresAt;

  bool? get threadMuted;

  /// A list with emoji / reaction maps. The format is
  /// {name: '☕', count: 1, me: true}.
  /// Contains no information about the reacting users,
  /// for that use the /statuses/:id/reactions endpoint.
  List<UnifediApiEmojiReaction>? get emojiReactions;

  bool get deleted;

  PendingState? get pendingState;

  String? get oldPendingRemoteId;

  bool get hiddenLocallyOnDevice;

  String? get wasSentWithIdempotencyKey;
}

extension IStatusDbExtension on IStatus {
  bool get isReply =>
      inReplyToAccountRemoteId != null && inReplyToRemoteId != null;

  bool get isHaveReblog => reblogStatusRemoteId != null;

  DbStatusPopulatedWrapper toDbStatusPopulatedWrapper() {
    if (this is DbStatusPopulatedWrapper) {
      return this as DbStatusPopulatedWrapper;
    } else {
      return DbStatusPopulatedWrapper(
        dbStatusPopulated: toDbStatusPopulated(),
      );
    }
  }

  DbStatusPopulated toDbStatusPopulated() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper.dbStatusPopulated;
    } else {
      return DbStatusPopulated(
        dbStatus: toDbStatus(),
        dbAccount: toDbAccount(),
        reblogDbStatus: toReblogDbStatus(),
        reblogDbStatusAccount: toReblogStatusDbAccount(),
        replyDbStatus: toReplyDbStatus(),
        replyDbStatusAccount: toReplyStatusDbAccount(),
        replyReblogDbStatus: toReplyReblogDbStatus(),
        replyReblogDbStatusAccount: toReplyReblogStatusDbAccount(),
      );
    }
  }

  DbStatus toDbStatus() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper.dbStatusPopulated.dbStatus;
    } else {
      return DbStatus(
        id: localId,
        remoteId: remoteId!,
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
        accountRemoteId: account.remoteId,
        mediaAttachments: mediaAttachments,
        mentions: mentions,
        tags: tags,
        emojis: emojis,
        poll: poll,
        card: card,
        language: language,
        contentVariants: contentVariants,
        conversationId: conversationId,
        directConversationId: directConversationId,
        inReplyToAccountAcct: inReplyToAccountAcct,
        local: local,
        spoilerTextVariants: spoilerTextVariants,
        expiresAt: expiresAt,
        threadMuted: threadMuted,
        emojiReactions: emojiReactions,
        deleted: deleted,
        oldPendingRemoteId: oldPendingRemoteId,
        hiddenLocallyOnDevice: hiddenLocallyOnDevice,
        pendingState: pendingState,
        wasSentWithIdempotencyKey: wasSentWithIdempotencyKey,
      );
    }
  }

  DbAccount toDbAccount() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper.dbStatusPopulated.dbAccount;
    } else {
      return account.toDbAccount();
    }
  }

  DbStatus? toReblogDbStatus() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper.dbStatusPopulated.reblogDbStatus;
    } else {
      return reblog?.toDbStatus();
    }
  }

  DbAccount? toReblogStatusDbAccount() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper.dbStatusPopulated.reblogDbStatusAccount;
    } else {
      return reblog?.account.toDbAccount();
    }
  }

  DbStatus? toReplyDbStatus() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper.dbStatusPopulated.replyDbStatus;
    } else {
      return inReplyToStatus?.toDbStatus();
    }
  }

  DbAccount? toReplyStatusDbAccount() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper.dbStatusPopulated.replyDbStatusAccount;
    } else {
      return inReplyToStatus?.account.toDbAccount();
    }
  }

  DbStatus? toReplyReblogDbStatus() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper.dbStatusPopulated.replyReblogDbStatus;
    } else {
      return reblog?.inReplyToStatus?.toDbStatus();
    }
  }

  DbAccount? toReplyReblogStatusDbAccount() {
    if (this is DbStatusPopulatedWrapper) {
      var dbStatusPopulatedWrapper = this as DbStatusPopulatedWrapper;

      return dbStatusPopulatedWrapper
          .dbStatusPopulated.replyReblogDbStatusAccount;
    } else {
      return reblog?.inReplyToStatus?.account.toDbAccount();
    }
  }
}

@freezed
class DbStatusPopulatedWrapper
    with _$DbStatusPopulatedWrapper
    implements IStatus {
  const DbStatusPopulatedWrapper._();
  const factory DbStatusPopulatedWrapper({
    required DbStatusPopulated dbStatusPopulated,
  }) = _DbStatusPopulatedWrapper;

  @override
  DbAccountPopulatedWrapper get account => DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbStatusPopulated.dbAccount,
        ),
      );

  @override
  UnifediApiApplication? get application =>
      dbStatusPopulated.dbStatus.application;

  @override
  bool get bookmarked => dbStatusPopulated.dbStatus.bookmarked == true;

  @override
  UnifediApiCard? get card => dbStatusPopulated.dbStatus.card;

  @override
  String? get content => dbStatusPopulated.dbStatus.content;

  @override
  DateTime get createdAt => dbStatusPopulated.dbStatus.createdAt;

  @override
  List<UnifediApiEmoji>? get emojis => dbStatusPopulated.dbStatus.emojis;

  @override
  bool get favourited => dbStatusPopulated.dbStatus.favourited;

  @override
  int get favouritesCount => dbStatusPopulated.dbStatus.favouritesCount;

  @override
  IStatus? get inReplyToStatus {
    var replyDbStatus = dbStatusPopulated.replyDbStatus;
    var replyDbStatusAccount = dbStatusPopulated.replyDbStatusAccount;
    if (replyDbStatus != null && replyDbStatusAccount != null) {
      return DbStatusPopulatedWrapper(
        dbStatusPopulated: DbStatusPopulated(
          dbStatus: replyDbStatus,
          dbAccount: replyDbStatusAccount,
          reblogDbStatus: dbStatusPopulated.replyReblogDbStatus,
          reblogDbStatusAccount: dbStatusPopulated.replyReblogDbStatusAccount,
          replyDbStatus: null,
          replyReblogDbStatusAccount: null,
          replyReblogDbStatus: null,
          replyDbStatusAccount: null,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  String? get inReplyToAccountRemoteId =>
      dbStatusPopulated.dbStatus.inReplyToAccountRemoteId;

  @override
  String? get inReplyToRemoteId => dbStatusPopulated.dbStatus.inReplyToRemoteId;

  @override
  int? get localId => dbStatusPopulated.dbStatus.id;

  @override
  List<UnifediApiMediaAttachment>? get mediaAttachments =>
      dbStatusPopulated.dbStatus.mediaAttachments;

  @override
  List<UnifediApiMention>? get mentions => dbStatusPopulated.dbStatus.mentions;

  @override
  bool get muted => dbStatusPopulated.dbStatus.muted;

  @override
  UnifediApiContentVariants? get contentVariants =>
      dbStatusPopulated.dbStatus.contentVariants;

  @override
  int? get conversationId => dbStatusPopulated.dbStatus.conversationId;

  @override
  int? get directConversationId =>
      dbStatusPopulated.dbStatus.directConversationId;

  @override
  List<UnifediApiEmojiReaction>? get emojiReactions =>
      dbStatusPopulated.dbStatus.emojiReactions;

  @override
  DateTime? get expiresAt => dbStatusPopulated.dbStatus.expiresAt;

  @override
  String? get inReplyToAccountAcct =>
      dbStatusPopulated.dbStatus.inReplyToAccountAcct;

  @override
  bool? get local => dbStatusPopulated.dbStatus.local;

  @override
  UnifediApiContentVariants? get spoilerTextVariants =>
      dbStatusPopulated.dbStatus.spoilerTextVariants;

  @override
  bool? get threadMuted => dbStatusPopulated.dbStatus.threadMuted;

  @override
  UnifediApiPoll? get poll => dbStatusPopulated.dbStatus.poll;

  @override
  String? get reblogStatusRemoteId =>
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
  String? get spoilerText => dbStatusPopulated.dbStatus.spoilerText;

  @override
  List<UnifediApiTag>? get tags => dbStatusPopulated.dbStatus.tags;

  @override
  String get uri => dbStatusPopulated.dbStatus.uri;

  @override
  String? get url => dbStatusPopulated.dbStatus.url;

  @override
  UnifediApiVisibility get visibility => dbStatusPopulated.dbStatus.visibility;

  @override
  String? get language => dbStatusPopulated.dbStatus.language;

  @override
  bool get pinned => dbStatusPopulated.dbStatus.pinned == true;

  @override
  bool get deleted => dbStatusPopulated.dbStatus.deleted == true;

  @override
  bool get hiddenLocallyOnDevice =>
      dbStatusPopulated.dbStatus.hiddenLocallyOnDevice == true;

  @override
  PendingState? get pendingState => dbStatusPopulated.dbStatus.pendingState;

  @override
  String? get oldPendingRemoteId =>
      dbStatusPopulated.dbStatus.oldPendingRemoteId;

  @override
  IStatus? get reblog {
    var reblogDbStatus = dbStatusPopulated.reblogDbStatus;
    var reblogDbStatusAccount = dbStatusPopulated.reblogDbStatusAccount;
    if (reblogDbStatus != null && reblogDbStatusAccount != null) {
      return DbStatusPopulatedWrapper(
        dbStatusPopulated: DbStatusPopulated(
          dbStatus: reblogDbStatus,
          dbAccount: reblogDbStatusAccount,
          reblogDbStatus: null,
          reblogDbStatusAccount: null,
          replyDbStatus: null,
          replyReblogDbStatusAccount: null,
          replyDbStatusAccount: null,
          replyReblogDbStatus: null,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  String? get wasSentWithIdempotencyKey =>
      dbStatusPopulated.dbStatus.wasSentWithIdempotencyKey;

  @override
  int compareTo(IStatus b) => IStatus.compareItemsToSort(this, b);

  @override
  bool isEqualTo(IStatus b) => IStatus.isItemsEqual(this, b);
}

@freezed
class DbStatusPopulated with _$DbStatusPopulated {
  const DbStatusPopulated._();
  const factory DbStatusPopulated({
    required DbStatus dbStatus,
    required DbAccount dbAccount,
    required DbStatus? reblogDbStatus,
    required DbAccount? reblogDbStatusAccount,
    required DbStatus? replyDbStatus,
    required DbAccount? replyDbStatusAccount,
    required DbStatus? replyReblogDbStatus,
    required DbAccount? replyReblogDbStatusAccount,
  }) = _DbStatusPopulated;
}

extension IStatusExtension on IStatus {
  Uri get urlRemoteHostUri {
    var uri = Uri.parse(url ?? this.uri);

    var resultUrl = '${uri.scheme}://${uri.host}';

    return Uri.parse(resultUrl);
  }

  String get urlRemoteId {
    try {
      // todo: perhaps need improvements
      var splitResult = (url ?? uri).split('/');

      var isHaveEndingSlash = splitResult.last.isNotEmpty;
      if (isHaveEndingSlash) {
        return splitResult.last;
      } else {
        // ignore: no-magic-number
        var middleIndex = splitResult.length - 2;

        return splitResult[middleIndex];
      }
    } catch (e, stackTrace) {
      var exception = CantExtractStatusRemoteIdFromStatusUrlException(
        e: e,
        status: this,
      );
      _logger.shout(() => '$exception', stackTrace);
      throw exception;
    }
  }
}

extension DbStatusPopulatedExtension on DbStatusPopulated {
  DbStatusPopulatedWrapper toDbStatusPopulatedWrapper() =>
      DbStatusPopulatedWrapper(dbStatusPopulated: this);
}

extension DbStatusPopulatedListExtension on List<DbStatusPopulated> {
  List<DbStatusPopulatedWrapper> toDbStatusPopulatedWrappers() => map(
        (item) => item.toDbStatusPopulatedWrapper(),
      ).toList();
}

class CantExtractStatusRemoteIdFromStatusUrlException implements Exception {
  final IStatus status;
  final dynamic e;

  CantExtractStatusRemoteIdFromStatusUrlException({
    required this.status,
    this.e,
  });

  @override
  String toString() => 'CantExtractStatusRemoteIdFromStatusUrlException{'
      'status: $status, '
      'e: $e'
      '}';
}

extension IUnifediApiMentionStatusListExtension on List<IStatus> {
  List<IUnifediApiMention> findAllMentions() {
    var statuses = this;
    var mentions = <IUnifediApiMention>{};

    statuses.forEach(
      (status) {
        mentions.addAll(status.mentions ?? []);
      },
    );

    return mentions.toList();
  }
}
