import 'dart:io';

import 'package:fedi/analytics/app/app_analytics_bloc.dart';
import 'package:fedi/analytics/app/app_analytics_bloc_impl.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/local_preferences/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/current/local_preferences/current_auth_instance_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc_impl.dart';
import 'package:fedi/app/auth/instance/list/local_preferences/auth_instance_list_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/list/local_preferences/auth_instance_list_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/config/config_service_impl.dart';
import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:fedi/app/crash_reporting/permission/ask/local_preferences/ask_crash_reporting_permission_local_preference_bloc.dart';
import 'package:fedi/app/crash_reporting/permission/ask/local_preferences/ask_crash_reporting_permission_local_preference_bloc_impl.dart';
import 'package:fedi/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc.dart';
import 'package:fedi/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc_impl.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_bloc_impl.dart';
import 'package:fedi/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi/app/crash_reporting/settings/local_preference/crash_reporting_settings_local_preference_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/local_preference/global/global_crash_reporting_settings_local_preference_bloc.dart';
import 'package:fedi/app/crash_reporting/settings/local_preference/global/global_crash_reporting_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/database/app_database_service_impl.dart';
import 'package:fedi/app/hive/hive_service.dart';
import 'package:fedi/app/hive/hive_service_impl.dart';
import 'package:fedi/app/local_preferences/fedi_local_preferences_service_migration_bloc_impl.dart';
import 'package:fedi/app/localization/settings/local_preferences/global/global_localization_settings_local_preference_bloc.dart';
import 'package:fedi/app/localization/settings/local_preferences/global/global_localization_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc_impl.dart';
import 'package:fedi/app/logging/logging_service.dart';
import 'package:fedi/app/logging/logging_service_impl.dart';
import 'package:fedi/app/media/camera/camera_media_service.dart';
import 'package:fedi/app/media/camera/camera_media_service_impl.dart';
import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preference_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc.dart';
import 'package:fedi/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc_impl.dart';
import 'package:fedi/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc.dart';
import 'package:fedi/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service_background_message_impl.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/app/share/external/external_share_service_impl.dart';
import 'package:fedi/app/share/income/handler/last_chosen_instance/last_chosen_instance_income_share_handler_local_preference_bloc.dart';
import 'package:fedi/app/share/income/handler/last_chosen_instance/last_chosen_instance_income_share_handler_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preference_bloc.dart';
import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preference_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc_impl.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc_impl.dart';
import 'package:fedi/app/ui/theme/dark/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/connection/connection_service_impl.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/in_app_review/ask/local_preferences/ask_in_app_review_local_preference_bloc.dart';
import 'package:fedi/in_app_review/ask/local_preferences/ask_in_app_review_local_preference_bloc_impl.dart';
import 'package:fedi/in_app_review/checker/in_app_review_checker_bloc.dart';
import 'package:fedi/in_app_review/checker/in_app_review_checker_bloc_impl.dart';
import 'package:fedi/in_app_review/in_app_review_bloc.dart';
import 'package:fedi/in_app_review/in_app_review_bloc_impl.dart';
import 'package:fedi/local_preferences/hive_local_preferences_service_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/shared_preferences_local_preferences_service_impl.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/permission/camera_permission_bloc.dart';
import 'package:fedi/permission/camera_permission_bloc_impl.dart';
import 'package:fedi/permission/mic_permission_bloc.dart';
import 'package:fedi/permission/mic_permission_bloc_impl.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:fedi/permission/permissions_service_impl.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc_impl.dart';
import 'package:fedi/provider/provider_context_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/fcm/fcm_push_service_impl.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:fedi/push/relay/push_relay_service_impl.dart';
import 'package:fedi/share/income/income_share_service.dart';
import 'package:fedi/share/income/income_share_service_impl.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_bloc.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_bloc_impl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

var _logger = Logger('app_context_bloc_impl.dart');

