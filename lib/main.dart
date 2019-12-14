import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pleroma/Models/ClientSettings.dart';
import './Pleroma/Foundation/CurrentInstance.dart';
import './Pages/AppContainerPage.dart';
import './Pages/TermsOfService.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import './Pleroma/Foundation/Client.dart';
import './Pleroma/Models/Account.dart';
import './Pleroma/Models/AccountAuth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(AccountAuthAdapter(), 33);
  Hive.registerAdapter(ClientAdapter(), 34);
  Hive.registerAdapter(AccountAdapter(), 35);
  Hive.registerAdapter(ClientSettingsAdapter(), 36);

  Hive.init(directory.path);

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final _currentInstance = CurrentInstance.instance;
  final _newInstance = CurrentInstance.newInstance;
  final push = PushHelper.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    print(_currentInstance);
    print(_newInstance);
    PushHelper.instance.config(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FirebaseAnalytics analytics = FirebaseAnalytics();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fedi',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => AppContainerPage(),
        '/terms': (context) => TermsOfService(),
      },
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  return Future<void>.value();
}
