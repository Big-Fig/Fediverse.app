import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/DeepLinks/DeepLinkHelper.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pleroma/Models/ClientSettings.dart';
import 'package:fedi/Pleroma/Models/Emoji.dart';
import 'package:fedi/Pleroma/Models/Field.dart';
import 'package:fedi/Pleroma/Models/Source.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service_impl.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service_impl.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/permission/camera_permission_bloc.dart';
import 'package:fedi/permission/camera_permission_bloc_impl.dart';
import 'package:fedi/permission/mic_permission_bloc.dart';
import 'package:fedi/permission/mic_permission_bloc_impl.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:fedi/permission/permissions_service_impl.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc_impl.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import './Pages/AppContainerPage.dart';
import './Pages/TermsOfService.dart';
import './Pleroma/Foundation/Client.dart';
import './Pleroma/Foundation/CurrentInstance.dart';
import './Pleroma/Models/Account.dart';
import './Pleroma/Models/AccountAuth.dart';
import './Pleroma/Models/Relationship.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLog();

  final directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(AccountAuthAdapter(), 33);
  Hive.registerAdapter(ClientAdapter(), 34);
  Hive.registerAdapter(AccountAdapter(), 35);
  Hive.registerAdapter(ClientSettingsAdapter(), 36);
  Hive.registerAdapter(FieldAdapter(), 37);
  Hive.registerAdapter(EmojiAdapter(), 38);
  Hive.registerAdapter(MastodonAccountAdapter(), 39);
  Hive.registerAdapter(AccountPleromaAdapter(), 40);
  Hive.registerAdapter(AccountPleromaNotificationsSettingsAdapter(), 41);
  Hive.registerAdapter(RelationshipAdapter(), 42);
  Hive.registerAdapter(MastodonSourceAdapter(), 43);
  Hive.registerAdapter(SourcePleromaAdapter(), 44);
  Hive.registerAdapter(SourceAdapter(), 45);

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

  Widget provideGlobalContext(Widget app) => MultiProvider(
        providers: [
          DisposableProvider<IPermissionsService>(
              create: (BuildContext context) => PermissionsService()),
          DisposableProvider<IRestService>(
              create: (BuildContext context) => RestService()),
          Provider(create: (BuildContext context) => DeepLinkHelper()),
          Provider(create: (BuildContext context) => PushHelper())
        ],
        child: providePermissionsContext(child: providePleromaContext(app)),
      );

  Widget providePleromaContext(Widget app) => Provider<IPleromaRestService>(
      create: (BuildContext context) => PleromaRestService(
          restService: IRestService.of(context, listen: false)),
      child: MultiProvider(
        providers: [
          Provider<IPleromaMediaAttachmentService>(
              create: (context) => PleromaMediaAttachmentService(
                  restService: IPleromaRestService.of(context, listen: false))),
          Provider<IPleromaAccountEditService>(
              create: (context) => PleromaAccountEditService(
                  restService: IPleromaRestService.of(context, listen: false))),
          Provider<IPleromaTimelineService>(
              create: (context) => PleromaTimelineService(
                  restService: IPleromaRestService.of(context, listen: false))),
        ],
        child: app,
      ));
  Widget providePermissionsContext({@required Widget child}) => MultiProvider(
        providers: [
          Provider<ICameraPermissionBloc>(
            create: (context) => CameraPermissionBloc(
                IPermissionsService.of(context, listen: false)),
          ),
          Provider<IMicPermissionBloc>(
            create: (context) => MicPermissionBloc(
                IPermissionsService.of(context, listen: false)),
          ),
          Provider<IStoragePermissionBloc>(
            create: (context) => StoragePermissionBloc(
                IPermissionsService.of(context, listen: false)),
          ),
        ],
        child: child,
      );
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
