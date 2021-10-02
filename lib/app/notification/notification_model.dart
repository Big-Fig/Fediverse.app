import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'notification_model.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    required bool? dismissed,
    required bool? unread,
  }) = _NotificationState;

  static NotificationState only({
    bool? dismissed,
    bool? unread,
  }) =>
      NotificationState(
        dismissed: dismissed,
        unread: unread,
      );
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

@freezed
class DbNotificationPopulatedWrapper
    with _$DbNotificationPopulatedWrapper
    implements INotification {
  const DbNotificationPopulatedWrapper._();

  const factory DbNotificationPopulatedWrapper({
    required DbNotificationPopulated dbNotificationPopulated,
  }) = _DbNotificationPopulatedWrapper;

  @override
  bool get isContainsChat => chatRemoteId != null;

  @override
  bool get isContainsStatus => status != null;

  @override
  bool get isContainsAccount => account != null;

  @override
  bool get isContainsTargetAccount => target != null;

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
  String? get chatMessageRemoteId =>
      dbNotificationPopulated.dbNotification.chatMessageRemoteId;

  @override
  String? get chatRemoteId =>
      dbNotificationPopulated.dbNotification.chatRemoteId;

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

@freezed
class DbNotificationPopulated with _$DbNotificationPopulated {
  const DbNotificationPopulated._();
  const factory DbNotificationPopulated({
    required DbNotification dbNotification,
    required DbAccount? dbAccount,
    required DbStatus? dbStatus,
    required DbAccount? dbStatusAccount,
    required DbStatus? reblogDbStatus,
    required DbAccount? reblogDbStatusAccount,
    required DbStatus? replyDbStatus,
    required DbAccount? replyDbStatusAccount,
    required DbStatus? replyReblogDbStatus,
    required DbAccount? replyReblogDbStatusAccount,
  }) = _DbNotificationPopulated;

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

  static DbNotificationPopulated statusPopulated({
    required DbNotification dbNotification,
    required DbAccount dbAccount,
    required DbStatusPopulated? dbStatusPopulated,
  }) =>
      DbNotificationPopulated(
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
}

extension DbNotificationPopulatedExtension on DbNotificationPopulated {
  DbNotificationPopulatedWrapper toDbNotificationPopulatedWrapper() =>
      DbNotificationPopulatedWrapper(dbNotificationPopulated: this);
}
