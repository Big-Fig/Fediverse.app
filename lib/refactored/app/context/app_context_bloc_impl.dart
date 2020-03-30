import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_local_preference_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/instance_list_local_preference_bloc_impl.dart';
import 'package:fedi/refactored/app/context/app_context_bloc.dart';
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
        InstanceListLocalPreferenceBloc(preferencesService);
    await globalProviderService.asyncInitAndRegister<
        IInstanceListLocalPreferenceBloc>(instanceListLocalPreferenceBloc);

    var instanceListBloc = InstanceListBloc(
        instanceListLocalPreferenceBloc: instanceListLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IInstanceListBloc>(instanceListBloc);

    var currentInstanceLocalPreferenceBloc =
        CurrentInstanceLocalPreferenceBloc(preferencesService);
    await globalProviderService
        .asyncInitAndRegister<ICurrentInstanceLocalPreferenceBloc>(
            currentInstanceLocalPreferenceBloc);

    await globalProviderService.asyncInitAndRegister<ICurrentInstanceBloc>(
        CurrentInstanceBloc(
            instanceListBloc: instanceListBloc,
            currentInstanceLocalPreferenceBloc:
                currentInstanceLocalPreferenceBloc));
  }
}
