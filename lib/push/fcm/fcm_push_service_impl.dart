import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/push_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("fcm_push_service_impl.dart");

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class FcmPushService extends AsyncInitLoadingBloc implements IFcmPushService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  // ignore: close_sinks
  final BehaviorSubject<String> _deviceTokenSubject = BehaviorSubject();

  @override
  Stream<String> get deviceTokenStream => _deviceTokenSubject.stream;

  @override
  String? get deviceToken => _deviceTokenSubject.value;

  // ignore: close_sinks
  final BehaviorSubject<PushMessage> _messageSubject = BehaviorSubject();

  @override
  Stream<PushMessage> get messageStream => _messageSubject.stream;

  FcmPushService() {
    addDisposable(subject: _deviceTokenSubject);
    addDisposable(subject: _messageSubject);
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
    _logger.finest(() => "newToken $newToken");
    _deviceTokenSubject.add(newToken);
  }

  void _onNewMessage(PushMessage cloudMessage) {
    _logger.finest(() => "_onNewMessage $cloudMessage");
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
    NotificationSettings settings = await _fcm.requestPermission(
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
    _logger.finest(() => "init");

    _logger.finest(() => "configure");
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    addDisposable(
      streamSubscription: _fcm.onTokenRefresh.listen(
        (newToken) {
          _onNewToken(newToken);
        },
      ),
    );

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
        () => "failed to _updateToken on internalAsyncInit",
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
    Map<String, dynamic> data = message.data;
    RemoteNotification? notification = message.notification;
    _logger.finest(() => "_createPushMessage \n"
        "type $type \n"
        "notification $notification \n"
        "data $data");

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
