import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/analytics/analytics_service.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/context/current_auth_instance_context_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_model.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/from_scratch/from_scratch_join_auth_instance_page.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_page.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:fedi/app/context/app_context_bloc_impl.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_bloc_impl.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_page.dart';
import 'package:fedi/app/init/init_bloc.dart';
import 'package:fedi/app/init/init_bloc_impl.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi/app/package_info/package_info_helper.dart';
import 'package:fedi/app/push/fcm/fcm_push_permission_checker_widget.dart';
import 'package:fedi/app/splash/splash_page.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc_proxy_provider.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_proxy_provider.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/localization/localization_current_locale_local_preferences_bloc.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_handler_widget.dart';
import 'package:fedi/ui/theme/ui_theme_proxy_provider.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

var _logger = Logger("main.dart");

CurrentAuthInstanceContextBloc currentInstanceContextBloc;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // debugRepaintRainbowEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.

  await Firebase.initializeApp();

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  var appTitle = await FediPackageInfoHelper.getAppName();
  runNotInitializedSplashApp();

  IInitBloc initBloc = InitBloc();
  unawaited(initBloc.performAsyncInit());

  initBloc.initLoadingStateStream.listen((newState) async {
    _logger.fine(() => "appContextBloc.initLoadingStateStream.newState "
        "$newState");

    if (newState == AsyncInitLoadingState.finished) {
      var currentInstanceBloc =
          initBloc.appContextBloc.get<ICurrentAuthInstanceBloc>();

      currentInstanceBloc.currentInstanceStream
          .distinct(
              (previous, next) => previous?.userAtHost == next?.userAtHost)
          .listen((currentInstance) {
        runInitializedApp(
          appContextBloc: initBloc.appContextBloc,
          currentInstance: currentInstance,
          appTitle: appTitle,
        );
      });
    } else if (newState == AsyncInitLoadingState.failed) {
      runInitFailedApp();
    }
  });
}

void runNotInitializedSplashApp() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ),
  );
}

void runInitFailedApp() {
  runApp(
    MaterialApp(
      localizationsDelegates: [
        S.delegate,
      ],
      home: Scaffold(
        backgroundColor: lightFediUiTheme.colorTheme.primaryDark,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            // todo: localization
            child: Builder(
              builder: (context) => Text(
                S.of(context).app_init_fail,
                style: lightFediUiTheme.textTheme.mediumShortBoldWhite,
              ),
            ),
          ),
        ),
      ),
    ),
  );
  _logger.severe(() => "failed to init App");
}

void runInitializedSplashApp({
  @required AppContextBloc appContextBloc,
  @required String appTitle,
}) {
  runApp(
    appContextBloc.provideContextToChild(
      child: FediApp(
        appTitle: appTitle,
        child: Provider<IAppContextBloc>.value(
          value: appContextBloc,
          child: const SplashPage(),
        ),
      ),
    ),
  );
}

void runInitializedApp({
  @required AppContextBloc appContextBloc,
  @required AuthInstance currentInstance,
  @required String appTitle,
}) async {
  _logger.finest(() => "runInitializedApp $runInitializedApp");
  if (currentInstance != null) {
    await runInitializedCurrentInstanceApp(
      appContextBloc: appContextBloc,
      appTitle: appTitle,
      currentInstance: currentInstance,
    );
  } else {
    runInitializedLoginApp(appContextBloc, appTitle);
  }
}

