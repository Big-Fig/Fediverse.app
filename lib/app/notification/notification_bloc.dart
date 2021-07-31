import 'package:fedi/app/account/account_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
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

  IPleromaApiChatMessage? get chatMessage;

  Stream<IPleromaApiChatMessage?> get chatMessageStream;

  String get remoteId;

  IAccount? get account;

  Stream<IAccount?> get accountStream;

  String get type;

  MastodonApiNotificationType get typeMastodon;

  PleromaApiNotificationType get typePleroma;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  bool get unread;

  Stream<bool> get unreadStream;

  NotificationState get state;

  Stream<NotificationState> get stateStream;

  Future dismiss();

  Future markAsRead();
}
