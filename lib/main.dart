import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/DeepLinks/DeepLinkHelper.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pleroma/Models/ClientSettings.dart';
import 'package:fedi/Pleroma/Models/Emoji.dart';
import 'package:fedi/Pleroma/Models/Field.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import './Pages/AppContainerPage.dart';
import './Pages/TermsOfService.dart';
import './Pleroma/Foundation/Client.dart';
import './Pleroma/Foundation/CurrentInstance.dart';
import './Pleroma/Models/Account.dart';
import './Pleroma/Models/AccountAuth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(AccountAuthAdapter(), 33);
  Hive.registerAdapter(ClientAdapter(), 34);
  Hive.registerAdapter(AccountAdapter(), 35);
  Hive.registerAdapter(ClientSettingsAdapter(), 36);
  Hive.registerAdapter(FieldAdapter(), 37);
  Hive.registerAdapter(EmojiAdapter(), 38);

  Hive.init(directory.path);

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(EasyLocalization(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final _currentInstance = CurrentInstance.instance;
  final _newInstance = CurrentInstance.newInstance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(_currentInstance);
    print(_newInstance);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FirebaseAnalytics analytics = FirebaseAnalytics();

    var localizationData = EasyLocalizationProvider.of(context).data;
    var savedLocale = localizationData.savedLocale;
    var locale = localizationData.locale;
    var app = EasyLocalizationProvider(
      data: localizationData,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fedi',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(locale: locale, path: "assets/langs")
        ],
        locale: savedLocale,
        supportedLocales: [Locale('en', 'US')],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          '/': (context) => AppContainerPage(),
          '/terms': (context) => TermsOfService(),
        },
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
    return provideGlobalContext(app);
  }

  Widget provideGlobalContext(Widget app) => Provider(
      create: (BuildContext context) => PushHelper(),
      child: Provider(
          create: (BuildContext context) => DeepLinkHelper(), child: app));
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  return Future<void>.value();
}
