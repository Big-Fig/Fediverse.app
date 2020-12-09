import 'package:fedi/app/analytics/analytics_service.dart';
import 'package:fedi/app/analytics/analytics_service_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc_impl.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_local_preference_bloc_impl.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preferences_bloc.dart';
import 'package:fedi/app/chat/settings/local_preferences/global/global_chat_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:fedi/app/hive/hive_service.dart';
import 'package:fedi/app/hive/hive_service_impl.dart';
import 'package:fedi/app/local_preferences/fedi_local_preferences_service_migration_bloc_impl.dart';
import 'package:fedi/app/localization/settings/local_preference/global/global_localization_settings_local_preferences_bloc.dart';
import 'package:fedi/app/localization/settings/local_preference/global/global_localization_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/localization/settings/local_preference/localization_settings_local_preferences_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc_impl.dart';
import 'package:fedi/app/logging/logging_service.dart';
import 'package:fedi/app/logging/logging_service_impl.dart';
import 'package:fedi/app/media/picker/media_picker_service.dart';
import 'package:fedi/app/media/picker/media_picker_service_impl.dart';
import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preferences_bloc.dart';
import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/package_info/package_info_helper.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/app/push/handler/push_handler_bloc_impl.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc_impl.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/app/share/external/external_share_service_impl.dart';
import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preferences_bloc.dart';
import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/ui/settings/local_preference/ui_settings_local_preferences_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc_impl.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc_impl.dart';
import 'package:fedi/app/ui/theme/dark/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preferences_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/connection/connection_service_impl.dart';
import 'package:fedi/local_preferences/hive_local_preferences_service_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/shared_preferences_local_preferences_service_impl.dart';
import 'package:fedi/permission/camera_permission_bloc.dart';
import 'package:fedi/permission/camera_permission_bloc_impl.dart';
import 'package:fedi/permission/mic_permission_bloc.dart';
import 'package:fedi/permission/mic_permission_bloc_impl.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:fedi/permission/permissions_service_impl.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc_impl.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc_impl.dart';
import 'package:fedi/provider/provider_context_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/fcm/fcm_push_service_impl.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:fedi/push/relay/push_relay_service_impl.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_bloc.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_bloc_impl.dart';
import 'package:logging/logging.dart';

var _logger = Logger("app_context_bloc_impl.dart");

class AppContextBloc extends ProviderContextBloc implements IAppContextBloc {
  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");

    var globalProviderService = this;

    var loggingService = LoggingService();
    await globalProviderService
        .asyncInitAndRegister<ILoggingService>(loggingService);

    var hiveService = HiveService();
    await globalProviderService.asyncInitAndRegister<IHiveService>(hiveService);

    var analyticsService = AnalyticsService();

    await globalProviderService
        .asyncInitAndRegister<IAnalyticsService>(analyticsService);

    var externalShareService = ExternalShareService();

    await globalProviderService
        .asyncInitAndRegister<IExternalShareService>(externalShareService);

    var connectionService = ConnectionService();
    await globalProviderService
        .asyncInitAndRegister<IConnectionService>(connectionService);
    var mediaPickerService = MediaPickerService();
    await globalProviderService
        .asyncInitAndRegister<IMediaPickerService>(mediaPickerService);

    await globalProviderService
        .asyncInitAndRegister<IPermissionsService>(PermissionsService());

