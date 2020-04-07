import 'dart:io';

import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/push/fcm/fcm_push_service.dart';
import 'package:fedi/refactored/push/push_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("fcm_push_service_impl.dart");

final String _iosCloudMessageNotificationKey = "notification";

class FcmPushService extends AsyncInitLoadingBloc implements IFcmPushService {
  final FirebaseMessaging _fcm;

  // ignore: close_sinks
  final BehaviorSubject<String> _deviceTokenSubject = BehaviorSubject();

  Stream<String> get deviceTokenStream => _deviceTokenSubject.stream;

  String get deviceToken => _deviceTokenSubject.value;

  // ignore: close_sinks
  final BehaviorSubject<PushMessage> _messageSubject = BehaviorSubject();

  Stream<PushMessage> get messageStream => _messageSubject.stream;

  FcmPushService() : _fcm = FirebaseMessaging() {
    addDisposable(subject: _deviceTokenSubject);
    addDisposable(subject: _messageSubject);

    performAsyncInit();
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

  askPermissions() async {
    _fcm.requestNotificationPermissions(IosNotificationSettings());
  }

  @override
  Future internalAsyncInit() async {
    _logger.finest(() => "init");

    _logger.finest(() => "configure");
    addDisposable(streamSubscription: _fcm.onTokenRefresh.listen((newToken) {
      _onNewToken(newToken);
    }));

    _fcm.configure(
        onMessage: (data) async =>
            _onNewMessage(parseCloudMessage(PushMessageType.foreground, data)),
        onLaunch: (data) async =>
            _onNewMessage(parseCloudMessage(PushMessageType.launch, data)),
        onResume: (data) async =>
            _onNewMessage(parseCloudMessage(PushMessageType.resume, data)));

    _fcm.setAutoInitEnabled(true);

    await _updateToken();
  }
}

PushMessage parseCloudMessage(
    PushMessageType cloudMessageType, Map<String, dynamic> data) {
  _logger.finest(() => "parseCloudMessage before remap $data");

  data = _remapToStringObjectMap(data);
  _logger.finest(() => "parseCloudMessage after remap $data");
  if (Platform.isAndroid) {
    return _parsePushMessageOnAndroid(cloudMessageType, data);
  } else if (Platform.isIOS) {
    return _parsePushMessageOnIos(cloudMessageType, data);
  } else {
    throw "Invalid platform ${Platform.operatingSystem}";
  }
}

// Json serialization accepts Map<String, dynamic>
// but we have Map<dynamic, dynamic> originally
Map<String, dynamic> _remapForJson(raw) => (raw as Map)
    ?.map((key, value) => MapEntry<String, dynamic>(key.toString(), value));

Map<String, dynamic> _remapToStringObjectMap(Map<String, dynamic> data) {
  return data.map((key, value) => MapEntry(key.toString(), value));
}

PushMessage _parsePushMessageOnIos(
    PushMessageType cloudMessageType, Map<String, dynamic> data) {
  // ios notification always have own format

  _logger.finest(() => "_parseChatCloudMessageOnIos $data");

  var messageNotification =
      _remapForJson(data[_iosCloudMessageNotificationKey]);

  _logger.finest(() =>
      "_parseChatCloudMessageOnIos  messageNotification $messageNotification");

  var messageData = _remapForJson(data);
  _logger.finest(() => "_parseChatCloudMessageOnIos  messageData $messageData");
  return PushMessage(
      cloudMessageType,
      messageNotification?.isNotEmpty == true
          ? PushNotification.fromJson(messageNotification)
          : null,
      messageData ?? {});
}

PushMessage _parsePushMessageOnAndroid(
    PushMessageType cloudMessageType, Map<String, dynamic> data) {
  return PushMessage(
      cloudMessageType,
      data?.isNotEmpty == true ? PushNotification.fromJson(data) : null,
      data ?? {});
}
