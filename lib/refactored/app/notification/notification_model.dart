import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/widgets.dart';

abstract class INotification {
  int get localId;

  String get remoteId;

  bool get unread;

  DateTime get createdAt;

  IStatus get status;

  IAccount get account;

  String get type;
  PleromaNotificationType get typePleroma;
  MastodonNotificationType get typeMastodon;

  INotification copyWith(
      {int localId,
      String remoteId,
      bool unread,
      DateTime createdAt,
      IStatus status,
      IAccount account,
      MastodonNotificationType type});
}

class DbNotificationPopulatedWrapper implements INotification {
  final DbNotificationPopulated dbNotificationPopulated;

  DbNotificationPopulatedWrapper(this.dbNotificationPopulated);

  @override
  IAccount get account => DbAccountWrapper(dbNotificationPopulated.dbAccount);

  @override
  DateTime get createdAt => dbNotificationPopulated.dbNotification.createdAt;

  @override
  int get localId => dbNotificationPopulated.dbNotification.id;

  @override
  String get remoteId => dbNotificationPopulated.dbNotification.remoteId;

  @override
  MastodonNotificationType get typeMastodon => mastodonNotificationTypeValues
      .map[type];

  @override
  PleromaNotificationType get typePleroma => pleromaNotificationTypeValues
      .map[type];

  @override
  String get type =>
      dbNotificationPopulated.dbNotification.type;

  @override
  IStatus get status => dbNotificationPopulated.dbStatusPopulated != null
      ? DbStatusPopulatedWrapper(dbNotificationPopulated.dbStatusPopulated)
      : null;

  @override
  bool get unread => dbNotificationPopulated.dbNotification.unread == true;

  @override
  DbNotificationPopulatedWrapper copyWith(
          {int localId,
          String remoteId,
          bool unread,
          DateTime createdAt,
          IStatus status,
          IAccount account,
          MastodonNotificationType type}) =>
      DbNotificationPopulatedWrapper(DbNotificationPopulated(
          dbNotification: dbNotificationPopulated.dbNotification.copyWith(
            id: localId ?? this.localId,
            remoteId: remoteId ?? this.remoteId,
            unread: unread ?? this.unread,
            createdAt: createdAt ?? this.createdAt,
            type: type ?? this.type,
          ),
          dbAccount: dbAccountFromAccount(account) ??
              dbNotificationPopulated.dbAccount,
          dbStatusPopulated: dbNotificationPopulated.dbStatusPopulated.copyWith(
              status: dbStatusFromStatus(status) ??
                  dbNotificationPopulated.dbStatusPopulated.dbStatus,
              account: dbAccountFromAccount(status?.account) ??
                  dbNotificationPopulated.dbStatusPopulated.dbAccount,
              reblogDbStatus: dbStatusFromStatus(status?.reblog) ??
                  dbNotificationPopulated.dbStatusPopulated.reblogDbStatus,
              reblogDbStatusAccount:
                  dbAccountFromAccount(status?.reblog?.account) ??
                      dbNotificationPopulated
                          .dbStatusPopulated.reblogDbStatusAccount)));
}

class DbNotificationPopulated {
  final DbNotification dbNotification;
  final DbAccount dbAccount;
  final DbStatusPopulated dbStatusPopulated;

  DbNotificationPopulated(
      {@required this.dbNotification,
      @required this.dbAccount,
      @required this.dbStatusPopulated});

  @override
  String toString() {
    return 'DbNotificationPopulated{dbNotification: $dbNotification,'
        ' dbAccount: $dbAccount, dbStatusPopulated: $dbStatusPopulated}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbNotificationPopulated &&
          runtimeType == other.runtimeType &&
          dbNotification == other.dbNotification &&
          dbAccount == other.dbAccount &&
          dbStatusPopulated == other.dbStatusPopulated;

  @override
  int get hashCode =>
      dbNotification.hashCode ^ dbAccount.hashCode ^ dbStatusPopulated.hashCode;
}
