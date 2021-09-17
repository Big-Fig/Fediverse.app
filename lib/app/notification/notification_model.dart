import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';

import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:unifedi_api/unifedi_api.dart';

class NotificationState {
  final bool? dismissed;
  final bool? unread;

  NotificationState({
    this.dismissed,
    this.unread,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationState &&
          runtimeType == other.runtimeType &&
          dismissed == other.dismissed &&
          unread == other.unread;

  @override
  int get hashCode => dismissed.hashCode ^ unread.hashCode;

  @override
  String toString() {
    return 'NotificationState{dismissed: $dismissed, unread: $unread}';
  }
}

abstract class INotification implements IEqualComparableObj<INotification> {
  int? get localId;

  String get remoteId;

  bool? get unread;

  DateTime get createdAt;

  IStatus? get status;

  IAccount? get account;

  String? get chatMessageRemoteId;

  String? get chatRemoteId;

  IUnifediApiChatMessage? get chatMessage;

  IUnifediApiAccountReport? get report;

  String get type;


  UnifediApiNotificationType get typeAsUnifediApi;

  String? get emoji;


  bool get isContainsChat;

  bool get isContainsStatus;

  bool get isContainsAccount;

  bool get isContainsTargetAccount;

  bool get dismissed;

  IUnifediApiAccount? get target;

}

class DbNotificationPopulatedWrapper implements INotification {
  final DbNotificationPopulated dbNotificationPopulated;

  @override
  bool get isContainsChat => chatRemoteId != null;

  @override
  bool get isContainsStatus => status != null;

  @override
  bool get isContainsAccount => account != null;

  @override
  bool get isContainsTargetAccount => target != null;

  DbNotificationPopulatedWrapper({
    required this.dbNotificationPopulated,
  });

  @override
  IAccount? get account {
    var dbAccount = dbNotificationPopulated.dbAccount;
    if (dbAccount != null) {
      return DbAccountPopulatedWrapper(
        dbAccountPopulated: DbAccountPopulated(
          dbAccount: dbAccount,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  DateTime get createdAt => dbNotificationPopulated.dbNotification.createdAt;

  @override
  int? get localId => dbNotificationPopulated.dbNotification.id;

  @override
  String get remoteId => dbNotificationPopulated.dbNotification.remoteId;

  @override
  String? get emoji => dbNotificationPopulated.dbNotification.emoji;

  @override

  @override
  UnifediApiNotificationType get typeAsUnifediApi =>
      type.toUnifediApiNotificationType();


  @override
  String get type => dbNotificationPopulated.dbNotification.type;

  @override
  IStatus? get status =>
      dbNotificationPopulated.dbStatusPopulated?.toDbStatusPopulatedWrapper();

  @override
  bool get unread => dbNotificationPopulated.dbNotification.unread == true;

  @override
  // ignore: long-parameter-list, code-metrics
  DbNotificationPopulatedWrapper copyWith({
    int? localId,
    String? remoteId,
    bool? unread,
    DateTime? createdAt,
    IStatus? status,
    IAccount? account,
    String? emoji,
    UnifediApiNotificationType? type,
    bool? dismissed,
  }) =>
      DbNotificationPopulatedWrapper(
        dbNotificationPopulated: DbNotificationPopulated(
          dbNotification: dbNotificationPopulated.dbNotification.copyWith(
            id: localId ?? this.localId,
            remoteId: remoteId ?? this.remoteId,
            unread: unread ?? this.unread,
            createdAt: createdAt ?? this.createdAt,
            type: type?.stringValue ?? this.type,
            emoji: emoji ?? this.emoji,
            dismissed: dismissed ?? this.dismissed,
          ),
          dbAccount:
              account?.toDbAccount() ?? dbNotificationPopulated.dbAccount,
          dbStatus: status?.toDbStatus() ??
              dbNotificationPopulated.dbStatusPopulated?.dbStatus,
          dbStatusAccount: status?.account.toDbAccount() ??
              dbNotificationPopulated.dbStatusPopulated?.dbAccount,
          reblogDbStatus: status?.reblog?.toDbStatus() ??
              dbNotificationPopulated.dbStatusPopulated?.reblogDbStatus,
          reblogDbStatusAccount: status?.reblog?.account.toDbAccount() ??
              dbNotificationPopulated.dbStatusPopulated?.reblogDbStatusAccount,
          replyDbStatus: status?.inReplyToStatus?.toDbStatus() ??
              dbNotificationPopulated.dbStatusPopulated?.replyDbStatus,
          replyDbStatusAccount: status?.inReplyToStatus?.account
                  .toDbAccount() ??
              dbNotificationPopulated.dbStatusPopulated?.replyDbStatusAccount,
          replyReblogDbStatus: status?.reblog?.inReplyToStatus?.toDbStatus() ??
              dbNotificationPopulated.dbStatusPopulated?.replyReblogDbStatus,
          replyReblogDbStatusAccount:
              status?.reblog?.inReplyToStatus?.account.toDbAccount() ??
                  dbNotificationPopulated
                      .dbStatusPopulated?.replyReblogDbStatusAccount,
        ),
      );

  @override
  String? get chatMessageRemoteId =>
      dbNotificationPopulated.dbNotification.chatMessageRemoteId;

  @override
  String? get chatRemoteId =>
      dbNotificationPopulated.dbNotification.chatRemoteId;

  @override
  String toString() {
    return 'DbNotificationPopulatedWrapper{'
        'dbNotificationPopulated: $dbNotificationPopulated'
        '}';
  }

  @override
  bool get dismissed =>
      dbNotificationPopulated.dbNotification.dismissed == true;

  @override
  IUnifediApiChatMessage? get chatMessage =>
      dbNotificationPopulated.dbNotification.chatMessage;

  @override
  IUnifediApiAccountReport? get report =>
      dbNotificationPopulated.dbNotification.report;

  @override
  IUnifediApiAccount? get target =>
      dbNotificationPopulated.dbNotification.target;

  @override
  int compareTo(INotification b) => compareItemsToSort(this, b);

  @override
  bool isEqualTo(INotification b) => isItemsEqual(this, b);

  int compareItemsToSort(INotification? a, INotification? b) {
    if (a == null && b == null) {
      return 0;
    } else if (a != null && b == null) {
      return 1;
    } else if (a == null && b != null) {
      return -1;
    } else {
      return a!.createdAt.compareTo(b!.createdAt);
    }
  }

  bool isItemsEqual(INotification a, INotification b) =>
      a.remoteId == b.remoteId;
}

class DbNotificationPopulated {
  final DbNotification dbNotification;
  final DbAccount? dbAccount;

  final DbStatus? dbStatus;
  final DbAccount? dbStatusAccount;
  final DbStatus? reblogDbStatus;
  final DbAccount? reblogDbStatusAccount;
  final DbStatus? replyDbStatus;
  final DbAccount? replyDbStatusAccount;
  final DbStatus? replyReblogDbStatus;
  final DbAccount? replyReblogDbStatusAccount;

  DbStatusPopulated? get dbStatusPopulated {
    if (dbStatus != null) {
      return DbStatusPopulated(
        dbStatus: dbStatus!,
        dbAccount: dbStatusAccount!,
        reblogDbStatus: reblogDbStatus,
        reblogDbStatusAccount: reblogDbStatusAccount,
        replyDbStatus: replyDbStatus,
        replyDbStatusAccount: replyDbStatusAccount,
        replyReblogDbStatus: replyReblogDbStatus,
        replyReblogDbStatusAccount: replyReblogDbStatusAccount,
      );
    } else {
      return null;
    }
  }

  DbNotificationPopulated({
    required this.dbNotification,
    required this.dbAccount,
    required this.dbStatus,
    required this.dbStatusAccount,
    required this.reblogDbStatus,
    required this.reblogDbStatusAccount,
    required this.replyDbStatus,
    required this.replyDbStatusAccount,
    required this.replyReblogDbStatus,
    required this.replyReblogDbStatusAccount,
  });

  DbNotificationPopulated.statusPopulated({
    required DbNotification dbNotification,
    required DbAccount dbAccount,
    required DbStatusPopulated? dbStatusPopulated,
  }) : this(
          dbNotification: dbNotification,
          dbAccount: dbAccount,
          dbStatus: dbStatusPopulated?.dbStatus,
          dbStatusAccount: dbStatusPopulated?.dbAccount,
          reblogDbStatus: dbStatusPopulated?.reblogDbStatus,
          reblogDbStatusAccount: dbStatusPopulated?.reblogDbStatusAccount,
          replyDbStatus: dbStatusPopulated?.replyDbStatus,
          replyDbStatusAccount: dbStatusPopulated?.replyDbStatusAccount,
          replyReblogDbStatus: dbStatusPopulated?.replyReblogDbStatus,
          replyReblogDbStatusAccount:
              dbStatusPopulated?.replyReblogDbStatusAccount,
        );

  @override
  String toString() {
    return 'DbNotificationPopulated{'
        'dbNotification: $dbNotification, '
        'dbAccount: $dbAccount, '
        'dbStatus: $dbStatus, '
        'dbStatusAccount: $dbStatusAccount, '
        'reblogDbStatus: $reblogDbStatus, '
        'reblogDbStatusAccount: $reblogDbStatusAccount, '
        'replyDbStatus: $replyDbStatus, '
        'replyDbStatusAccount: $replyDbStatusAccount, '
        'replyReblogDbStatus: $replyReblogDbStatus, '
        'replyReblogDbStatusAccount: $replyReblogDbStatusAccount'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbNotificationPopulated &&
          runtimeType == other.runtimeType &&
          dbNotification == other.dbNotification &&
          dbAccount == other.dbAccount &&
          dbStatus == other.dbStatus &&
          dbStatusAccount == other.dbStatusAccount &&
          reblogDbStatus == other.reblogDbStatus &&
          reblogDbStatusAccount == other.reblogDbStatusAccount &&
          replyDbStatus == other.replyDbStatus &&
          replyDbStatusAccount == other.replyDbStatusAccount &&
          replyReblogDbStatus == other.replyReblogDbStatus &&
          replyReblogDbStatusAccount == other.replyReblogDbStatusAccount;

  @override
  int get hashCode =>
      dbNotification.hashCode ^
      dbAccount.hashCode ^
      dbStatus.hashCode ^
      dbStatusAccount.hashCode ^
      reblogDbStatus.hashCode ^
      reblogDbStatusAccount.hashCode ^
      replyDbStatus.hashCode ^
      replyDbStatusAccount.hashCode ^
      replyReblogDbStatus.hashCode ^
      replyReblogDbStatusAccount.hashCode;
}

extension DbNotificationPopulatedExtension on DbNotificationPopulated {
  DbNotificationPopulatedWrapper toDbNotificationPopulatedWrapper() =>
      DbNotificationPopulatedWrapper(dbNotificationPopulated: this);
}
