import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/context/current_access_context_bloc_impl.dart';
import 'package:fedi_app/app/access/current/context/init/current_access_context_init_bloc.dart';
import 'package:fedi_app/app/access/current/context/init/current_access_context_init_bloc_impl.dart';
import 'package:fedi_app/app/access/current/context/init/current_access_context_init_model.dart';
import 'package:fedi_app/app/access/current/context/init/current_access_context_init_widget.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/join/from_scratch/from_scratch_join_access_page.dart';
import 'package:fedi_app/app/access/join/join_access_bloc.dart';
import 'package:fedi_app/app/access/join/join_access_bloc_impl.dart';
import 'package:fedi_app/app/access/join/join_access_bloc_proxy_provider.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/account/details/local_account_details_page.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_page.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/context/app_context_bloc.dart';
import 'package:fedi_app/app/crash_reporting/permission/checker/crash_reporting_permission_checker_widget.dart';
import 'package:fedi_app/app/home/home_bloc.dart';
import 'package:fedi_app/app/home/home_bloc_impl.dart';
import 'package:fedi_app/app/home/home_model.dart';
import 'package:fedi_app/app/home/home_page.dart';
import 'package:fedi_app/app/init/init_bloc.dart';
import 'package:fedi_app/app/init/init_bloc_impl.dart';
import 'package:fedi_app/app/instance/frontend_configurations/instance_frontend_configurations_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi_app/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi_app/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi_app/app/notification/repository/notification_repository.dart';
import 'package:fedi_app/app/push/permission/checker/push_permission_checker_widget.dart';
import 'package:fedi_app/app/share/income/action/income_share_action_chooser_dialog.dart';
import 'package:fedi_app/app/share/income/handler/income_share_handler_bloc.dart';
import 'package:fedi_app/app/share/income/handler/income_share_handler_bloc_impl.dart';
import 'package:fedi_app/app/share/income/handler/income_share_handler_model.dart';
import 'package:fedi_app/app/share/income/instance/income_share_instance_chooser_dialog.dart';
import 'package:fedi_app/app/splash/splash_page.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/thread/local_status_thread_page.dart';
import 'package:fedi_app/app/toast/handler/toast_handler_bloc.dart';
import 'package:fedi_app/app/toast/handler/toast_handler_bloc_impl.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/toast/toast_service_provider.dart';
import 'package:fedi_app/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi_app/app/ui/theme/dark/dark_fedi_ui_theme_model.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_proxy_provider.dart';
import 'package:fedi_app/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:fedi_app/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/in_app_review/checker/in_app_review_checker_widget.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:fedi_app/overlay_notification/overlay_notification_service_provider.dart';
import 'package:fedi_app/ui/theme/system/brightness/ui_theme_system_brightness_handler_widget.dart';
import 'package:fedi_app/ui/theme/ui_theme_proxy_provider.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('main.dart');

CurrentAccessContextBloc? currentInstanceContextBloc;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// ignore: long-method
Future<void> main() async {
  await launchApp();
}

Future<void> launchApp() async {
  // debugRepaintRainbowEnabled = true;
  // ignore: avoid-ignoring-return-values
  WidgetsFlutterBinding.ensureInitialized();

  runNotInitializedSplashApp();

  IInitBloc initBloc = InitBloc();
  initBloc
    // ignore: unawaited_futures
    ..performAsyncInit()
    ..initLoadingStateStream.listen(
      (newState) async {
        _logger.fine(
          () => 'appContextBloc.initLoadingStateStream.newState '
              '$newState',
        );

        if (newState == AsyncInitLoadingState.finished) {
          var currentInstanceBloc =
              initBloc.appContextBloc.get<ICurrentAccessBloc>();

          // we don't need to cancel this subscription
          // because it should always exist
          // ignore: avoid-ignoring-return-values
          currentInstanceBloc.currentInstanceStream
              .distinct(
            (previous, next) => previous?.userAtHost == next?.userAtHost,
          )
              .listen(
            (currentInstance) {
              runInitializedApp(
                appContextBloc: initBloc.appContextBloc,
                currentInstance: currentInstance,
              );
            },
          );
        } else if (newState == AsyncInitLoadingState.failed) {
          runInitFailedApp();
        }
      },
    );
}

void runNotInitializedSplashApp() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        displayVersionInfo: false,
      ),
    ),
  );
}

