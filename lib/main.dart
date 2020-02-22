import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/Models/ClientSettings.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/field/pleroma_field_model.dart';
import 'package:fedi/Pleroma/relationship/pleroma_relationship_model.dart';
import 'package:fedi/Pleroma/source/pleroma_source_model.dart';
import 'package:fedi/app/context/app_context_bloc_impl.dart';
import 'package:fedi/app/splash/app_splash_widget.dart';
import 'package:fedi/async/loading/init/async_init_loading_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import './Pages/AppContainerPage.dart';
import './Pages/TermsOfService.dart';
import './Pleroma/Foundation/Client.dart';
import './Pleroma/Foundation/CurrentInstance.dart';
import './Pleroma/Models/AccountAuth.dart';

var _logger = Logger("main.dart");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLog();

  final directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(AccountAuthAdapter(), 33);
  Hive.registerAdapter(ClientAdapter(), 34);
  Hive.registerAdapter(PleromaAccountAdapter(), 35);
  Hive.registerAdapter(ClientSettingsAdapter(), 36);
  Hive.registerAdapter(PleromaFieldAdapter(), 37);
  Hive.registerAdapter(PleromaEmojiAdapter(), 38);
  Hive.registerAdapter(PleromaAccountPleromaPartAdapter(), 40);
  Hive.registerAdapter(
      PleromaAccountPleromaPartNotificationsSettingsAdapter(), 41);
  Hive.registerAdapter(PleromaRelationshipAdapter(), 42);
  Hive.registerAdapter(PleromaSourceAdapter(), 43);
  Hive.registerAdapter(PleromaSourcePleromaPartAdapter(), 44);
  Hive.registerAdapter(PleromaSourceAdapter(), 45);

  Hive.init(directory.path);

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  AppContextBloc appContextBloc = AppContextBloc();

  runApp(EasyLocalization(child: AppSplashWidget(appContextBloc)));

  appContextBloc.initLoadingStateStream.listen((newState) {
    _logger.fine(() => "appContextBloc.initLoadingStateStream.newState "
        "$newState");

    if (newState == AsyncInitLoadingState.finished) {
      runApp(EasyLocalization(child: MyApp(appContextBloc)));
    }
  });
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final _currentInstance = CurrentInstance.instance;
  final _newInstance = CurrentInstance.newInstance;

  final AppContextBloc appContextBloc;

  MyApp(this.appContextBloc);

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
    return appContextBloc.provideContextToChild(child: app);
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  return Future<void>.value();
}

initLog() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