Future runInitializedCurrentInstanceApp({
  @required AppContextBloc appContextBloc,
  @required String appTitle,
  @required AuthInstance currentInstance,
}) async {
  runInitializedSplashApp(
    appContextBloc: appContextBloc,
    appTitle: appTitle,
  );
  await currentInstanceContextBloc?.dispose();

  currentInstanceContextBloc = CurrentAuthInstanceContextBloc(
    currentInstance: currentInstance,
    preferencesService: appContextBloc.get(),
    connectionService: appContextBloc.get(),
    pushRelayService: appContextBloc.get(),
    pushHandlerBloc: appContextBloc.get(),
    fcmPushService: appContextBloc.get(),
    webSocketsService: appContextBloc.get(),
    localizationCurrentLocaleLocalPreferencesBloc: appContextBloc.get(),
  );
  await currentInstanceContextBloc.performAsyncInit();

  INotificationPushLoaderBloc pushLoaderBloc = currentInstanceContextBloc.get();

  _logger.finest(
      () => "buildCurrentInstanceApp CurrentInstanceContextLoadingPage");
  runApp(
    appContextBloc.provideContextToChild(
      child: currentInstanceContextBloc.provideContextToChild(
        child: DisposableProvider<ICurrentAuthInstanceContextInitBloc>(
          create: (context) => createCurrentInstanceContextBloc(
            context: context,
            pushLoaderBloc: pushLoaderBloc,
          ),
          child: FediApp(
            appTitle: appTitle,
            child: buildAuthInstanceContextInitWidget(
              pushLoaderBloc: pushLoaderBloc,
            ),
          ),
        ),
      ),
    ),
  );
}

CurrentAuthInstanceContextInitBloc createCurrentInstanceContextBloc({
  @required BuildContext context,
  @required INotificationPushLoaderBloc pushLoaderBloc,
}) {
  _logger.finest(() => "createCurrentInstanceContextBloc");
  var currentAuthInstanceContextLoadingBloc =
      CurrentAuthInstanceContextInitBloc(
    myAccountBloc: IMyAccountBloc.of(context, listen: false),
    pleromaInstanceService: IPleromaInstanceService.of(context, listen: false),
    currentAuthInstanceBloc:
        ICurrentAuthInstanceBloc.of(context, listen: false),
  );
  currentAuthInstanceContextLoadingBloc.performAsyncInit();

  currentAuthInstanceContextLoadingBloc.addDisposable(
      streamSubscription: currentAuthInstanceContextLoadingBloc.stateStream
          .distinct()
          .listen((state) {
    if (state ==
            CurrentAuthInstanceContextInitState
                .cantFetchAndLocalCacheNotExist ||
        state == CurrentAuthInstanceContextInitState.localCacheExist) {
      currentInstanceContextBloc.addDisposable(streamSubscription:
          pushLoaderBloc.launchOrResumePushLoaderNotificationStream
              .listen((launchOrResumePushLoaderNotification) {
        if (launchOrResumePushLoaderNotification != null) {
          Future.delayed(Duration(milliseconds: 100), () async {
            var notification =
                launchOrResumePushLoaderNotification.notification;
            if (notification.isContainsChat) {
              await navigatorKey.currentState.push(createPleromaChatPageRoute(
                  await currentInstanceContextBloc
                      .get<IPleromaChatRepository>()
                      .findByRemoteId(notification.chatRemoteId)));
            } else if (notification.isContainsStatus) {
              await navigatorKey.currentState.push(createStatusThreadPageRoute(
                status: notification.status,
                initialMediaAttachment: null,
              ));
            } else if (notification.isContainsAccount) {
              await navigatorKey.currentState
                  .push(createAccountDetailsPageRoute(notification.account));
            }
          });
        }
      }));
    }
  }));

  return currentAuthInstanceContextLoadingBloc;
}

Widget buildAuthInstanceContextInitWidget({
  @required INotificationPushLoaderBloc pushLoaderBloc,
}) =>
    CurrentAuthInstanceContextInitWidget(
      child: DisposableProvider<IHomeBloc>(
        create: (context) {
          var homeBloc = HomeBloc(
              startTab: calculateHomeTabForNotification(
                  pushLoaderBloc.launchOrResumePushLoaderNotification));

          homeBloc.addDisposable(streamSubscription: pushLoaderBloc
              .launchOrResumePushLoaderNotificationStream
              .listen((launchOrResumePushLoaderNotification) {
            homeBloc.selectTab(calculateHomeTabForNotification(
                launchOrResumePushLoaderNotification));
          }));
          return homeBloc;
        },
        child: FcmPushPermissionCheckerWidget(
          child: const HomePage(),
        ),
      ),
    );

