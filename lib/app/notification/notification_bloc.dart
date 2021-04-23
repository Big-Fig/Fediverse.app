import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_chat_model.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/api/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationBloc implements IDisposable {
  static INotificationBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<INotificationBloc>(context, listen: listen);

  Stream<bool?> get dismissedStream;

  bool get dismissed;

  INotification get notification;

  Stream<INotification> get notificationStream;

  IStatus? get status;

  Stream<IStatus?> get statusStream;

  String? get chatMessageRemoteId;

  Stream<String?> get chatMessageRemoteIdStream;

  String? get chatRemoteId;

  Stream<String?> get chatRemoteIdStream;

  IPleromaChatMessage? get chatMessage;

  Stream<IPleromaChatMessage?> get chatMessageStream;

  String get remoteId;

  IAccount? get account;

  Stream<IAccount?> get accountStream;

  String get type;

  MastodonNotificationType get typeMastodon;

  PleromaNotificationType get typePleroma;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  bool get unread;

  Stream<bool> get unreadStream;

  NotificationState get state;

  Stream<NotificationState> get stateStream;

  Future dismiss();

  Future markAsRead();
}
