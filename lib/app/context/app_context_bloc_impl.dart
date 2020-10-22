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
import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:fedi/app/hive/hive_service.dart';
import 'package:fedi/app/hive/hive_service_impl.dart';
import 'package:fedi/app/local_prefernces/fedi_local_preferences_service_migration_bloc_impl.dart';
import 'package:fedi/app/localization/localization_service.dart';
import 'package:fedi/app/localization/localization_service_impl.dart';
import 'package:fedi/app/logging/logging_service.dart';
import 'package:fedi/app/logging/logging_service_impl.dart';
import 'package:fedi/app/media/picker/media_picker_service.dart';
import 'package:fedi/app/media/picker/media_picker_service_impl.dart';
import 'package:fedi/app/package_info/package_info_helper.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/app/push/handler/push_handler_bloc_impl.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc_impl.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/app/share/external/external_share_service_impl.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc_impl.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
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
import 'package:fedi/ui/theme/current/current_ui_theme_id_local_preference_bloc.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_id_local_preference_bloc_impl.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_handler_bloc.dart';
import 'package:fedi/ui/theme/system/brightness/ui_theme_system_brightness_handler_bloc_impl.dart';
import 'package:fedi/websockets/websockets_service.dart';
import 'package:fedi/websockets/websockets_service_impl.dart';
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
    var localizationService = LocalizationService();
    await globalProviderService
        .asyncInitAndRegister<ILocalizationService>(localizationService);

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

    var localPreferencesService = SharedPreferencesLocalPreferencesService();

    await localPreferencesService.performAsyncInit();

    final sharedPreferencesStorageExist =
        await localPreferencesService.isStorageExist();
    _logger.finest(() =>
        "sharedPreferencesStorageExist == ${sharedPreferencesStorageExist}}");
    if (!sharedPreferencesStorageExist) {
      var hivePreferencesService =
          HiveLocalPreferencesService(boxName: "local_preferences");
      await hivePreferencesService.performAsyncInit();
      var hivePreferencesExist = await hivePreferencesService.isStorageExist();
      _logger.finest(() => "hivePreferencesExist == ${hivePreferencesExist}");
      if (hivePreferencesExist) {
        var migrationBloc = FediLocalPreferencesServiceMigrationBloc(
          inputService: hivePreferencesService,
          outputService: localPreferencesService,
        );

        await migrationBloc.migrateData();
        await hivePreferencesService.clearAllValuesAndDeleteStorage();
      }

      await localPreferencesService.putStorageCreatedKey();
    }

    await globalProviderService.asyncInitAndRegister<ILocalPreferencesService>(
        localPreferencesService);

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
            localPreferencesService);
    await globalProviderService.asyncInitAndRegister<
            IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc);

    var instanceListLocalPreferenceBloc =
        AuthInstanceListLocalPreferenceBloc(localPreferencesService);
    await globalProviderService.asyncInitAndRegister<
        IAuthInstanceListLocalPreferenceBloc>(instanceListLocalPreferenceBloc);

    var instanceListBloc = AuthInstanceListBloc(
        instanceListLocalPreferenceBloc: instanceListLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IAuthInstanceListBloc>(instanceListBloc);

    var currentInstanceLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(localPreferencesService);
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
        PushHandlerUnhandledLocalPreferencesBloc(localPreferencesService);

    await globalProviderService
        .asyncInitAndRegister<IPushHandlerUnhandledLocalPreferencesBloc>(
            pushHandlerUnhandledLocalPreferencesBloc);

    var pushHandlerBloc = PushHandlerBloc(
        currentInstanceBloc: currentInstanceBloc,
        instanceListBloc: instanceListBloc,
        unhandledLocalPreferencesBloc: pushHandlerUnhandledLocalPreferencesBloc,
        fcmPushService: fcmPushService);
    await globalProviderService
        .asyncInitAndRegister<IPushHandlerBloc>(pushHandlerBloc);

    var webSocketsService = WebSocketsService();
    await globalProviderService
        .asyncInitAndRegister<IWebSocketsService>(webSocketsService);

    var currentUiThemeIdLocalPreferenceBloc =
        CurrentUiThemeIdLocalPreferenceBloc(localPreferencesService);

    await globalProviderService
        .asyncInitAndRegister<ICurrentUiThemeIdLocalPreferenceBloc>(
            currentUiThemeIdLocalPreferenceBloc);

    var currentFediUiThemeBloc = CurrentFediUiThemeBloc(
      currentUiThemeIdLocalPreferenceBloc: currentUiThemeIdLocalPreferenceBloc,
      availableThemes: [
        lightFediUiTheme,
        darkFediUiTheme,
      ],
    );

    await globalProviderService
        .asyncInitAndRegister<ICurrentFediUiThemeBloc>(currentFediUiThemeBloc);

    var uiThemeSystemHandlerBloc = UiThemeSystemBrightnessHandlerBloc();

    await globalProviderService.asyncInitAndRegister<
        IUiThemeSystemBrightnessHandlerBloc>(uiThemeSystemHandlerBloc);
  }
}
