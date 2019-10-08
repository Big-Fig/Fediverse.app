
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:phaze/Notifications/PushNotification.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';


class PushHelper {

PushHelper._privateConstructor();

static final PushHelper _instance =
      PushHelper._privateConstructor();
  static PushHelper get instance {
    return _instance;
  }

  
  
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  
 Function notificationUpdater;

config(BuildContext context) {

    PushHelper.instance._firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: face $message");
        var data = message['data'];
        print("data: $data");
        PushHelper.instance.notificationUpdater();
        //   _showItemDialog(message);

      },
      onLaunch: (Map<String, dynamic> data) async {
        print("onLaunch: $data");
        PushNotification notification = PushNotification.fromJson(data["data"]);
        //  _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> data) async {
        print("onResume: $data");
        PushNotification notification = PushNotification.fromJson(data["data"]);
        //  _navigateToItemDetail(message);
      },
    );

    PushHelper.instance._firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
    });


    PushHelper.instance._firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print("Token");
      print(token);


      CurrentInstance.instance.currentClient.subscribeToPush(token);
    });
  }


}