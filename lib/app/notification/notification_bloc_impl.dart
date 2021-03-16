import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:fedi/stream/stream_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("notification_bloc_impl.dart");

class NotificationBloc extends DisposableOwner implements INotificationBloc {
  @override
  INotification get notification => _notificationSubject.value!;

  @override
  Stream<INotification> get notificationStream =>
      _notificationSubject.stream.mapToNotNull().distinct();

  static NotificationBloc createFromContext(
    BuildContext context,
    INotification notification, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
  }) =>
      NotificationBloc(
        pleromaNotificationService: IPleromaNotificationService.of(
          context,
          listen: false,
        ),
        notificationRepository: INotificationRepository.of(
          context,
          listen: false,
        ),
        notification: notification,
        needRefreshFromNetworkOnInit: false,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
      );

  final BehaviorSubject<INotification> _notificationSubject;

  final IPleromaNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  NotificationBloc({
    required this.pleromaNotificationService,
    required this.notificationRepository,
    required INotification notification,
    bool needRefreshFromNetworkOnInit = false,
    this.isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  }) : _notificationSubject = BehaviorSubject.seeded(notification) {
    addDisposable(subject: _notificationSubject);

    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(
          notification,
          needRefreshFromNetworkOnInit,
        );
      });
    } else {
      _init(
        notification,
        needRefreshFromNetworkOnInit,
      );
    }
  }

  void _init(
    INotification notification,
    bool needRefreshFromNetworkOnInit,
  ) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
          streamSubscription: notificationRepository
              .watchByRemoteId(
            notification.remoteId,
          )
              .listen(
            (updatedNotification) {
              if (updatedNotification != null) {
                _notificationSubject.add(updatedNotification);
              }
            },
          ),
        );
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  @override
  IAccount? get account => notification.account;

  @override
  Stream<IAccount?> get accountStream => notificationStream
      .map(
        (notification) => notification.account,
      )
      .distinct();

  @override
  IStatus? get status => notification.status;

  @override
  Stream<IStatus?> get statusStream => notificationStream
      .map(
        (notification) => notification.status,
      )
      .distinct();

  @override
  String? get chatMessageRemoteId => notification.chatMessageRemoteId;

  @override
  Stream<String?> get chatMessageRemoteIdStream => notificationStream.map(
        (notification) => notification.chatMessageRemoteId,
      );

  @override
  String? get chatRemoteId => notification.chatRemoteId;

  @override
  Stream<String?> get chatRemoteIdStream =>
      notificationStream.map((notification) => notification.chatRemoteId);

  @override
  DateTime get createdAt => notification.createdAt;

  @override
  Stream<DateTime> get createdAtStream => notificationStream
      .map((notification) => notification.createdAt)
      .distinct();

  @override
  bool get unread => notification.unread == true;

  @override
  Stream<bool> get unreadStream => notificationStream
      .map(
        (notification) => notification.unread == true,
      )
      .distinct();

  Future refreshFromNetwork() async {
    var remoteNotification = await pleromaNotificationService.getNotification(
      notificationRemoteId: remoteId,
    );

    if (remoteNotification != null) {
      await _updateByRemoteNotification(remoteNotification);
    }
  }

  Future _updateByRemoteNotification(IPleromaNotification remoteNotification) {
    return notificationRepository.updateLocalNotificationByRemoteNotification(
      oldLocalNotification: notification,
      newRemoteNotification: remoteNotification,
      unread: notification.unread,
    );
  }

  @override
  Future dispose() {
    _logger.finest(() => "dispose");
    return super.dispose();
  }

  @override
  String get remoteId => notification.remoteId;

  @override
  String get type => notification.type;

  @override
  MastodonNotificationType get typeMastodon => notification.typeMastodon;

  @override
  PleromaNotificationType get typePleroma => notification.typePleroma;

  @override
  Future dismiss() async {
    await pleromaNotificationService.dismissNotification(
      notificationRemoteId: notification.remoteId,
    );

    await notificationRepository.dismiss(notification: notification);
  }

  @override
  Future markAsRead() async {
    await notificationRepository.markAsRead(notification: notification);
    if (pleromaNotificationService.isPleroma!) {
      unawaited(
        pleromaNotificationService.markAsReadSingle(
          notificationRemoteId: notification.remoteId,
        ),
      );
    }
  }

  @override
  bool get dismissed => notification.dismissed == true;

  @override
  Stream<bool?> get dismissedStream => notificationStream.map(
        (notification) => notification.dismissed == true,
      );

  @override
  NotificationState get state => NotificationState(
        dismissed: dismissed,
        unread: unread,
      );

  @override
  Stream<NotificationState> get stateStream => Rx.combineLatest2(
        dismissedStream,
        unreadStream,
        (dynamic dismissed, dynamic unread) => NotificationState(
          dismissed: dismissed,
          unread: unread,
        ),
      ).distinct();
}
