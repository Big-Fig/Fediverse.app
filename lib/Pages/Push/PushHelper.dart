import 'dart:io' show Platform;

import 'package:fedi/Notifications/PushNotification.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class PushHelper {

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

        notificationId =
            pushNotification.notificationId.toString();
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
        notificationId =
            pushNotification.notificationId.toString();
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
    CurrentInstance.instance.currentClient.unsubscribeToPush();
  }

  register() {
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {});

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print("Token");
      print(token);

      String account =
          "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";

      InstanceStorage.getAccountSubscribedToNotifications(account)
          .then((subbed) {
        if (subbed == false) {
          CurrentInstance.instance.currentClient
              .subscribeToPush(token)
              .then((_) {
            String account =
                "${CurrentInstance.instance.currentAccount.acct}@${CurrentInstance.instance.currentClient.baseURL}";

            InstanceStorage.addAccountSubscribedToNotifications(account, true);
          });
        }
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
