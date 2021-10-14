import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service_background_message_impl.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/push_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('fcm_push_service_impl.dart');

class FcmPushService extends AsyncInitLoadingBloc implements IFcmPushService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  // ignore: close_sinks
  final BehaviorSubject<String> _deviceTokenSubject = BehaviorSubject();

  @override
  Stream<String> get deviceTokenStream => _deviceTokenSubject.stream;

  @override
  String? get deviceToken => _deviceTokenSubject.valueOrNull;

  // ignore: close_sinks
  final BehaviorSubject<PushMessage> _messageSubject = BehaviorSubject();

  @override
  Stream<PushMessage> get messageStream => _messageSubject.stream;

  FcmPushService() {
    _deviceTokenSubject.disposeWith(this);
    _messageSubject.disposeWith(this);
  }

  @override
  PushMessage? initialMessage;

  Future<PushMessage?> getInitialMessage() async {
    var initialRemoteMessage = await _fcm.getInitialMessage();

    if (initialRemoteMessage != null) {
      return _createPushMessage(
        message: initialRemoteMessage,
        type: PushMessageType.launch,
      );
    } else {
      return null;
    }
  }

  void _onNewToken(String newToken) {
    _logger.finest(() => 'newToken $newToken');
    _deviceTokenSubject.add(newToken);
  }

  void _onNewMessage(PushMessage cloudMessage) {
    _logger.finest(() => '_onNewMessage $cloudMessage');
    _messageSubject.add(cloudMessage);
  }

  Future _updateToken() async {
    var token = await _fcm.getToken();
    if (token != null) {
      _onNewToken(token);
    }
  }

  @override
  Future<bool> askPermissions() async {
    var settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  @override
  Future internalAsyncInit() async {
    _logger.finest(() => 'init');

    FirebaseMessaging.onBackgroundMessage(
      richNotificationsFirebaseMessagingBackgroundHandler,
    );

    _fcm.onTokenRefresh
        .listen(
          _onNewToken,
        )
        .disposeWith(this);

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        _onNewMessage(
          _createPushMessage(
            message: message,
            type: PushMessageType.launch,
          ),
        );
      },
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        _onNewMessage(
          _createPushMessage(
            message: message,
            type: PushMessageType.foreground,
          ),
        );
      },
    );

    await _fcm.setAutoInitEnabled(true);

    try {
      await _updateToken();
    } catch (e, stackTrace) {
      _logger.warning(
        () => 'failed to _updateToken on internalAsyncInit',
        e,
        stackTrace,
      );
    }

    initialMessage = await getInitialMessage();
  }

  PushMessage _createPushMessage({
    required RemoteMessage message,
    required PushMessageType type,
  }) {
    var data = message.data;
    var notification = message.notification;
    _logger.finest(
      () => '_createPushMessage \n'
          'type $type \n'
          'notification $notification \n'
          'data $data',
    );

    var pushMessage = PushMessage(
      typeString: type.toJsonValue(),
      notification: notification != null
          ? PushNotification(
              title: notification.title,
              body: notification.body,
            )
          : null,
      data: data,
    );

    return pushMessage;
  }

  @override
  void clearInitialMessage() {
    initialMessage = null;
  }
}