class AppContextBloc extends ProviderContextBloc implements IAppContextBloc {
  @override
  // todo:divide into small methods
  // ignore: long-method
  Future internalAsyncInit() async {
    _logger.fine(() => 'internalAsyncInit');

    var globalProviderService = this;

    var configService = ConfigService();
    await globalProviderService
        .asyncInitAndRegister<IConfigService>(configService);

    var loggingService = LoggingService(
      enabled: configService.logEnabled,
    );
    await globalProviderService
        .asyncInitAndRegister<ILoggingService>(loggingService);

    configService.printConfigToLog();

    if (configService.firebaseEnabled) {
      await Firebase.initializeApp();
    }

    var hiveService = HiveService();
    await globalProviderService.asyncInitAndRegister<IHiveService>(hiveService);

    var externalShareService = ExternalShareService();

    await globalProviderService
        .asyncInitAndRegister<IExternalShareService>(externalShareService);

    var connectionService = ConnectionService();
    await globalProviderService
        .asyncInitAndRegister<IConnectionService>(connectionService);
    var cameraMediaService = CameraMediaService();
    await globalProviderService
        .asyncInitAndRegister<ICameraMediaService>(cameraMediaService);

    await globalProviderService
        .asyncInitAndRegister<IPermissionsService>(PermissionsService());

    var hiveLocalPreferencesService =
        HiveLocalPreferencesService.withLastVersionBoxName();
    await hiveLocalPreferencesService.performAsyncInit();
    var hiveLocalPreferencesServiceExist =
        await hiveLocalPreferencesService.isStorageExist();
    if (!hiveLocalPreferencesServiceExist) {
      var sharedPreferencesLocalPreferencesService =
          SharedPreferencesLocalPreferencesService();

      await sharedPreferencesLocalPreferencesService.performAsyncInit();

      final sharedPreferencesStorageExist =
          await sharedPreferencesLocalPreferencesService.isStorageExist();
      _logger.finest(() =>
          'sharedPreferencesStorageExist == $sharedPreferencesStorageExist}');

      var sharedPreferencesLocalPreferencesServiceExist =
          await sharedPreferencesLocalPreferencesService.isStorageExist();
      _logger.finest(() => 'sharedPreferencesLocalPreferencesServiceExist =='
          ' $sharedPreferencesLocalPreferencesServiceExist');
      if (sharedPreferencesLocalPreferencesServiceExist) {
        var migrationBloc = FediLocalPreferencesServiceMigrationBloc(
          inputService: sharedPreferencesLocalPreferencesService,
          outputService: hiveLocalPreferencesService,
        );

        await migrationBloc.migrateData();
        await sharedPreferencesLocalPreferencesService
            .clearAllValuesAndDeleteStorage();
      }
    }

    await globalProviderService.asyncInitAndRegister<ILocalPreferencesService>(
      hiveLocalPreferencesService,
    );

    var appAnalyticsLocalPreferenceBloc = AppAnalyticsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService.asyncInitAndRegister<
        IAppAnalyticsLocalPreferenceBloc>(appAnalyticsLocalPreferenceBloc);
    addDisposable(disposable: appAnalyticsLocalPreferenceBloc);

    var appAnalyticsBloc = AppAnalyticsBloc(
      appAnalyticsLocalPreferenceBloc: appAnalyticsLocalPreferenceBloc,
    );

    await globalProviderService
        .asyncInitAndRegister<IAppAnalyticsBloc>(appAnalyticsBloc);
    addDisposable(disposable: appAnalyticsBloc);

    await appAnalyticsBloc.onAppOpened();

    var cameraPermissionBloc =
        CameraPermissionBloc(globalProviderService.get<IPermissionsService>());
    await cameraPermissionBloc.checkPermissionStatus();
    await globalProviderService
        .asyncInitAndRegister<ICameraPermissionBloc>(cameraPermissionBloc);
    var micPermissionBloc =
        MicPermissionBloc(globalProviderService.get<IPermissionsService>());
    await micPermissionBloc.checkPermissionStatus();
    await globalProviderService
        .asyncInitAndRegister<IMicPermissionBloc>(micPermissionBloc);
    var storagePermissionBloc =
        StoragePermissionBloc(globalProviderService.get<IPermissionsService>());
    await storagePermissionBloc.checkPermissionStatus();
    await globalProviderService
        .asyncInitAndRegister<IStoragePermissionBloc>(storagePermissionBloc);

    var authOAuthLastLaunchedHostToLoginLocalPreferenceBloc =
        AuthOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );
    await globalProviderService.asyncInitAndRegister<
        IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
      authOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    );
    var lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc =
        LastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );
    await globalProviderService.asyncInitAndRegister<
        ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc>(
      lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc,
    );

    var instanceListLocalPreferenceBloc =
        AuthInstanceListLocalPreferenceBloc(hiveLocalPreferencesService);
    await globalProviderService.asyncInitAndRegister<
        IAuthInstanceListLocalPreferenceBloc>(instanceListLocalPreferenceBloc);

    var instanceListBloc = AuthInstanceListBloc(
      instanceListLocalPreferenceBloc: instanceListLocalPreferenceBloc,
    );
    await globalProviderService
        .asyncInitAndRegister<IAuthInstanceListBloc>(instanceListBloc);

    instanceListBloc.addDisposable(
      streamSubscription: instanceListBloc.instanceRemovedStream.listen(
        (removedInstance) {
          _logger.finest(() => 'removedInstance $removedInstance');

          Future.delayed(
            Duration(seconds: 1),
            () async {
              var userAtHost = removedInstance.userAtHost;
              var databaseFilePath =
                  await AppDatabaseService.calculateDatabaseFilePath(
                userAtHost,
              );
              var file = File(databaseFilePath);
              _logger.finest(
                () => 'removedInstance delete database $databaseFilePath',
              );
              await file.delete();

              var localPreferencesBlocCreators =
                  FediLocalPreferencesServiceMigrationBloc
                      .calculateUserAtHostLocalPreferencesBlocCreators(
                userAtHost,
              );

              for (var blocCreator in localPreferencesBlocCreators) {
                var localPreferencesBloc =
                    blocCreator(hiveLocalPreferencesService);

                await localPreferencesBloc.performAsyncInit();
                await localPreferencesBloc.clearValueAndDispose();
              }
            },
          );
        },
      ),
    );

    var currentInstanceLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(hiveLocalPreferencesService);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAuthInstanceLocalPreferenceBloc>(
      currentInstanceLocalPreferenceBloc,
    );

    var currentInstanceBloc = CurrentAuthInstanceBloc(
      instanceListBloc: instanceListBloc,
      currentLocalPreferenceBloc: currentInstanceLocalPreferenceBloc,
    );
    await globalProviderService
        .asyncInitAndRegister<ICurrentAuthInstanceBloc>(currentInstanceBloc);

    if (configService.pushFcmEnabled) {
      var pushRelayBaseUrl = configService.pushFcmRelayUrl!;

      var pushRelayService =
          PushRelayService(pushRelayBaseUrl: pushRelayBaseUrl);
      addDisposable(disposable: pushRelayService);
      await globalProviderService
          .asyncInitAndRegister<IPushRelayService>(pushRelayService);

      var globalLocalizationSettingsLocalPreferencesBloc =
          GlobalLocalizationSettingsLocalPreferenceBloc(
        hiveLocalPreferencesService,
      );

      await globalProviderService
          .asyncInitAndRegister<ILocalizationSettingsLocalPreferenceBloc>(
        globalLocalizationSettingsLocalPreferencesBloc,
      );
      await globalProviderService
          .asyncInitAndRegister<IGlobalLocalizationSettingsLocalPreferenceBloc>(
        globalLocalizationSettingsLocalPreferencesBloc,
      );
      addDisposable(disposable: globalLocalizationSettingsLocalPreferencesBloc);

      var localizationSettingsBloc = LocalizationSettingsBloc(
        localizationSettingsLocalPreferencesBloc:
            globalLocalizationSettingsLocalPreferencesBloc,
      );

      await globalProviderService
          .asyncInitAndRegister<ILocalizationSettingsBloc>(
        localizationSettingsBloc,
      );
      addDisposable(disposable: localizationSettingsBloc);

      var localizationLocale = localizationSettingsBloc.localizationLocale;

      var locale = LocalizationLocale
          .calculateLocaleBaseOnLocalizationLocaleOrPlatformLocale(
        localizationLocale: localizationLocale,
      );
      var richNotificationsServiceBackgroundMessage =
          RichNotificationsServiceBackgroundMessage(
        localizationContext: await S.load(
          locale,
        ),
      );
      await globalProviderService.asyncInitAndRegister<
          IRichNotificationsService>(richNotificationsServiceBackgroundMessage);

      var fcmPushService = FcmPushService();
      await globalProviderService
          .asyncInitAndRegister<IFcmPushService>(fcmPushService);

      var notificationsPushHandlerUnhandledLocalPreferencesBloc =
          NotificationsPushHandlerUnhandledLocalPreferenceBloc(
        hiveLocalPreferencesService,
      );

      await globalProviderService.asyncInitAndRegister<
          INotificationsPushHandlerUnhandledLocalPreferenceBloc>(
        notificationsPushHandlerUnhandledLocalPreferencesBloc,
      );
      addDisposable(
        disposable: notificationsPushHandlerUnhandledLocalPreferencesBloc,
      );
      var notificationsPushHandlerBloc = NotificationsPushHandlerBloc(
        richNotificationsService: richNotificationsServiceBackgroundMessage,
        currentInstanceBloc: currentInstanceBloc,
        instanceListBloc: instanceListBloc,
        unhandledLocalPreferencesBloc:
            notificationsPushHandlerUnhandledLocalPreferencesBloc,
        fcmPushService: fcmPushService,
        configService: configService,
        connectionService: connectionService,
      );
      await globalProviderService
          .asyncInitAndRegister<INotificationsPushHandlerBloc>(
        notificationsPushHandlerBloc,
      );
      addDisposable(disposable: notificationsPushHandlerBloc);
    }

    var globalUiSettingsLocalPreferencesBloc =
        GlobalUiSettingsLocalPreferenceBloc(hiveLocalPreferencesService);

    await globalProviderService
        .asyncInitAndRegister<IGlobalUiSettingsLocalPreferenceBloc>(
      globalUiSettingsLocalPreferencesBloc,
    );
    await globalProviderService.asyncInitAndRegister<
        IUiSettingsLocalPreferenceBloc>(globalUiSettingsLocalPreferencesBloc);
    addDisposable(disposable: globalUiSettingsLocalPreferencesBloc);

    var uiSettingsBloc = UiSettingsBloc(
      uiSettingsLocalPreferencesBloc: globalUiSettingsLocalPreferencesBloc,
    );

    await globalProviderService
        .asyncInitAndRegister<IUiSettingsBloc>(uiSettingsBloc);
    addDisposable(disposable: uiSettingsBloc);

    if (configService.crashlyticsEnabled) {
      var globalCrashReportingSettingsLocalPreferencesBloc =
          GlobalCrashReportingSettingsLocalPreferenceBloc(
        hiveLocalPreferencesService,
        defaultValue: CrashReportingSettings(
          reportingEnabled: configService.crashlyticsDefaultHandlingEnabled!,
        ),
      );

      await globalProviderService.asyncInitAndRegister<
          IGlobalCrashReportingSettingsLocalPreferenceBloc>(
        globalCrashReportingSettingsLocalPreferencesBloc,
      );
      await globalProviderService
          .asyncInitAndRegister<ICrashReportingSettingsLocalPreferenceBloc>(
        globalCrashReportingSettingsLocalPreferencesBloc,
      );
      addDisposable(
        disposable: globalCrashReportingSettingsLocalPreferencesBloc,
      );

      var crashReportingSettingsBloc = CrashReportingSettingsBloc(
        crashReportingSettingsLocalPreferencesBloc:
            globalCrashReportingSettingsLocalPreferencesBloc,
      );

      await globalProviderService.asyncInitAndRegister<
          ICrashReportingSettingsBloc>(crashReportingSettingsBloc);
      addDisposable(disposable: crashReportingSettingsBloc);

      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        crashReportingSettingsBloc.reportingEnabled && !kDebugMode,
      );

      crashReportingSettingsBloc.addDisposable(
        streamSubscription:
            crashReportingSettingsBloc.reportingEnabledStream.listen(
          (reportingEnabled) {
            FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
              reportingEnabled && !kDebugMode,
            );
          },
        ),
      );

      var askCrashReportingPermissionLocalPreferenceBloc =
          AskCrashReportingPermissionLocalPreferenceBloc(
        hiveLocalPreferencesService,
      );

      addDisposable(disposable: askCrashReportingPermissionLocalPreferenceBloc);
      await globalProviderService.asyncInitAndRegister<
          IAskCrashReportingPermissionLocalPreferenceBloc>(
        askCrashReportingPermissionLocalPreferenceBloc,
      );

      var crashReportingPermissionCheckerBloc =
          CrashReportingPermissionCheckerBloc(
        appAnalyticsBloc: appAnalyticsBloc,
        configService: configService,
        askCrashReportingPermissionLocalPreferenceBloc:
            askCrashReportingPermissionLocalPreferenceBloc,
        crashReportingSettingsLocalPreferenceBloc:
            globalCrashReportingSettingsLocalPreferencesBloc,
      );

      addDisposable(disposable: crashReportingPermissionCheckerBloc);
      await globalProviderService
          .asyncInitAndRegister<ICrashReportingPermissionCheckerBloc>(
        crashReportingPermissionCheckerBloc,
      );
    }

    var uiThemeSystemBrightnessBloc = UiThemeSystemBrightnessBloc();

    await globalProviderService.asyncInitAndRegister<
        IUiThemeSystemBrightnessBloc>(uiThemeSystemBrightnessBloc);
    addDisposable(disposable: uiThemeSystemBrightnessBloc);

    var incomeShareService = IncomeShareService();

    await globalProviderService
        .asyncInitAndRegister<IIncomeShareService>(incomeShareService);
    addDisposable(disposable: incomeShareService);

    var currentFediUiThemeBloc = CurrentFediUiThemeBloc(
      uiSettingsBloc: uiSettingsBloc,
      lightTheme: lightFediUiTheme,
      darkTheme: darkFediUiTheme,
      systemBrightnessHandlerBloc: uiThemeSystemBrightnessBloc,
      availableThemes: [
        lightFediUiTheme,
        darkFediUiTheme,
      ],
    );

    await globalProviderService
        .asyncInitAndRegister<ICurrentFediUiThemeBloc>(currentFediUiThemeBloc);

    addDisposable(disposable: currentFediUiThemeBloc);

    var globalChatSettingsLocalPreferencesBloc =
        GlobalChatSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalChatSettingsLocalPreferenceBloc>(
      globalChatSettingsLocalPreferencesBloc,
    );
    addDisposable(disposable: globalChatSettingsLocalPreferencesBloc);

    var globalMediaSettingsLocalPreferencesBloc =
        GlobalMediaSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );
    await globalProviderService
        .asyncInitAndRegister<IGlobalMediaSettingsLocalPreferenceBloc>(
      globalMediaSettingsLocalPreferencesBloc,
    );
    addDisposable(disposable: globalMediaSettingsLocalPreferencesBloc);

    var globalToastSettingsLocalPreferencesBloc =
        GlobalToastSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalToastSettingsLocalPreferenceBloc>(
      globalToastSettingsLocalPreferencesBloc,
    );
    addDisposable(disposable: globalToastSettingsLocalPreferencesBloc);

    var globalPostStatusSettingsLocalPreferencesBloc =
        GlobalPostStatusSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalPostStatusSettingsLocalPreferenceBloc>(
      globalPostStatusSettingsLocalPreferencesBloc,
    );
    addDisposable(disposable: globalPostStatusSettingsLocalPreferencesBloc);

    var globalStatusSensitiveSettingsLocalPreferencesBloc =
        GlobalStatusSensitiveSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService.asyncInitAndRegister<
        IGlobalStatusSensitiveSettingsLocalPreferenceBloc>(
      globalStatusSensitiveSettingsLocalPreferencesBloc,
    );
    addDisposable(
      disposable: globalStatusSensitiveSettingsLocalPreferencesBloc,
    );

    var globalWebSocketsSettingsLocalPreferencesBloc =
        GlobalWebSocketsSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalWebSocketsSettingsLocalPreferenceBloc>(
      globalWebSocketsSettingsLocalPreferencesBloc,
    );
    addDisposable(disposable: globalWebSocketsSettingsLocalPreferencesBloc);

    var globalPaginationSettingsLocalPreferencesBloc =
        GlobalPaginationSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalPaginationSettingsLocalPreferenceBloc>(
      globalPaginationSettingsLocalPreferencesBloc,
    );
    addDisposable(disposable: globalPaginationSettingsLocalPreferencesBloc);

    var globalDatabaseCacheSettingsLocalPreferencesBloc =
        GlobalDatabaseCacheSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalDatabaseCacheSettingsLocalPreferenceBloc>(
      globalDatabaseCacheSettingsLocalPreferencesBloc,
    );
    addDisposable(disposable: globalDatabaseCacheSettingsLocalPreferencesBloc);

    var globalFilesCacheSettingsLocalPreferencesBloc =
        GlobalFilesCacheSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalFilesCacheSettingsLocalPreferencesBloc>(
      globalFilesCacheSettingsLocalPreferencesBloc,
    );
    addDisposable(disposable: globalFilesCacheSettingsLocalPreferencesBloc);

    if (configService.askReviewEnabled) {
      var inAppReviewBloc = InAppReviewBloc(
        appStoreId: configService.appId,
      );

      await globalProviderService
          .asyncInitAndRegister<IInAppReviewBloc>(inAppReviewBloc);
      addDisposable(disposable: inAppReviewBloc);

      var askInAppReviewLocalPreferenceBloc = AskInAppReviewLocalPreferenceBloc(
        hiveLocalPreferencesService,
      );

      addDisposable(disposable: askInAppReviewLocalPreferenceBloc);
      await globalProviderService
          .asyncInitAndRegister<IAskInAppReviewLocalPreferenceBloc>(
        askInAppReviewLocalPreferenceBloc,
      );

      var inAppReviewCheckerBloc = InAppReviewCheckerBloc(
        appAnalyticsBloc: appAnalyticsBloc,
        configService: configService,
        askInAppReviewLocalPreferenceBloc: askInAppReviewLocalPreferenceBloc,
      );

      addDisposable(disposable: inAppReviewCheckerBloc);
      await globalProviderService.asyncInitAndRegister<IInAppReviewCheckerBloc>(
        inAppReviewCheckerBloc,
      );
    }
  }
}
