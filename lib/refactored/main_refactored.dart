import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/my/my_account_model.dart';
import 'package:fedi/refactored/app/account/my/settings'
    '/my_account_settings_model'
    '.dart';
import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/current_auth_instance_context_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_auth_instance_context_loading_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_auth_instance_context_loading_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_auth_instance_context_loading_page.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/join/from_scratch/from_scratch_join_auth_instance_page.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:fedi/refactored/app/context/app_context_bloc_impl.dart';
import 'package:fedi/refactored/app/home/home_page.dart';
import 'package:fedi/refactored/app/push/handler/unhandled/push_handler_unhandled_local_preferences_model.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_model.dart';
import 'package:fedi/refactored/app/splash/app_splash_widget.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';

var _logger = Logger("main.dart");

FirebaseAnalytics analytics = FirebaseAnalytics();

void main() async {
  // todo: improve re-opening new database during account switch
  moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  WidgetsFlutterBinding.ensureInitialized();
  initLog();

  final directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(PleromaFieldAdapter(), 37);
  Hive.registerAdapter(PleromaEmojiAdapter(), 38);
  Hive.registerAdapter(PleromaMyAccountPleromaPartAdapter(), 40);
  Hive.registerAdapter(
      PleromaMyAccountPleromaPartNotificationsSettingsAdapter(), 41);
  Hive.registerAdapter(PleromaAccountRelationshipAdapter(), 42);
  Hive.registerAdapter(PleromaMyAccountSourceAdapter(), 43);
  Hive.registerAdapter(PleromaMyAccountSourcePleromaPartAdapter(), 44);
  Hive.registerAdapter(TimelineLocalPreferencesAdapter(), 46);
  Hive.registerAdapter(PushSubscriptionLocalPreferencesAdapter(), 47);

  Hive.registerAdapter(AuthInstanceListAdapter(), 49);
  Hive.registerAdapter(AuthInstanceAdapter(), 50);
  Hive.registerAdapter(PleromaOAuthTokenAdapter(), 51);
  Hive.registerAdapter(PleromaClientApplicationAdapter(), 52);
  Hive.registerAdapter(MyAccountRemoteWrapperAdapter(), 53);
  Hive.registerAdapter(PleromaMyAccountAdapter(), 54);
  Hive.registerAdapter(PushHandlerUnhandledListAdapter(), 55);
  Hive.registerAdapter(PleromaPushMessageAdapter(), 56);
  Hive.registerAdapter(MyAccountSettingsAdapter(), 57);

  Hive.init(directory.path);

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  AppContextBloc appContextBloc = AppContextBloc();

  showSplashPage(appContextBloc);

  appContextBloc.initLoadingStateStream.listen((newState) {
    _logger.fine(() => "appContextBloc.initLoadingStateStream.newState "
        "$newState");

    if (newState == AsyncInitLoadingState.finished) {
      var currentInstanceBloc = appContextBloc.get<ICurrentAuthInstanceBloc>();

      currentInstanceBloc.currentInstanceStream
          .distinct()
          .listen((currentInstance) {
        buildCurrentInstanceApp(appContextBloc, currentInstance);
      });
    }
  });
}

CurrentAuthInstanceContextBloc currentInstanceContextBloc;

void showSplashPage(AppContextBloc appContextBloc) {
  runApp(
      EasyLocalization(child: MyApp(child: (AppSplashWidget(appContextBloc)))));
}

void buildCurrentInstanceApp(
    AppContextBloc appContextBloc, AuthInstance currentInstance) async {
  _logger.finest(() => "buildCurrentInstanceApp $buildCurrentInstanceApp");
  if (currentInstance != null) {
    showSplashPage(appContextBloc);
    currentInstanceContextBloc?.dispose();

    currentInstanceContextBloc = CurrentAuthInstanceContextBloc(
        currentInstance: currentInstance,
        preferencesService: appContextBloc.get(),
        connectionService: appContextBloc.get(),
        pushRelayService: appContextBloc.get(),
        pushHandlerBloc: appContextBloc.get(),
        fcmPushService: appContextBloc.get(),
        webSocketsService: appContextBloc.get());
    await currentInstanceContextBloc.performAsyncInit();
    _logger.finest(
        () => "buildCurrentInstanceApp CurrentInstanceContextLoadingPage");
    runApp(EasyLocalization(
        child: appContextBloc.provideContextToChild(
            child: currentInstanceContextBloc.provideContextToChild(
                child:
                    DisposableProvider<ICurrentAuthInstanceContextLoadingBloc>(
                        create: (context) =>
                            CurrentAuthInstanceContextLoadingBloc(
                                myAccountBloc:
                                    IMyAccountBloc.of(context, listen: false)),
                        child: MyApp(
                            child: CurrentAuthInstanceContextLoadingPage(
                          child: const HomePage(),
                        )))))));
  } else {
    runApp(EasyLocalization(
        child: appContextBloc.provideContextToChild(
            child: DisposableProvider<IJoinAuthInstanceBloc>(
                create: (context) => JoinAuthInstanceBloc(),
                child: MyApp(child: FromScratchJoinAuthInstancePage())))));
  }
}

class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({@required this.child});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
          EasylocaLizationDelegate(
              locale: locale, path: "assets/langs/refactored")
        ],
        locale: savedLocale,
        supportedLocales: [Locale('en', 'US')],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        home: child,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
    return app;
  }
}

initLog() {
  if (kReleaseMode) {
    Logger.root.level = Level.OFF; // defaults to Level.INFO
  } else {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}(${record.loggerName}): ${record.time}: '
          '${record.message}');
      if (record.error != null) {
        print("\n${record.error}");
      }
      if (record.stackTrace != null) {
        print("\n${record.stackTrace}");
      }
    });
  }
}