void runInitializedLoginApp(AppContextBloc appContextBloc, String appTitle) {
  runApp(
    appContextBloc.provideContextToChild(
      child: DisposableProvider<IJoinAuthInstanceBloc>(
        create: (context) => JoinAuthInstanceBloc(isFromScratch: true),
        child: FediApp(
          appTitle: appTitle,
          child: const FromScratchJoinAuthInstancePage(),
        ),
      ),
    ),
  );
}

HomeTab calculateHomeTabForNotification(
    NotificationPushLoaderNotification launchOrResumePushLoaderNotification) {
  HomeTab homeTab;
  if (launchOrResumePushLoaderNotification != null) {
    var notification = launchOrResumePushLoaderNotification.notification;
    if (notification.isContainsChat) {
      homeTab = HomeTab.chat;
    } else if (notification.isContainsStatus) {
      homeTab = HomeTab.notifications;
    } else if (notification.isContainsAccount) {
      homeTab = HomeTab.notifications;
    }
  } else {
    homeTab = HomeTab.timelines;
  }
  return homeTab;
}

class FediApp extends StatelessWidget {
  final Widget child;
  final String appTitle;

  FediApp({
    @required this.child,
    @required this.appTitle,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    var currentFediUiThemeBloc =
        ICurrentFediUiThemeBloc.of(context, listen: false);

    var localizationCurrentLocaleLocalPreferencesBloc =
        ILocalizationCurrentLocaleLocalPreferencesBloc.of(context,
            listen: false);

    return UiThemeSystemBrightnessHandlerWidget(
      child: StreamBuilder<IFediUiTheme>(
          stream: currentFediUiThemeBloc.adaptiveBrightnessCurrentThemeStream,
          builder: (context, snapshot) {
            var currentTheme = snapshot.data;

            var themeMode = currentTheme == null
                ? ThemeMode.system
                : currentTheme == darkFediUiTheme
                    ? ThemeMode.dark
                    : ThemeMode.light;

            _logger.finest(() => "currentTheme $currentTheme "
                "themeMode $themeMode");
            return CurrentFediUiThemeBlocProxyProvider(
              child: OverlaySupport(
                child: provideCurrentTheme(
                  currentTheme: currentTheme ?? lightFediUiTheme,
                  child: StreamBuilder<LocalizationLocale>(
                      stream:
                          localizationCurrentLocaleLocalPreferencesBloc.stream,
                      builder: (context, snapshot) {
                        var localizationLocale = snapshot.data;

                        Locale locale;
                        if (localizationLocale != null) {
                          locale = Locale.fromSubtags(
                            languageCode: localizationLocale.languageCode,
                            countryCode: localizationLocale.countryCode,
                            scriptCode: localizationLocale.scriptCode,
                          );
                        }
                        _logger.finest(() => "locale $locale");
                        return MaterialApp(
                          // checkerboardRasterCacheImages: true,
                          // checkerboardOffscreenLayers: true,
                          debugShowCheckedModeBanner: false,
                          title: appTitle,
                          localizationsDelegates: [
                            S.delegate,
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                          ],
                          supportedLocales: S.delegate.supportedLocales,
                          locale: locale,
                          theme: lightFediUiTheme.themeData,
                          darkTheme: darkFediUiTheme.themeData,
                          themeMode: themeMode,
                          initialRoute: "/",
                          home: child,
                          navigatorKey: navigatorKey,
                          navigatorObservers: [
                            FirebaseAnalyticsObserver(
                                analytics:
                                    IAnalyticsService.of(context, listen: false)
                                        .firebaseAnalytics),
                          ],
                        );
                      }),
                ),
              ),
            );
          }),
    );
  }

  Widget provideCurrentTheme({
    @required Widget child,
    @required IFediUiTheme currentTheme,
  }) =>
      Provider<IFediUiTheme>.value(
        value: currentTheme,
        child: FediUiThemeProxyProvider(
          child: UiThemeProxyProvider(
            child: child,
            // child: UiThemeSystemBrightnessHandlerWidget(
            //   child: child,
            // ),
          ),
        ),
      );
}
