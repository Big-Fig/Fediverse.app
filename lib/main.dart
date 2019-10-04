import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phaze/Pleroma/Models/ClientSettings.dart';
import './Pleroma/Foundation/CurrentInstance.dart';
import './Pages/AppContainerPage.dart';
import './Pages/TermsOfService.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import './Pleroma/Foundation/Client.dart';
import './Pleroma/Models/Account.dart';
import './Pleroma/Models/AccountAuth.dart';

void main() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(AccountAuthAdapter(), 33);
  Hive.registerAdapter(ClientAdapter(), 34);
  Hive.registerAdapter(AccountAdapter(), 35);
  Hive.registerAdapter(ClientSettingsAdapter(), 36);

  Hive.init(directory.path);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FirebaseAnalytics analytics = FirebaseAnalytics();

  final _currentInstance = CurrentInstance.instance;
  final _newInstance = CurrentInstance.newInstance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    config(context);
    print(_currentInstance);
    print(_newInstance);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Roma',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => AppContainerPage(),
        '/terms': (context) => TermsOfService(),
      },
    );
  }

  config(BuildContext context) {
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
    });
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  return Future<void>.value();
}