    var hiveLocalPreferencesService =
        HiveLocalPreferencesService(boxName: "local_preferences_v2");
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
          "sharedPreferencesStorageExist == ${sharedPreferencesStorageExist}}");

      var sharedPreferencesLocalPreferencesServiceExist =
          await sharedPreferencesLocalPreferencesService.isStorageExist();
      _logger.finest(() => "sharedPreferencesLocalPreferencesServiceExist =="
          " ${sharedPreferencesLocalPreferencesServiceExist}");
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
        hiveLocalPreferencesService);

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

    var pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc =
        PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
            hiveLocalPreferencesService);
    await globalProviderService.asyncInitAndRegister<
            IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc);

    var instanceListLocalPreferenceBloc =
        AuthInstanceListLocalPreferenceBloc(hiveLocalPreferencesService);
    await globalProviderService.asyncInitAndRegister<
        IAuthInstanceListLocalPreferenceBloc>(instanceListLocalPreferenceBloc);

    var instanceListBloc = AuthInstanceListBloc(
        instanceListLocalPreferenceBloc: instanceListLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IAuthInstanceListBloc>(instanceListBloc);

    var currentInstanceLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(hiveLocalPreferencesService);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAuthInstanceLocalPreferenceBloc>(
            currentInstanceLocalPreferenceBloc);

    var currentInstanceBloc = CurrentAuthInstanceBloc(
        instanceListBloc: instanceListBloc,
        currentLocalPreferenceBloc: currentInstanceLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAuthInstanceBloc>(currentInstanceBloc);

    String pushRelayBaseUrl;
    if (await FediPackageInfoHelper.isProdPackageId()) {
      pushRelayBaseUrl = "https://pushrelay3.your.org/push/";
    } else if (await FediPackageInfoHelper.isDevPackageId()) {
      pushRelayBaseUrl = "https://pushrelay.jff.name/push/";
    } else {
      var packageName = await FediPackageInfoHelper.getPackageId();
      throw "Invalid packageName $packageName";
    }

    var pushRelayService = PushRelayService(pushRelayBaseUrl: pushRelayBaseUrl);
    addDisposable(disposable: pushRelayService);
    await globalProviderService
        .asyncInitAndRegister<IPushRelayService>(pushRelayService);

    var fcmPushService = FcmPushService();
    await globalProviderService
        .asyncInitAndRegister<IFcmPushService>(fcmPushService);

    var pushHandlerUnhandledLocalPreferencesBloc =
        PushHandlerUnhandledLocalPreferencesBloc(hiveLocalPreferencesService);

    await globalProviderService
        .asyncInitAndRegister<IPushHandlerUnhandledLocalPreferencesBloc>(
            pushHandlerUnhandledLocalPreferencesBloc);
    addDisposable(disposable: pushHandlerUnhandledLocalPreferencesBloc);
    var pushHandlerBloc = PushHandlerBloc(
        currentInstanceBloc: currentInstanceBloc,
        instanceListBloc: instanceListBloc,
        unhandledLocalPreferencesBloc: pushHandlerUnhandledLocalPreferencesBloc,
        fcmPushService: fcmPushService);
    await globalProviderService
        .asyncInitAndRegister<IPushHandlerBloc>(pushHandlerBloc);
    addDisposable(disposable: pushHandlerBloc);

    var globalUiSettingsLocalPreferencesBloc =
        GlobalUiSettingsLocalPreferencesBloc(hiveLocalPreferencesService);

    await globalProviderService
        .asyncInitAndRegister<IGlobalUiSettingsLocalPreferencesBloc>(
            globalUiSettingsLocalPreferencesBloc);
    await globalProviderService.asyncInitAndRegister<
        IUiSettingsLocalPreferencesBloc>(globalUiSettingsLocalPreferencesBloc);
    addDisposable(disposable: globalUiSettingsLocalPreferencesBloc);

    var uiSettingsBloc = UiSettingsBloc(
      uiSettingsLocalPreferencesBloc: globalUiSettingsLocalPreferencesBloc,
    );

    await globalProviderService
        .asyncInitAndRegister<IUiSettingsBloc>(uiSettingsBloc);
    addDisposable(disposable: uiSettingsBloc);

    var uiThemeSystemBrightnessBloc = UiThemeSystemBrightnessBloc();

    await globalProviderService.asyncInitAndRegister<
        IUiThemeSystemBrightnessBloc>(uiThemeSystemBrightnessBloc);
    addDisposable(disposable: uiThemeSystemBrightnessBloc);

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

    var globalLocalizationSettingsLocalPreferencesBloc =
        GlobalLocalizationSettingsLocalPreferencesBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<ILocalizationSettingsLocalPreferencesBloc>(
            globalLocalizationSettingsLocalPreferencesBloc);
    await globalProviderService
        .asyncInitAndRegister<IGlobalLocalizationSettingsLocalPreferencesBloc>(
            globalLocalizationSettingsLocalPreferencesBloc);
    addDisposable(disposable: globalLocalizationSettingsLocalPreferencesBloc);

    var localizationSettingsBloc = LocalizationSettingsBloc(
      localizationSettingsLocalPreferencesBloc:
          globalLocalizationSettingsLocalPreferencesBloc,
    );

    await globalProviderService.asyncInitAndRegister<ILocalizationSettingsBloc>(
        localizationSettingsBloc);
    addDisposable(disposable: localizationSettingsBloc);

    var globalChatSettingsLocalPreferencesBloc =
        GlobalChatSettingsLocalPreferencesBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalChatSettingsLocalPreferencesBloc>(
            globalChatSettingsLocalPreferencesBloc);
    addDisposable(disposable: globalChatSettingsLocalPreferencesBloc);

    var globalMediaSettingsLocalPreferencesBloc =
        GlobalMediaSettingsLocalPreferencesBloc(
      hiveLocalPreferencesService,
    );
    await globalProviderService
        .asyncInitAndRegister<IGlobalMediaSettingsLocalPreferencesBloc>(
            globalMediaSettingsLocalPreferencesBloc);
    addDisposable(disposable: globalMediaSettingsLocalPreferencesBloc);

    var globalToastSettingsLocalPreferencesBloc =
        GlobalToastSettingsLocalPreferencesBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalToastSettingsLocalPreferencesBloc>(
            globalToastSettingsLocalPreferencesBloc);
    addDisposable(disposable: globalToastSettingsLocalPreferencesBloc);

    var globalPostStatusSettingsLocalPreferencesBloc =
        GlobalPostStatusSettingsLocalPreferencesBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalPostStatusSettingsLocalPreferencesBloc>(
            globalPostStatusSettingsLocalPreferencesBloc);
    addDisposable(disposable: globalPostStatusSettingsLocalPreferencesBloc);

    var globalStatusSensitiveSettingsLocalPreferencesBloc =
        GlobalStatusSensitiveSettingsLocalPreferencesBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService.asyncInitAndRegister<
            IGlobalStatusSensitiveSettingsLocalPreferencesBloc>(
        globalStatusSensitiveSettingsLocalPreferencesBloc);
    addDisposable(
        disposable: globalStatusSensitiveSettingsLocalPreferencesBloc);

    var globalWebSocketsSettingsLocalPreferencesBloc =
        GlobalWebSocketsSettingsLocalPreferencesBloc(
      hiveLocalPreferencesService,
    );

    await globalProviderService
        .asyncInitAndRegister<IGlobalWebSocketsSettingsLocalPreferencesBloc>(
            globalWebSocketsSettingsLocalPreferencesBloc);
    addDisposable(disposable: globalWebSocketsSettingsLocalPreferencesBloc);
  }
}
