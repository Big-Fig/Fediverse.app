import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationBloc implements Disposable {
  static INotificationBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<INotificationBloc>(context, listen: listen);
  INotification get notification;

  Stream<INotification> get notificationStream;

  IStatus get status;

  Stream<IStatus> get statusStream;

  String get chatMessageRemoteId;

  Stream<String> get chatMessageRemoteIdStream;

  String get chatRemoteId;

  Stream<String> get chatRemoteIdStream;

  String get remoteId;

  IAccount get account;

  Stream<IAccount> get accountStream;

  String get type;

  MastodonNotificationType get typeMastodon;

  PleromaNotificationType get typePleroma;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;
}
