import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:flutter/widgets.dart';

abstract class INotification {
  int get localId;

  String get remoteId;

  DateTime get createdAt;

  IStatus get status;

  IAccount get account;

  MastodonNotificationType get type;
}

class DbNotificationPopulatedWrapper implements INotification {
  final DbNotificationPopulated dbNotificationPopulated;

  DbNotificationPopulatedWrapper(this.dbNotificationPopulated);

  @override
  IAccount get account => DbAccountWrapper(dbNotificationPopulated.account);

  @override
  DateTime get createdAt => dbNotificationPopulated.notification.createdAt;

  @override
  int get localId => dbNotificationPopulated.notification.id;

  @override
  String get remoteId => dbNotificationPopulated.notification.remoteId;

  @override
  MastodonNotificationType get type =>
      dbNotificationPopulated.notification.type;

  @override
  IStatus get status =>
      DbStatusPopulatedWrapper(dbNotificationPopulated.statusPopulated);
}

class DbNotificationPopulated {
  final DbNotification notification;
  final DbAccount account;
  final DbStatusPopulated statusPopulated;

  DbNotificationPopulated(
      {@required this.notification,
      @required this.account,
      @required this.statusPopulated});

  @override
  String toString() {
    return 'DbNotificationPopulated{notification: $notification,'
        ' account: $account, statusPopulated: $statusPopulated}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbNotificationPopulated &&
          runtimeType == other.runtimeType &&
          notification == other.notification &&
          account == other.account &&
          statusPopulated == other.statusPopulated;
  @override
  int get hashCode =>
      notification.hashCode ^ account.hashCode ^ statusPopulated.hashCode;
}
