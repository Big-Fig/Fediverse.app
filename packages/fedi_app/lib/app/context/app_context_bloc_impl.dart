import 'dart:io';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/analytics/app/app_analytics_bloc.dart';
import 'package:fedi_app/analytics/app/app_analytics_bloc_impl.dart';
import 'package:fedi_app/analytics/app/local_preferences/app_analytics_local_preference_bloc.dart';
import 'package:fedi_app/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/current/current_access_bloc_impl.dart';
import 'package:fedi_app/app/access/current/local_preferences/current_access_local_preference_bloc.dart';
import 'package:fedi_app/app/access/current/local_preferences/current_access_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/access/list/access_list_bloc.dart';
import 'package:fedi_app/app/access/list/access_list_bloc_impl.dart';
import 'package:fedi_app/app/access/list/local_preferences/access_list_local_preference_bloc.dart';
import 'package:fedi_app/app/access/list/local_preferences/access_list_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/auth/oauth_last_launched/local_preferences/access_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi_app/app/auth/oauth_last_launched/local_preferences/access_oauth_last_launched_host_to_login_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/cache/database/settings/database_cache_settings_bloc.dart';
import 'package:fedi_app/app/cache/database/settings/database_cache_settings_bloc_impl.dart';
import 'package:fedi_app/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/cache/files/files_cache_service.dart';
import 'package:fedi_app/app/cache/files/files_cache_service_impl.dart';
import 'package:fedi_app/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi_app/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi_app/app/cache/files/settings/files_cache_settings_bloc.dart';
import 'package:fedi_app/app/cache/files/settings/files_cache_settings_bloc_impl.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/global/global_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/instance/instance_chat_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/config/config_service_impl.dart';
import 'package:fedi_app/app/context/app_context_bloc.dart';
import 'package:fedi_app/app/crash_reporting/permission/ask/local_preferences/ask_crash_reporting_permission_local_preference_bloc.dart';
import 'package:fedi_app/app/crash_reporting/permission/ask/local_preferences/ask_crash_reporting_permission_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc.dart';
import 'package:fedi_app/app/crash_reporting/permission/checker/crash_reporting_permission_checker_bloc_impl.dart';
import 'package:fedi_app/app/crash_reporting/settings/crash_reporting_settings_bloc.dart';
import 'package:fedi_app/app/crash_reporting/settings/crash_reporting_settings_bloc_impl.dart';
import 'package:fedi_app/app/crash_reporting/settings/crash_reporting_settings_model.dart';
import 'package:fedi_app/app/crash_reporting/settings/local_preference/crash_reporting_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/crash_reporting/settings/local_preference/global/global_crash_reporting_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/crash_reporting/settings/local_preference/global/global_crash_reporting_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/database/app_database_service_impl.dart';
import 'package:fedi_app/app/guest/guest_my_account_bloc_impl.dart';
import 'package:fedi_app/app/hive/hive_service.dart';
import 'package:fedi_app/app/hive/hive_service_impl.dart';
import 'package:fedi_app/app/local_preferences/fedi_local_preferences_service_migration_bloc_impl.dart';
import 'package:fedi_app/app/localization/settings/local_preferences/global/global_localization_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/localization/settings/local_preferences/global/global_localization_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_bloc_impl.dart';
import 'package:fedi_app/app/logging/logging_service.dart';
import 'package:fedi_app/app/logging/logging_service_impl.dart';
import 'package:fedi_app/app/media/camera/camera_media_service.dart';
import 'package:fedi_app/app/media/camera/camera_media_service_impl.dart';
import 'package:fedi_app/app/media/settings/local_preferences/global/global_media_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/media/settings/local_preferences/global/global_media_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/media/settings/local_preferences/instance/instance_media_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/media/settings/local_preferences/instance/instance_media_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/media/settings/media_settings_bloc.dart';
import 'package:fedi_app/app/media/settings/media_settings_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc_impl.dart';
import 'package:fedi_app/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi_app/app/push/notification/handler/notifications_push_handler_bloc_impl.dart';
import 'package:fedi_app/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc.dart';
import 'package:fedi_app/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/push/notification/rich/rich_notifications_service.dart';
import 'package:fedi_app/app/push/notification/rich/rich_notifications_service_background_message_impl.dart';
import 'package:fedi_app/app/share/external/external_share_service.dart';
import 'package:fedi_app/app/share/external/external_share_service_impl.dart';
import 'package:fedi_app/app/share/income/handler/last_chosen_instance/last_chosen_instance_income_share_handler_local_preference_bloc.dart';
import 'package:fedi_app/app/share/income/handler/last_chosen_instance/last_chosen_instance_income_share_handler_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/display_time_storage/status_sensitive_display_time_storage_bloc.dart';
import 'package:fedi_app/app/status/sensitive/display_time_storage/status_sensitive_display_time_storage_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_bloc_impl.dart';
import 'package:fedi_app/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_bloc_impl.dart';
import 'package:fedi_app/app/ui/settings/local_preference/global/global_ui_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/ui/settings/local_preference/global/global_ui_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/ui/settings/local_preference/ui_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi_app/app/ui/settings/ui_settings_bloc_impl.dart';
import 'package:fedi_app/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi_app/app/ui/theme/current/current_fedi_ui_theme_bloc_impl.dart';
import 'package:fedi_app/app/ui/theme/dark/dark_fedi_ui_theme_model.dart';
import 'package:fedi_app/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:fedi_app/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_bloc_impl.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/connection/connection_service_impl.dart';
import 'package:fedi_app/date_time/timeago/date_time_timeago_init_helper.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/in_app_review/ask/local_preferences/ask_in_app_review_local_preference_bloc.dart';
import 'package:fedi_app/in_app_review/ask/local_preferences/ask_in_app_review_local_preference_bloc_impl.dart';
import 'package:fedi_app/in_app_review/checker/in_app_review_checker_bloc.dart';
import 'package:fedi_app/in_app_review/checker/in_app_review_checker_bloc_impl.dart';
import 'package:fedi_app/in_app_review/in_app_review_bloc.dart';
import 'package:fedi_app/in_app_review/in_app_review_bloc_impl.dart';
import 'package:fedi_app/local_preferences/hive_local_preferences_service_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:fedi_app/permission/camera_permission_bloc.dart';
import 'package:fedi_app/permission/camera_permission_bloc_impl.dart';
import 'package:fedi_app/permission/mic_permission_bloc.dart';
import 'package:fedi_app/permission/mic_permission_bloc_impl.dart';
import 'package:fedi_app/permission/permissions_service.dart';
import 'package:fedi_app/permission/permissions_service_impl.dart';
import 'package:fedi_app/permission/storage_permission_bloc.dart';
import 'package:fedi_app/permission/storage_permission_bloc_impl.dart';
import 'package:fedi_app/provider/provider_context_bloc_impl.dart';
import 'package:fedi_app/push/fcm/fcm_push_service.dart';
import 'package:fedi_app/push/fcm/fcm_push_service_impl.dart';
import 'package:fedi_app/push/relay/push_relay_service.dart';
import 'package:fedi_app/push/relay/push_relay_service_impl.dart';
import 'package:fedi_app/share/income/income_share_service.dart';
import 'package:fedi_app/share/income/income_share_service_impl.dart';
import 'package:fedi_app/ui/theme/system/brightness/ui_theme_system_brightness_bloc.dart';
import 'package:fedi_app/ui/theme/system/brightness/ui_theme_system_brightness_bloc_impl.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

