import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/notification/notification_bloc.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("notification_bloc_impl.dart");

class NotificationBloc extends DisposableOwner implements INotificationBloc {
  @override
  INotification get notification => _notificationSubject.value;

  @override
  Stream<INotification> get notificationStream =>
      _notificationSubject.stream.distinct();

  static NotificationBloc createFromContext(
          BuildContext context, INotification notification,
          {bool needWatchLocalRepositoryForUpdates = true}) =>
      NotificationBloc(
        pleromaNotificationService:
            IPleromaNotificationService.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        notification: notification,
        needRefreshFromNetworkOnInit: false,
        needWatchLocalRepositoryForUpdates: needWatchLocalRepositoryForUpdates,
      );

  final BehaviorSubject<INotification> _notificationSubject;

  final IPleromaNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;

  NotificationBloc({
    @required this.pleromaNotificationService,
    @required this.notificationRepository,
    @required INotification notification,
    @required bool needRefreshFromNetworkOnInit,
    @required bool needWatchLocalRepositoryForUpdates,
  }) : _notificationSubject = BehaviorSubject.seeded(notification) {
    addDisposable(subject: _notificationSubject);

    assert(needRefreshFromNetworkOnInit != null);
    assert(needWatchLocalRepositoryForUpdates != null);
    Future.delayed(Duration(seconds: 1), () {
      if (!disposed) {
        if (needWatchLocalRepositoryForUpdates) {
          addDisposable(
              streamSubscription: notificationRepository
                  .watchByRemoteId(notification.remoteId)
                  .listen((updatedNotification) {
            if (updatedNotification != null) {
              _notificationSubject.add(updatedNotification);
            }
          }));
        }
        if (needRefreshFromNetworkOnInit) {
          updateFromNetwork();
        }
      }
    });
  }

  @override
  IAccount get account => notification?.account;

  @override
  Stream<IAccount> get accountStream =>
      notificationStream.map((notification) => notification.account).distinct();

  @override
  IStatus get status => notification?.status;

  @override
  Stream<IStatus> get statusStream =>
      notificationStream.map((notification) => notification.status).distinct();

  @override
  DateTime get createdAt => notification?.createdAt;

  @override
  Stream<DateTime> get createdAtStream => notificationStream
      .map((notification) => notification?.createdAt)
      .distinct();


  Future updateFromNetwork() async {
    var remoteNotification = await pleromaNotificationService.getNotification(
        notificationRemoteId: remoteId);

    return _updateByRemoteNotification(remoteNotification);
  }

  Future _updateByRemoteNotification(IPleromaNotification remoteNotification) {
    return notificationRepository.updateLocalNotificationByRemoteNotification(
        oldLocalNotification: notification,
        newRemoteNotification: remoteNotification,
        unread: notification.unread);
  }

  @override
  void dispose() {
    super.dispose();

    _logger.finest(() => "dispose");
  }

  @override
  String get remoteId => notification.remoteId;

  @override
  MastodonNotificationType get type => notification.type;
}
