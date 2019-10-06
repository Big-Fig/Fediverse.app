
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';


class PushHelper {

PushHelper._privateConstructor();

static final PushHelper _instance =
      PushHelper._privateConstructor();
  static PushHelper get instance {
    return _instance;
  }

  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  


static config() {


    print("THIS IS HAPPENING");

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //   _showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        //  _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //  _navigateToItemDetail(message);
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });


    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print("Token");
      print(token);
      CurrentInstance.instance.currentClient.subscribeToPush(token);
    });
  }


}