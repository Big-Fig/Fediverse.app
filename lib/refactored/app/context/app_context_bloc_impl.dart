import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_local_preference_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_local_preference_bloc_impl.dart';
import 'package:fedi/refactored/app/context/app_context_bloc.dart';
import 'package:fedi/refactored/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/refactored/app/push/handler/push_handler_bloc_impl.dart';
import 'package:fedi/refactored/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc_impl.dart';
import 'package:fedi/refactored/connection/connection_service.dart';
import 'package:fedi/refactored/connection/connection_service_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service_hive_impl.dart';
import 'package:fedi/refactored/permission/camera_permission_bloc.dart';
import 'package:fedi/refactored/permission/camera_permission_bloc_impl.dart';
import 'package:fedi/refactored/permission/mic_permission_bloc.dart';
import 'package:fedi/refactored/permission/mic_permission_bloc_impl.dart';
import 'package:fedi/refactored/permission/permissions_service.dart';
import 'package:fedi/refactored/permission/permissions_service_impl.dart';
import 'package:fedi/refactored/permission/storage_permission_bloc.dart';
import 'package:fedi/refactored/permission/storage_permission_bloc_impl.dart';
import 'package:fedi/refactored/provider/provider_context_bloc_impl.dart';
import 'package:fedi/refactored/push/fcm/fcm_push_service.dart';
import 'package:fedi/refactored/push/fcm/fcm_push_service_impl.dart';
import 'package:fedi/refactored/push/relay/push_relay_service.dart';
import 'package:fedi/refactored/push/relay/push_relay_service_impl.dart';
import 'package:logging/logging.dart';

var _logger = Logger("app_context_bloc_impl.dart");

class AppContextBloc extends ProviderContextBloc implements IAppContextBloc {
  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
    var globalProviderService = this;

    var connectionService = ConnectionService();
    await globalProviderService
        .asyncInitAndRegister<IConnectionService>(connectionService);

    await globalProviderService
        .asyncInitAndRegister<IPermissionsService>(PermissionsService());

    var preferencesService = HiveLocalPreferencesService();
    await globalProviderService
        .asyncInitAndRegister<ILocalPreferencesService>(preferencesService);

    await globalProviderService.asyncInitAndRegister<ICameraPermissionBloc>(
        CameraPermissionBloc(globalProviderService.get<IPermissionsService>()));
    await globalProviderService.asyncInitAndRegister<IMicPermissionBloc>(
        MicPermissionBloc(globalProviderService.get<IPermissionsService>()));
    await globalProviderService.asyncInitAndRegister<IStoragePermissionBloc>(
        StoragePermissionBloc(
            globalProviderService.get<IPermissionsService>()));

    var instanceListLocalPreferenceBloc =
        AuthInstanceListLocalPreferenceBloc(preferencesService);
    await globalProviderService.asyncInitAndRegister<
        IAuthInstanceListLocalPreferenceBloc>(instanceListLocalPreferenceBloc);

    var instanceListBloc = AuthInstanceListBloc(
        instanceListLocalPreferenceBloc: instanceListLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IAuthInstanceListBloc>(instanceListBloc);

    var currentInstanceLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(preferencesService);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAuthInstanceLocalPreferenceBloc>(
            currentInstanceLocalPreferenceBloc);

    var currentInstanceBloc = CurrentAuthInstanceBloc(
        instanceListBloc: instanceListBloc,
        currentInstanceLocalPreferenceBloc: currentInstanceLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAuthInstanceBloc>(currentInstanceBloc);

    var pushRelayService =
        PushRelayService(pushRelayBaseUrl: "https://pushrelay3.your.org/push/");
    addDisposable(disposable: pushRelayService);
    await globalProviderService
        .asyncInitAndRegister<IPushRelayService>(pushRelayService);

    var fcmPushService = FcmPushService();
    await globalProviderService
        .asyncInitAndRegister<IFcmPushService>(fcmPushService);

    var pushHandlerUnhandledLocalPreferencesBloc =
        PushHandlerUnhandledLocalPreferencesBloc(preferencesService);

    await globalProviderService
        .asyncInitAndRegister<IPushHandlerUnhandledLocalPreferencesBloc>(
            pushHandlerUnhandledLocalPreferencesBloc);

    var pushHandler = PushHandlerBloc(
        currentInstanceBloc: currentInstanceBloc,
        instanceListBloc: instanceListBloc,
        unhandledLocalPreferencesBloc: pushHandlerUnhandledLocalPreferencesBloc,
        fcmPushService: fcmPushService);
    await globalProviderService
        .asyncInitAndRegister<IPushHandlerBloc>(pushHandler);
  }
}
