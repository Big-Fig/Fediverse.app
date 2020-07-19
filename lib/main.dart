import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/context/current_auth_instance_context_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/from_scratch/from_scratch_join_auth_instance_page.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc_impl.dart';
import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:fedi/app/context/app_context_bloc_impl.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_bloc_impl.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_page.dart';
import 'package:fedi/app/init/init_bloc.dart';
import 'package:fedi/app/init/init_bloc_impl.dart';
import 'package:fedi/app/localization/localization_loader.dart';
import 'package:fedi/app/splash/splash_page.dart';
import 'package:fedi/app/ui/fedi_theme.dart';
import 'package:fedi/async/loading/init/async_init_loading_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';

var _logger = Logger("main.dart");

FirebaseAnalytics analytics = FirebaseAnalytics();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runApp(MaterialApp(home: SplashPage()));

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
        buildCurrentInstanceApp(initBloc.appContextBloc, currentInstance);
      });
    } else if (newState == AsyncInitLoadingState.failed) {
      _logger.severe(() => "failed to init App");
    }
  });
}

CurrentAuthInstanceContextBloc currentInstanceContextBloc;

void showSplashPage(AppContextBloc appContextBloc) {
  var easyLocalization = _buildEasyLocalization(
      child: FediApp(
          child: Provider<IAppContextBloc>.value(
              value: appContextBloc, child: (const SplashPage()))));
  runApp(easyLocalization);
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
    runApp(_buildEasyLocalization(
        child: appContextBloc.provideContextToChild(
            child: currentInstanceContextBloc.provideContextToChild(
                child: DisposableProvider<
                    ICurrentAuthInstanceContextLoadingBloc>(
                    create: (context) {
                      var currentAuthInstanceContextLoadingBloc =
                      CurrentAuthInstanceContextLoadingBloc(
                        myAccountBloc:
                        IMyAccountBloc.of(context, listen: false),
                        pleromaInstanceService:
                        IPleromaInstanceService.of(context, listen: false),
                        currentAuthInstanceBloc:
                        ICurrentAuthInstanceBloc.of(context, listen: false),
                      );
                      currentAuthInstanceContextLoadingBloc.performAsyncInit();
                      return currentAuthInstanceContextLoadingBloc;
                    },
                    child: FediApp(
                        child: CurrentAuthInstanceContextLoadingWidget(
                          child: DisposableProvider<IHomeBloc>(
                              create: (context) =>
                                  HomeBloc(startTab: HomeTab.timelines),
                              child: const HomePage()),
                        )))))));
  } else {
    runApp(_buildEasyLocalization(
        child: appContextBloc.provideContextToChild(
            child: DisposableProvider<IJoinAuthInstanceBloc>(
                create: (context) => JoinAuthInstanceBloc(),
                child:
                const FediApp(child: FromScratchJoinAuthInstancePage())))));
  }
}

Widget _buildEasyLocalization({@required Widget child}) {
  return EasyLocalization(
    key: PageStorageKey("EasyLocalization"),
    assetLoader: CodegenLoader(),
    supportedLocales: [Locale('en', 'US')],
    path: "assets/langs",
    child: child,
  );
}

class FediApp extends StatelessWidget {
  final Widget child;

  const FediApp({@required this.child});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    var app = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fedi2',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: fediTheme,
      initialRoute: "/",
      home: child,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
    return OverlaySupport(child: app);
  }
}
