import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationBloc implements Disposable {
  static INotificationBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<INotificationBloc>(context, listen: listen);
  INotification get notification;

  Stream<INotification> get notificationStream;

  IStatus get status;

  Stream<IStatus> get statusStream;

  String get remoteId;

  IAccount get account;

  Stream<IAccount> get accountStream;

  MastodonNotificationType get type;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;
}
