
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:phaze/Notifications/PushNotification.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/InstanceStorage.dart';


class PushHelper {

PushHelper._privateConstructor();

static final PushHelper _instance =
      PushHelper._privateConstructor();
  static PushHelper get instance {
    return _instance;
  }

  Function swapAccount;
  
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool fromResume = false;
 Function notificationUpdater;

config(BuildContext context, Function swap) {
    PushHelper.instance.swapAccount = swap;
    PushHelper.instance._firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: face $message");
        var data = message['data'];
        print("data: $data");
        PushHelper.instance.notificationUpdater();
        //   _showItemDialog(message);

      },
      onLaunch: (Map<String, dynamic> data) async {
        
        
        //   var d = data["data"];
        // String acc = d['account'];
        // String server = d['server'];
        // var id = d['notification_id'];
        // String type = d["notification_type"];
        // print("onLaunch: $d");
        // //  _navigateToItemDetail(message);
        // String account = "$acc@https://$server";
        // print("SWAPPING ACCOUNT $account");
        // InstanceStorage.setCurrentAccount(
        //                               account)
        //                           .then((future) {
        //                              CurrentInstance.instance.notificationId = type;
        //                         swapAccount();
        //                       }).catchError((error){
        //                         print(error);
        //                       });

      },
      onResume: (Map<String, dynamic> data) async {
        var d = data["data"];
        String acc = d['account'];
        String server = d['server'];
        var id = d['notification_id'];
        print("onResume: $d");
        String type = d["notification_type"];
        //  _navigateToItemDetail(message);
        String account = "$acc@https://$server";
        print("SWAPPING ACCOUNT $account");
        InstanceStorage.setCurrentAccount(
                                      account)
                                  .then((future) {
                                    CurrentInstance.instance.notificationId = type;
                                swapAccount();
                              }).catchError((error){
                                print(error);
                              });

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