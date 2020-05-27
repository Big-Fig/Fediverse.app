import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/widgets.dart';

abstract class INotification {
  int get localId;

  String get remoteId;

  bool get unread;

  DateTime get createdAt;

  IStatus get status;

  IAccount get account;

  String get chatMessageRemoteId;

  String get chatRemoteId;

  String get type;

  PleromaNotificationType get typePleroma;

  MastodonNotificationType get typeMastodon;

  String get emoji;

  PleromaNotificationPleromaPart get pleroma;

  INotification copyWith(
      {int localId,
      String remoteId,
      bool unread,
      DateTime createdAt,
      IStatus status,
      String emoji,
      PleromaNotificationPleromaPart pleroma,
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
  String get emoji => dbNotificationPopulated.dbNotification.emoji;

  @override
  PleromaNotificationPleromaPart get pleroma =>
      dbNotificationPopulated.dbNotification.pleroma;

  @override
  MastodonNotificationType get typeMastodon =>
      mastodonNotificationTypeValues.map[type];

  @override
  PleromaNotificationType get typePleroma {
    if (pleromaNotificationTypeValues.map.containsKey(type)) {
      return pleromaNotificationTypeValues.map[type];
    } else {
      return PleromaNotificationType.unknown;
    }
  }

  @override
  String get type => dbNotificationPopulated.dbNotification.type;

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
          String emoji,
          PleromaNotificationPleromaPart pleroma,
          MastodonNotificationType type}) =>
      DbNotificationPopulatedWrapper(DbNotificationPopulated(
          dbNotification: dbNotificationPopulated.dbNotification.copyWith(
            id: localId ?? this.localId,
            remoteId: remoteId ?? this.remoteId,
            unread: unread ?? this.unread,
            createdAt: createdAt ?? this.createdAt,
            type: type ?? this.type,
            pleroma: pleroma ?? this.pleroma,
            emoji: emoji ?? this.emoji,
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

  @override
  String get chatMessageRemoteId =>
      dbNotificationPopulated.dbNotification.chatMessageRemoteId;

  @override
  String get chatRemoteId =>
      dbNotificationPopulated.dbNotification.chatRemoteId;
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
