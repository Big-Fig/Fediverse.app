import 'dart:io' show Platform;

import 'package:fedi/Notifications/PushNotification.dart';
import 'package:fedi/Pages/Push/relay/push_relay_service.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/push/pleroma_push_model.dart';
import 'package:fedi/Pleroma/push/pleroma_push_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class PushHelper {
  final IPleromaPushService pleromaPushService;
  final IPushRelayService pushRelayService;

  PushHelper({
    @required this.pleromaPushService,
    @required this.pushRelayService,
  });

  static PushHelper of(BuildContext context, {listen: true}) =>
      Provider.of<PushHelper>(context, listen: listen);

  Function swapAccount;
  Function onMessage;
  String notificationId;
  String notifcationType;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool fromResume = false;
  Function notificationUpdater;
  Function updateBadges;

  Future<dynamic> theOnMessage(Map<String, dynamic> message) async {
    debugPrint("onMessage: face $message");
    var pushNotification = _parsePushNotification(message);

    //  _navigateToItemDetail(message);
    String account = "${pushNotification.account}@${pushNotification.server}";
    print("NEW ACCOUNT ALERT $account");
    await InstanceStorage.addAccountAlert(
        account, pushNotification.notificationType);
    Vibration.vibrate();
    updateBadges();
    notificationUpdater();
    //   _showItemDialog(message);
  }

  config(BuildContext context) {
    print("CONFIGING");
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        debugPrint("onMessage: face $message");
        var pushNotification = _parsePushNotification(message);

        //  _navigateToItemDetail(message);
        String account =
            "${pushNotification.account}@${pushNotification.server}";
        print("NEW ACCOUNT ALERT $account");
        InstanceStorage.addAccountAlert(
                account, pushNotification.notificationType)
            .then((value) {
          Vibration.vibrate();
          updateBadges();
          notificationUpdater();
        });

        //   _showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch");
        print("$message");
        var pushNotification = _parsePushNotification(message);

        notificationId = pushNotification.notificationId.toString();
        notifcationType = pushNotification.notificationType;
        //  _navigateToItemDetail(message);
        String account =
            "${pushNotification.account}@https://${pushNotification.server}";
        print("SWAPPING ACCOUNT $account");
        InstanceStorage.setCurrentAccount(account).then((future) {
          swapAccount();
        }).catchError((error) {
          print(error);
        });
      },
      onResume: (Map<String, dynamic> message) async {
        var pushNotification = _parsePushNotification(message);
        //  _navigateToItemDetail(message);
        String account =
            "${pushNotification.account}@https://${pushNotification.server}";
        print("SWAPPING ACCOUNT $account");
        notificationId = pushNotification.notificationId.toString();
        notifcationType = pushNotification.notificationType;
        InstanceStorage.setCurrentAccount(account).then((future) {
          swapAccount();
        }).catchError((error) {
          print(error);
        });
      },
    );
  }

  unregister() {
    pleromaPushService.unsubscribe().then((success) {
      String account =
          "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";
      InstanceStorage.setAccountNotificationsSettings(account, null);
    });
  }

  register() {
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {});

    _firebaseMessaging.getToken().then((String fcmToken) {
      assert(fcmToken != null);
      print("Token");
      print(fcmToken);

      String account =
          "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";

      InstanceStorage.getAccountNotificationsSettings(account).then((settings) {
        if (settings == null) {
          // subscribe to all by default
          settings = PleromaPushSubscribeData(
              alerts: PleromaPushSettingsDataAlerts.defaultAllEnabled());
        }
        String account =
            "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";

        pleromaPushService
            .subscribe(
                endpointCallbackUrl:
                    pushRelayService.createPushRelayEndPointUrl(
                        account: CurrentInstance.instance.currentAccount.acct,
                        baseServerUrl:
                            CurrentInstance.instance.currentClient.baseURL,
                        fcmToken: fcmToken),
                data: settings)
            .then((success) {
          if (success) {
            InstanceStorage.setAccountNotificationsSettings(account, settings);
          }
        });
      });
    });
  }
}

PushNotification _parsePushNotification(Map<String, dynamic> message) {
  Map<String, dynamic> data;
  if (Platform.isAndroid) {
    data = message["data"];
  } else {
    data = message;
  }

  PushNotification pushNotification = PushNotification.fromJson(data);
  return pushNotification;
}

//

//
//Future<http.Response> subscribeToPush(String token) async {
//  var url = "$baseURL/api/v1/push/subscription";
//  var headers = {
//    HttpHeaders.authorizationHeader: "Bearer $accessToken",
//    "Accept": "application/json",
//    "Content-Type": "application/json",
//  };
//  String baseUrl = CurrentInstance.instance.currentClient.baseURL
//      .replaceAll("https://", "");
//  String endpoint =
//      "https://pushrelay3.your.org/push/$token?account=${CurrentInstance.instance.currentAccount.acct}&server=$baseUrl&device=iOS";
//  if (Platform.isAndroid) {
//    endpoint =
//    "https://pushrelay3.your.org/push/$token?account=${CurrentInstance.instance.currentAccount.acct}&server=$baseUrl";
//  } else {}
//  dynamic params = {
//    "data": {
//      "alerts": {
//        "favourite": true,
//        "follow": true,
//        "mention": true,
//        "reblog": true,
//      },
//    },
//    "subscription": {
//      "keys": {
//        "p256dh":
//        "BEpPCn0cfs3P0E0fY-gyOuahx5dW5N8quUowlrPyfXlMa6tABLqqcSpOpMnC1-o_UB_s4R8NQsqMLbASjnqSbqw=",
//        "auth": "T5bhIIyre5TDC1LyX4mFAQ==",
//      },
//      "endpoint": endpoint
//    }
//  };
//
//  var jsonData = json.encode(params);
//  print(jsonData);
//  try {
//    final response = await http.post(url,
//        headers: headers,
//        body: jsonData,
//        encoding: Encoding.getByName("utf-8"));
//    print(response.statusCode);
//    print(response.body);
//    return response;
//  } catch (e) {
//    print(e.toString());
//    return e;
//  }
//}