// ignore_for_file: avoid-ignoring-return-values

var _logger = Logger('app_context_bloc_impl.dart');

class AppContextBloc extends ProviderContextBloc implements IAppContextBloc {
  AppContextBloc();

  @override
  // todo:divide into small methods
  // ignore: long-method
  Future<void> internalAsyncInit() async {
    _logger.fine(() => 'internalAsyncInit');

    var globalProviderService = this;

    var configService = ConfigService()..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IConfigService>(configService);

    var loggingService = LoggingService(
      enabled: configService.logEnabled,
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<ILoggingService>(loggingService);

    configService.printConfigToLog();

    DateTimeTimeagoInitHelper.initTimeago();

    if (configService.firebaseEnabled) {
      await Firebase.initializeApp();
    }

    var hiveService = HiveService()..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<IHiveService>(hiveService);

    var externalShareService = ExternalShareService()..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IExternalShareService>(externalShareService);

    var connectionService = ConnectionService()..disposeWith(this);
    await connectionService.internalAsyncInit();
    await globalProviderService
        .asyncInitAndRegister<IConnectionService>(connectionService);
    var cameraMediaService = CameraMediaService()..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<ICameraMediaService>(cameraMediaService);

    await globalProviderService.asyncInitAndRegister<IPermissionsService>(
      PermissionsService()
        ..disposeWith(
          this,
        ),
    );

    var hiveLocalPreferencesService =
        HiveLocalPreferencesService.withLastVersionBoxName()..disposeWith(this);
    await hiveLocalPreferencesService.performAsyncInit();

    if (configService.clearDatabaseOnLaunch == true) {
      await hiveLocalPreferencesService.clearAllValues();
    }

    await globalProviderService.asyncInitAndRegister<ILocalPreferencesService>(
      hiveLocalPreferencesService,
    );

    var appAnalyticsLocalPreferenceBloc = AppAnalyticsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IAppAnalyticsLocalPreferenceBloc>(appAnalyticsLocalPreferenceBloc);

    var appAnalyticsBloc = AppAnalyticsBloc(
      appAnalyticsLocalPreferenceBloc: appAnalyticsLocalPreferenceBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IAppAnalyticsBloc>(appAnalyticsBloc);

    await appAnalyticsBloc.onAppOpened();

    var cameraPermissionBloc =
        CameraPermissionBloc(globalProviderService.get<IPermissionsService>())
          ..disposeWith(this);

    await cameraPermissionBloc.checkPermissionStatus();
    await globalProviderService
        .asyncInitAndRegister<ICameraPermissionBloc>(cameraPermissionBloc);
    var micPermissionBloc =
        MicPermissionBloc(globalProviderService.get<IPermissionsService>())
          ..disposeWith(this);

    await micPermissionBloc.checkPermissionStatus();
    await globalProviderService
        .asyncInitAndRegister<IMicPermissionBloc>(micPermissionBloc);
    var storagePermissionBloc =
        StoragePermissionBloc(globalProviderService.get<IPermissionsService>())
          ..disposeWith(this);

    await storagePermissionBloc.checkPermissionStatus();
    await globalProviderService
        .asyncInitAndRegister<IStoragePermissionBloc>(storagePermissionBloc);

    var authOAuthLastLaunchedHostToLoginLocalPreferenceBloc =
        AccessOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        IAccessApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
      authOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    );
    var lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc =
        LastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);
    await globalProviderService.asyncInitAndRegister<
        ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc>(
      lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc,
    );

    var instanceListLocalPreferenceBloc =
        AccessListLocalPreferenceBloc(hiveLocalPreferencesService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IAccessListLocalPreferenceBloc>(
      instanceListLocalPreferenceBloc,
    );

    var instanceListBloc = AccessListBloc(
      instanceListLocalPreferenceBloc: instanceListLocalPreferenceBloc,
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IAccessListBloc>(instanceListBloc);

    instanceListBloc.instanceRemovedStream.listen(
      (removedInstance) {
        _logger.finest(() => 'removedInstance $removedInstance');

        Future.delayed(
          const Duration(seconds: 1),
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

            for (final blocCreator in localPreferencesBlocCreators) {
              var localPreferencesBloc =
                  blocCreator(hiveLocalPreferencesService);

              await localPreferencesBloc.performAsyncInit();
              await localPreferencesBloc.clearValueAndDispose();
            }
          },
        );
      },
    ).disposeWith(this);

    var currentInstanceLocalPreferenceBloc =
        CurrentAccessLocalPreferenceBloc(hiveLocalPreferencesService)
          ..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAccessLocalPreferenceBloc>(
      currentInstanceLocalPreferenceBloc,
    );

    var currentInstanceBloc = CurrentAccessBloc(
      localPreferencesService: hiveLocalPreferencesService,
      instanceListBloc: instanceListBloc,
      currentLocalPreferenceBloc: currentInstanceLocalPreferenceBloc,
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAccessBloc>(currentInstanceBloc);

    var globalLocalizationSettingsLocalPreferencesBloc =
        GlobalLocalizationSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<ILocalizationSettingsLocalPreferenceBloc>(
      globalLocalizationSettingsLocalPreferencesBloc,
    );
    await globalProviderService
        .asyncInitAndRegister<IGlobalLocalizationSettingsLocalPreferenceBloc>(
      globalLocalizationSettingsLocalPreferencesBloc,
    );

    var localizationSettingsBloc = LocalizationSettingsBloc(
      localizationSettingsLocalPreferencesBloc:
          globalLocalizationSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<ILocalizationSettingsBloc>(
      localizationSettingsBloc,
    );

    if (configService.pushFcmEnabled) {
      var pushRelayBaseUrl = configService.pushFcmRelayUrl!;

      var pushRelayService =
          PushRelayService(pushRelayBaseUrl: pushRelayBaseUrl)
            ..disposeWith(this);

      await globalProviderService
          .asyncInitAndRegister<IPushRelayService>(pushRelayService);

      var localizationLocale = localizationSettingsBloc.localizationLocale;

      var locale = LocalizationLocale
          .calculateLocaleBaseOnLocalizationLocaleOrPlatformLocale(
        localizationLocale: localizationLocale,
      );
      var richNotificationsServiceBackgroundMessage =
          RichNotificationsServiceBackgroundMessage(
        localizationContext: await S.load(
          locale.toLocale(),
        ),
      );
      await globalProviderService.asyncInitAndRegister<
          IRichNotificationsService>(richNotificationsServiceBackgroundMessage);

      var fcmPushService = FcmPushService()..disposeWith(this);
      await globalProviderService
          .asyncInitAndRegister<IFcmPushService>(fcmPushService);

      var notificationsPushHandlerUnhandledLocalPreferencesBloc =
          NotificationsPushHandlerUnhandledLocalPreferenceBloc(
        hiveLocalPreferencesService,
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<
          INotificationsPushHandlerUnhandledLocalPreferenceBloc>(
        notificationsPushHandlerUnhandledLocalPreferencesBloc,
      );
      var notificationsPushHandlerBloc = NotificationsPushHandlerBloc(
        localPreferencesService: hiveLocalPreferencesService,
        richNotificationsService: richNotificationsServiceBackgroundMessage,
        currentInstanceBloc: currentInstanceBloc,
        instanceListBloc: instanceListBloc,
        unhandledLocalPreferencesBloc:
            notificationsPushHandlerUnhandledLocalPreferencesBloc,
        fcmPushService: fcmPushService,
        configService: configService,
        connectionService: connectionService,
      )..disposeWith(this);
      await globalProviderService
          .asyncInitAndRegister<INotificationsPushHandlerBloc>(
        notificationsPushHandlerBloc,
      );
    }

    var globalUiSettingsLocalPreferencesBloc =
        GlobalUiSettingsLocalPreferenceBloc(hiveLocalPreferencesService)
          ..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IGlobalUiSettingsLocalPreferenceBloc>(
      globalUiSettingsLocalPreferencesBloc,
    );
    await globalProviderService.asyncInitAndRegister<
        IUiSettingsLocalPreferenceBloc>(globalUiSettingsLocalPreferencesBloc);

    var uiSettingsBloc = UiSettingsBloc(
      uiSettingsLocalPreferencesBloc: globalUiSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IUiSettingsBloc>(uiSettingsBloc);

    if (configService.crashlyticsEnabled) {
      var globalCrashReportingSettingsLocalPreferencesBloc =
          GlobalCrashReportingSettingsLocalPreferenceBloc(
        hiveLocalPreferencesService,
        defaultValue: CrashReportingSettings(
          reportingEnabled: configService.crashlyticsDefaultHandlingEnabled!,
        ),
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<
          IGlobalCrashReportingSettingsLocalPreferenceBloc>(
        globalCrashReportingSettingsLocalPreferencesBloc,
      );
      await globalProviderService
          .asyncInitAndRegister<ICrashReportingSettingsLocalPreferenceBloc>(
        globalCrashReportingSettingsLocalPreferencesBloc,
      );

      var crashReportingSettingsBloc = CrashReportingSettingsBloc(
        crashReportingSettingsLocalPreferencesBloc:
            globalCrashReportingSettingsLocalPreferencesBloc,
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<
          ICrashReportingSettingsBloc>(crashReportingSettingsBloc);

      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        crashReportingSettingsBloc.reportingEnabled && !kDebugMode,
      );

      crashReportingSettingsBloc.reportingEnabledStream.listen(
        (reportingEnabled) {
          FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
            reportingEnabled && !kDebugMode,
          );
        },
      ).disposeWith(this);

      var askCrashReportingPermissionLocalPreferenceBloc =
          AskCrashReportingPermissionLocalPreferenceBloc(
        hiveLocalPreferencesService,
      )..disposeWith(this);

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
      )..disposeWith(this);

      await globalProviderService
          .asyncInitAndRegister<ICrashReportingPermissionCheckerBloc>(
        crashReportingPermissionCheckerBloc,
      );
    }

    var uiThemeSystemBrightnessBloc = UiThemeSystemBrightnessBloc()
      ..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IUiThemeSystemBrightnessBloc>(uiThemeSystemBrightnessBloc);

    var incomeShareService = IncomeShareService()..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IIncomeShareService>(incomeShareService);

    var currentFediUiThemeBloc = CurrentFediUiThemeBloc(
      uiSettingsBloc: uiSettingsBloc,
      systemBrightnessHandlerBloc: uiThemeSystemBrightnessBloc,
      availableThemes: [
        lightFediUiTheme,
        darkFediUiTheme,
      ],
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<ICurrentFediUiThemeBloc>(currentFediUiThemeBloc);

    var globalChatSettingsLocalPreferencesBloc =
        GlobalChatSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IGlobalChatSettingsLocalPreferenceBloc>(
      globalChatSettingsLocalPreferencesBloc,
    );

    var globalMediaSettingsLocalPreferencesBloc =
        GlobalMediaSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IGlobalMediaSettingsLocalPreferenceBloc>(
      globalMediaSettingsLocalPreferencesBloc,
    );

    var globalToastSettingsLocalPreferencesBloc =
        GlobalToastSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IGlobalToastSettingsLocalPreferenceBloc>(
      globalToastSettingsLocalPreferencesBloc,
    );

    var globalPostStatusSettingsLocalPreferencesBloc =
        GlobalPostStatusSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IGlobalPostStatusSettingsLocalPreferenceBloc>(
      globalPostStatusSettingsLocalPreferencesBloc,
    );

    var globalStatusSensitiveSettingsLocalPreferencesBloc =
        GlobalStatusSensitiveSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IGlobalStatusSensitiveSettingsLocalPreferenceBloc>(
      globalStatusSensitiveSettingsLocalPreferencesBloc,
    );

    var globalWebSocketsSettingsLocalPreferencesBloc =
        GlobalWebSocketsSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IGlobalWebSocketsSettingsLocalPreferenceBloc>(
      globalWebSocketsSettingsLocalPreferencesBloc,
    );

    var globalPaginationSettingsLocalPreferencesBloc =
        GlobalPaginationSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IGlobalPaginationSettingsLocalPreferenceBloc>(
      globalPaginationSettingsLocalPreferencesBloc,
    );

    var globalDatabaseCacheSettingsLocalPreferencesBloc =
        GlobalDatabaseCacheSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IGlobalDatabaseCacheSettingsLocalPreferenceBloc>(
      globalDatabaseCacheSettingsLocalPreferencesBloc,
    );
    var globalFilesCacheSettingsLocalPreferencesBloc =
        GlobalFilesCacheSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IGlobalFilesCacheSettingsLocalPreferencesBloc>(
      globalFilesCacheSettingsLocalPreferencesBloc,
    );

    if (configService.askReviewEnabled) {
      var inAppReviewBloc = InAppReviewBloc(
        appStoreId: configService.appId,
      )..disposeWith(this);

      await globalProviderService
          .asyncInitAndRegister<IInAppReviewBloc>(inAppReviewBloc);

      var askInAppReviewLocalPreferenceBloc = AskInAppReviewLocalPreferenceBloc(
        hiveLocalPreferencesService,
      )..disposeWith(this);

      await globalProviderService
          .asyncInitAndRegister<IAskInAppReviewLocalPreferenceBloc>(
        askInAppReviewLocalPreferenceBloc,
      );

      var inAppReviewCheckerBloc = InAppReviewCheckerBloc(
        appAnalyticsBloc: appAnalyticsBloc,
        configService: configService,
        askInAppReviewLocalPreferenceBloc: askInAppReviewLocalPreferenceBloc,
      )..disposeWith(this);

      await globalProviderService.asyncInitAndRegister<IInAppReviewCheckerBloc>(
        inAppReviewCheckerBloc,
      );
    }

    // same in auth instance context
    var statusSensitiveDisplayTimeStorageBloc =
        StatusSensitiveDisplayTimeStorageBloc()..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IStatusSensitiveDisplayTimeStorageBloc>(
      statusSensitiveDisplayTimeStorageBloc,
    );

    // todo: refactoru guest context scope
    const guestUserAtHost = 'guest';

    var guestFilesCacheService = FilesCacheService(
      connectionService: connectionService,
      key: guestUserAtHost,
      stalePeriod: globalFilesCacheSettingsLocalPreferencesBloc
          .value.ageLimitType
          .toDurationOrNull(),
      maxNrOfCacheObjects: globalFilesCacheSettingsLocalPreferencesBloc
          .value.sizeLimitCountType
          .toCountOrNull(),
      configService: configService,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IFilesCacheService>(guestFilesCacheService);

    var guestChatSettingsLocalPreferencesBloc =
        InstanceChatSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceChatSettingsLocalPreferenceBloc>(
      guestChatSettingsLocalPreferencesBloc,
    );

    var guestMediaSettingsLocalPreferencesBloc =
        InstanceMediaSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IInstanceMediaSettingsLocalPreferenceBloc>(
      guestMediaSettingsLocalPreferencesBloc,
    );

    var guestToastSettingsLocalPreferencesBloc =
        InstanceToastSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceToastSettingsLocalPreferenceBloc>(
      guestToastSettingsLocalPreferencesBloc,
    );

    var guestPostStatusSettingsLocalPreferencesBloc =
        InstancePostStatusSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstancePostStatusSettingsLocalPreferenceBloc>(
      guestPostStatusSettingsLocalPreferencesBloc,
    );

    var guestStatusSensitiveSettingsLocalPreferencesBloc =
        InstanceStatusSensitiveSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IInstanceStatusSensitiveSettingsLocalPreferenceBloc>(
      guestStatusSensitiveSettingsLocalPreferencesBloc,
    );

    var guestWebSocketsSettingsLocalPreferencesBloc =
        InstanceWebSocketsSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceWebSocketsSettingsLocalPreferenceBloc>(
      guestWebSocketsSettingsLocalPreferencesBloc,
    );

    var guestPaginationSettingsLocalPreferencesBloc =
        InstancePaginationSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstancePaginationSettingsLocalPreferenceBloc>(
      guestPaginationSettingsLocalPreferencesBloc,
    );

    var guestFilesCacheSettingsLocalPreferencesBloc =
        InstanceFilesCacheSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IInstanceFilesCacheSettingsLocalPreferenceBloc>(
      guestFilesCacheSettingsLocalPreferencesBloc,
    );

    var guestDatabaseCacheSettingsLocalPreferencesBloc =
        InstanceDatabaseCacheSettingsLocalPreferenceBloc(
      hiveLocalPreferencesService,
      userAtHost: guestUserAtHost,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IInstanceDatabaseCacheSettingsLocalPreferenceBloc>(
      guestDatabaseCacheSettingsLocalPreferencesBloc,
    );

    var chatSettingsBloc = ChatSettingsBloc(
      instanceLocalPreferencesBloc: guestChatSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: globalChatSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IChatSettingsBloc>(chatSettingsBloc);

    var mediaSettingsBloc = MediaSettingsBloc(
      instanceLocalPreferencesBloc: guestMediaSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: globalMediaSettingsLocalPreferencesBloc,
    )..disposeWith(this);
    await globalProviderService
        .asyncInitAndRegister<IMediaSettingsBloc>(mediaSettingsBloc);

    var toastSettingsBloc = ToastSettingsBloc(
      instanceLocalPreferencesBloc: guestToastSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: globalToastSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IToastSettingsBloc>(toastSettingsBloc);

    var postStatusSettingsBloc = PostStatusSettingsBloc(
      instanceLocalPreferencesBloc: guestPostStatusSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: globalPostStatusSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPostStatusSettingsBloc>(postStatusSettingsBloc);

    var statusSensitiveSettingsBloc = StatusSensitiveSettingsBloc(
      instanceLocalPreferencesBloc:
          guestStatusSensitiveSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          globalStatusSensitiveSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IStatusSensitiveSettingsBloc>(statusSensitiveSettingsBloc);

    var webSocketsSettingsBloc = WebSocketsSettingsBloc(
      instanceLocalPreferencesBloc: guestWebSocketsSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: globalWebSocketsSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IWebSocketsSettingsBloc>(webSocketsSettingsBloc);

    var paginationSettingsBloc = PaginationSettingsBloc(
      instanceLocalPreferencesBloc: guestPaginationSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: globalPaginationSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IPaginationSettingsBloc>(paginationSettingsBloc);

    var databaseCacheSettingsBloc = DatabaseCacheSettingsBloc(
      instanceLocalPreferencesBloc:
          guestDatabaseCacheSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc:
          globalDatabaseCacheSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService.asyncInitAndRegister<
        IDatabaseCacheSettingsBloc>(databaseCacheSettingsBloc);

    var filesCacheSettingsBloc = FilesCacheSettingsBloc(
      instanceLocalPreferencesBloc: guestFilesCacheSettingsLocalPreferencesBloc,
      globalLocalPreferencesBloc: globalFilesCacheSettingsLocalPreferencesBloc,
    )..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IFilesCacheSettingsBloc>(filesCacheSettingsBloc);

    var guestMyAccountBloc = GuestMyAccountBloc()..disposeWith(this);

    await globalProviderService
        .asyncInitAndRegister<IMyAccountBloc>(guestMyAccountBloc);
  }
}