void runInitFailedApp() {
  _logger.severe(() => 'failed to init App');
  runApp(
    MaterialApp(
      localizationsDelegates: const [
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
}

void runInitializedSplashApp({
  required IAppContextBloc appContextBloc,
}) {
  runApp(
    appContextBloc.provideContextToChild(
      child: FediApp(
        instanceInitialized: false,
        child: Provider<IAppContextBloc>.value(
          value: appContextBloc,
          child: const SplashPage(
            displayVersionInfo: true,
          ),
        ),
      ),
    ),
  );
}

Future<void> runInitializedApp({
  required IAppContextBloc appContextBloc,
  required UnifediApiAccess? currentInstance,
}) async {
  _logger.finest(() => 'runInitializedApp $runInitializedApp');
  if (currentInstance != null) {
    await runInitializedCurrentInstanceApp(
      appContextBloc: appContextBloc,
      currentInstance: currentInstance,
    );
  } else {
    runInitializedLoginApp(appContextBloc);
  }
}

Future<void> runInitializedCurrentInstanceApp({
  required IAppContextBloc appContextBloc,
  required UnifediApiAccess currentInstance,
}) async {
  runInitializedSplashApp(
    appContextBloc: appContextBloc,
  );
  if (currentInstanceContextBloc != null) {
    await currentInstanceContextBloc!.dispose();
  }

  currentInstanceContextBloc = CurrentAccessContextBloc(
    currentInstance: currentInstance,
    appContextBloc: appContextBloc,
  );
  await currentInstanceContextBloc!.performAsyncInit();

  var configService = appContextBloc.get<IConfigService>();

  INotificationPushLoaderBloc? pushLoaderBloc;
  if (configService.pushFcmEnabled) {
    pushLoaderBloc =
        currentInstanceContextBloc!.get<INotificationPushLoaderBloc>();
  }

  _logger.finest(
    () => 'buildCurrentInstanceApp CurrentInstanceContextLoadingPage',
  );
  runApp(
    appContextBloc.provideContextToChild(
      child: currentInstanceContextBloc!.provideContextToChild(
        child: DisposableProvider<ICurrentAccessContextInitBloc>(
          lazy: false,
          create: (context) => createCurrentInstanceContextBloc(
            context: context,
            pushLoaderBloc: pushLoaderBloc,
          ),
          child: FediApp(
            instanceInitialized: true,
            child: buildUnifediApiAccessContextInitWidget(
              pushLoaderBloc: pushLoaderBloc,
            ),
          ),
        ),
      ),
    ),
  );
}

CurrentAccessContextInitBloc createCurrentInstanceContextBloc({
  required BuildContext context,
  required INotificationPushLoaderBloc? pushLoaderBloc,
}) {
  _logger.finest(() => 'createCurrentInstanceContextBloc');
  var currentUnifediApiAccessContextLoadingBloc =
      CurrentAccessContextInitBloc.createFromContext(context);
  // ignore: cascade_invocations
  currentUnifediApiAccessContextLoadingBloc.performAsyncInit();

  currentUnifediApiAccessContextLoadingBloc.stateStream.distinct().listen(
    (state) {
      var isLocalCacheExist = state ==
              CurrentAccessContextInitState.cantFetchAndLocalCacheNotExist ||
          state == CurrentAccessContextInitState.localCacheExist;
      if (isLocalCacheExist) {
        if (pushLoaderBloc != null) {
          pushLoaderBloc.launchPushLoaderNotificationStream.listen(
            (launchOrResumePushLoaderNotification) {
              if (launchOrResumePushLoaderNotification != null) {
                // ignore: no-magic-number
                const durationToWaitUntilHandleLaunchNotification =
                    Duration(milliseconds: 100);
                Future.delayed(
                  durationToWaitUntilHandleLaunchNotification,
                  () async {
                    await handleLaunchPushLoaderNotification(
                      launchOrResumePushLoaderNotification,
                    );
                  },
                );
              }
            },
          ).disposeWith(currentInstanceContextBloc!);
        }
      }
    },
  ).disposeWith(currentUnifediApiAccessContextLoadingBloc);

  return currentUnifediApiAccessContextLoadingBloc;
}

Future<void> handleLaunchPushLoaderNotification(
  NotificationPushLoaderNotification launchOrResumePushLoaderNotification,
) async {
  var notification = launchOrResumePushLoaderNotification.notification;
  if (notification.isContainsChat) {
    await navigatorKey.currentState!.push(
      createUnifediChatPageRoute(
        (await currentInstanceContextBloc!
            .get<IUnifediChatRepository>()
            .findByRemoteIdInAppType(
              notification.chatRemoteId!,
            ))!,
      ),
    );
  } else if (notification.isContainsStatus) {
    await navigatorKey.currentState!.push(
      createLocalStatusThreadPageRoute(
        status: notification.status!,
        initialMediaAttachment: null,
      ),
    );
  } else if (notification.isContainsTargetAccount) {
    await navigatorKey.currentState!.push(
      createLocalAccountDetailsPageRoute(
        notification.target!.toDbAccountWrapper(),
      ),
    );
  } else if (notification.isContainsAccount) {
    await navigatorKey.currentState!.push(
      createLocalAccountDetailsPageRoute(
        notification.account!,
      ),
    );
  }

  var notificationRepository =
      currentInstanceContextBloc!.get<INotificationRepository>();
  Future.delayed(
    const Duration(seconds: 1),
    () {
      notificationRepository.markAsRead(
        notification: notification,
      );
    },
  );
}

// ignore: avoid-returning-widgets
Widget buildUnifediApiAccessContextInitWidget({
  required INotificationPushLoaderBloc? pushLoaderBloc,
}) =>
    CurrentUnifediApiAccessContextInitWidget(
      child: DisposableProvider<IHomeBloc>(
        create: (context) {
          var homeBloc = HomeBloc(
            startTab: calculateHomeTabForNotification(
              pushLoaderBloc?.launchPushLoaderNotification,
            ),
            webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
              context,
              listen: false,
            ),
            statusRepository: IStatusRepository.of(
              context,
              listen: false,
            ),
          );

          if (pushLoaderBloc != null) {
            pushLoaderBloc.launchPushLoaderNotificationStream.listen(
              (launchOrResumePushLoaderNotification) {
                homeBloc.selectTab(
                  calculateHomeTabForNotification(
                    launchOrResumePushLoaderNotification,
                  ),
                );
              },
            ).disposeWith(homeBloc);
          }

          return homeBloc;
        },
        child: const PushPermissionCheckerWidget(
          child: CrashReportingPermissionCheckerWidget(
            child: InAppReviewCheckerWidget(
              child: HomePage(),
            ),
          ),
        ),
      ),
    );

void runInitializedLoginApp(IAppContextBloc appContextBloc) {
  runApp(
    appContextBloc.provideContextToChild(
      child: DisposableProvider<IJoinAccessBloc>(
        create: (context) => JoinAccessBloc(
          isFromScratch: true,
          configService: appContextBloc.get<IConfigService>(),
        ),
        child: const FediApp(
          instanceInitialized: false,
          child: JoinAccessBlocProxyProvider(
            child: FromScratchJoinAccessPage(),
          ),
        ),
      ),
    ),
  );
}

HomeTab calculateHomeTabForNotification(
  NotificationPushLoaderNotification? launchOrResumePushLoaderNotification,
) {
  HomeTab homeTab;
  if (launchOrResumePushLoaderNotification != null) {
    var notification = launchOrResumePushLoaderNotification.notification;
    if (notification.isContainsChat) {
      homeTab = HomeTab.chat;
    } else if (notification.isContainsStatus) {
      homeTab = HomeTab.notifications;
    } else if (notification.isContainsAccount ||
        notification.isContainsTargetAccount) {
      homeTab = HomeTab.notifications;
    } else {
      homeTab = HomeTab.timelines;
    }
  } else {
    homeTab = HomeTab.timelines;
  }

  return homeTab;
}

class FediApp extends StatelessWidget {
  final Widget child;
  final bool instanceInitialized;

  const FediApp({
    Key? key,
    required this.child,
    required this.instanceInitialized,
  }) : super(key: key);

  @override
  // todo: refactor
  // ignore: long-method
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    var currentFediUiThemeBloc =
        ICurrentFediUiThemeBloc.of(context, listen: false);

    var localizationSettingsBloc =
        ILocalizationSettingsBloc.of(context, listen: false);

    return UiThemeSystemBrightnessHandlerWidget(
      child: StreamBuilder<IFediUiTheme?>(
        stream: currentFediUiThemeBloc.adaptiveBrightnessCurrentThemeStream,
        builder: (context, snapshot) {
          var currentTheme = snapshot.data;

          var themeMode = currentTheme == null
              ? ThemeMode.system
              : currentTheme == darkFediUiTheme
                  ? ThemeMode.dark
                  : ThemeMode.light;

          _logger.finest(
            () => 'currentTheme $currentTheme '
                'themeMode $themeMode',
          );

          var actualTheme = currentTheme ?? lightFediUiTheme;
          // todo: refactor hack
          try {
            var frontendConfigurationsBloc =
                IInstanceFrontendConfigurationsBloc.of(context);
            var brandColor = frontendConfigurationsBloc.brandColor;

            if (brandColor != null) {
              Color brandColorDark;
              if (actualTheme.colorTheme.brightness == Brightness.light) {
                // ignore: no-magic-number
                brandColorDark = darken(brandColor, 0.2);
              } else {
                // ignore: no-magic-number
                brandColorDark = lighten(brandColor, 0.2);
              }
              var newColorTheme = FediUiColorThemeOverride(
                baseTheme: actualTheme.colorTheme,
                primaryOverride: brandColor,
                primaryDarkOverride: brandColorDark,
              );
              var newTextTheme = FediUiTextTheme(colorTheme: newColorTheme);

              var newThemeData = createBaseFediThemeData(brandColor);
              newThemeData = actualTheme.adoptThemeData(newThemeData);
              actualTheme = FediUiThemeOverride(
                originalFediUiTheme: actualTheme,
                colorTheme: newColorTheme,
                textTheme: newTextTheme,
                themeData: newThemeData,
                id: actualTheme.id,
              );
            }
            // ignore: avoid_catches_without_on_clauses
          } catch (e) {
            // todo: remove this hack. IInstanceFrontendConfigurationsBloc should init before this
            _logger.fine(
              () =>
                  'failed to retrieve IInstanceFrontendConfigurationsBloc. Not initialized yet?',
              // e,
              // stackTrace,
            );
          }

          // ignore: avoid-returning-widgets
          return provideCurrentTheme(
            currentTheme: actualTheme,
            child: StreamBuilder<LocalizationLocale?>(
              stream: localizationSettingsBloc.localizationLocaleStream,
              builder: (context, snapshot) {
                var localizationLocale = snapshot.data;

                Locale? locale;
                if (localizationLocale != null) {
                  locale = Locale.fromSubtags(
                    languageCode: localizationLocale.languageCode,
                    countryCode: localizationLocale.countryCode,
                    scriptCode: localizationLocale.scriptCode,
                  );
                }
                _logger.finest(() => 'locale $locale');

                return OverlayNotificationServiceProvider(
                  child: ToastServiceProvider(
                    child: Builder(
                      builder: (context) => MaterialApp(
                        // checkerboardRasterCacheImages: true,
                        // checkerboardOffscreenLayers: true,
                        debugShowCheckedModeBanner: false,
                        title: IConfigService.of(context).appTitle,
                        localizationsDelegates: const [
                          S.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales: S.delegate.supportedLocales,
                        locale: locale,
                        theme: lightFediUiTheme.themeData,
                        darkTheme: darkFediUiTheme.themeData,
                        themeMode: themeMode,
                        initialRoute: '/',
                        home: Builder(
                          builder: (context) {
                            // it is important to init ToastHandlerBloc
                            // as MaterialApp child
                            // to have access to context suitable for Navigator
                            if (instanceInitialized) {
                              var configService =
                                  IConfigService.of(context, listen: false);
                              var pushFcmEnabled = configService.pushFcmEnabled;

                              Widget actualChild;
                              if (pushFcmEnabled) {
                                actualChild = DisposableProxyProvider<
                                    IToastService, IToastHandlerBloc>(
                                  lazy: false,
                                  update: (context, toastService, _) =>
                                      ToastHandlerBloc.createFromContext(
                                    context,
                                    toastService,
                                  ),
                                  child: child,
                                );
                              } else {
                                actualChild = child;
                              }

                              return DisposableProvider<
                                  IIncomeShareHandlerBloc>(
                                // important
                                // lazy:false because we want init it asap
                                lazy: false,
                                create: (context) {
                                  var bloc =
                                      IncomeShareHandlerBloc.createFromContext(
                                    context,
                                  );

                                  _initIncomeShareHandler(
                                    context: context,
                                    bloc: bloc,
                                  );

                                  return bloc;
                                },
                                child: actualChild,
                              );
                            } else {
                              return child;
                            }
                          },
                        ),
                        navigatorKey: navigatorKey,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget provideCurrentTheme({
    required Widget child,
    required IFediUiTheme currentTheme,
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

void _initIncomeShareHandler({
  required IncomeShareHandlerBloc bloc,
  required BuildContext context,
}) {
  _logger.finest(() => '_initIncomeShareHandler');
  bloc.incomeShareHandlerErrorStream.listen(
    (error) {
      switch (error) {
        case IncomeShareHandlerError.authInstanceListIsEmpty:
          IToastService.of(context).showErrorToast(
            context: context,
            title: S.of(context).app_share_income_error_authInstanceListIsEmpty,
          );
          break;
      }
    },
  ).disposeWith(bloc);
  bloc.needChooseInstanceFromListStream.listen(
    (authInstanceList) {
      showIncomeShareInstanceChooserDialog(
        context,
        authInstanceList: authInstanceList,
        incomeShareHandlerBloc: bloc,
      );
    },
  ).disposeWith(bloc);
  bloc.needChooseActionForEventStream.listen(
    (incomeShareEvent) {
      showIncomeShareActionChooserDialog(
        context,
        incomeShareEvent: incomeShareEvent,
        incomeShareHandlerBloc: bloc,
      );
    },
  ).disposeWith(bloc);

  bloc.checkForInitialEvent();
}

// ignore: no-magic-number
Color darken(Color color, [double amount = 0.1]) {
  assert(amount >= 0 && amount <= 1, 'amount should be in [0, 1]');

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

// ignore: no-magic-number
Color lighten(Color color, [double amount = 0.1]) {
  assert(amount >= 0 && amount <= 1, 'amount should be in [0, 1]');

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
