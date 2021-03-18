import 'dart:io';

import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/push_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("fcm_push_service_impl.dart");

final String _notificationKey = "notification";
final String _dataKey = "data";

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
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
        Map<String, dynamic> data = message.data;
        RemoteNotification? notification = message.notification;

        _onNewMessage(
          PushMessage(
            typeString: PushMessageType.launch.toJsonValue(),
            notification: notification != null
                ? PushNotification(
                    title: notification.title,
                    body: notification.body,
                  )
                : null,
            data: data,
          ),
        );
      },
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        Map<String, dynamic> data = message.data;
        RemoteNotification? notification = message.notification;

        _onNewMessage(
          PushMessage(
            typeString: PushMessageType.foreground.toJsonValue(),
            notification: notification != null
                ? PushNotification(
                    title: notification.title,
                    body: notification.body,
                  )
                : null,
            data: data,
          ),
        );
      },
    );


    await _fcm.setAutoInitEnabled(true);

    await _updateToken();
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print("myBackgroundMessageHandler $message");
}

PushMessage parseCloudMessage(
    PushMessageType cloudMessageType, Map<String, dynamic> data) {
  _logger.finest(() => "parseCloudMessage before remap $data");

  data = _remapToStringObjectMap(data);
  _logger.finest(() => "parseCloudMessage after remap $data");
  PushMessage parsed;
  if (Platform.isAndroid) {
    parsed = _parsePushMessageOnAndroid(cloudMessageType, data);
  } else if (Platform.isIOS) {
    parsed = _parsePushMessageOnIos(cloudMessageType, data);
  } else {
    throw "Invalid platform ${Platform.operatingSystem}";
  }

  return parsed;
}

// Json serialization accepts Map<String, dynamic>
// but we have Map<dynamic, dynamic> originally
Map<String, dynamic>? _remapForJson(raw) => (raw as Map?)
    ?.map((key, value) => MapEntry<String, dynamic>(key.toString(), value));

Map<String, dynamic> _remapToStringObjectMap(Map data) {
  var remappedData = <String, dynamic>{};

  data.entries.forEach((entry) {
    var remappedValue = entry.value;
    if (entry.value is Map) {
      remappedValue = _remapToStringObjectMap(entry.value);
    }
    remappedData[entry.key.toString()] = remappedValue;
  });

  return remappedData;
}

PushMessage _parsePushMessageOnIos(
    PushMessageType pushMessageType, Map<String, dynamic> data) {
  // ios notification always have own format

  _logger.finest(() => "_parseChatCloudMessageOnIos $data");

  var messageNotification = _remapForJson(data[_notificationKey]);

  _logger.finest(() =>
      "_parseChatCloudMessageOnIos  messageNotification $messageNotification");

  var messageData = _remapForJson(data);
  _logger.finest(() => "_parseChatCloudMessageOnIos  messageData $messageData");
  return PushMessage(
    notification:
        data.isNotEmpty == true ? PushNotification.fromJson(data) : null,
    data: data,
    typeString: pushMessageType.toJsonValue(),
  );
}

PushMessage _parsePushMessageOnAndroid(
    PushMessageType pushMessageType, Map<String, dynamic> rawData) {
  _logger.finest(() => "_parsePushMessageOnAndroid rawData $rawData");
  var dataJson = rawData.containsKey(_dataKey) ? rawData[_dataKey] : null;
  var notificationJson =
      rawData.containsKey(_notificationKey) ? rawData[_notificationKey] : null;

  _logger.finest(() => "_parsePushMessageOnAndroid \n"
      "\t dataJson $dataJson \n"
      "\t notificationJson $notificationJson");
  return PushMessage(
    notification: notificationJson != null
        ? PushNotification.fromJson(notificationJson)
        : null,
    data: dataJson,
    typeString: pushMessageType.toJsonValue(),
  );
}
