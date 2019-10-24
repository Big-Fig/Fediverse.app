import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phaze/Pages/Push/PushHelper.dart';
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
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  return Future<void>.value();
}
