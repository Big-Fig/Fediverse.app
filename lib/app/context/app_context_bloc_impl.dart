import 'package:fedi/DeepLinks/DeepLinkHelper.dart';
import 'package:fedi/Pages/Push/PushHelper.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service_impl.dart';
import 'package:fedi/Pleroma/account/pleroma_account_service.dart';
import 'package:fedi/Pleroma/account/pleroma_account_service_impl.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service_impl.dart';
import 'package:fedi/Pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/Pleroma/rest/auth/pleroma_auth_rest_service_impl.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/connection/connection_service_impl.dart';
import 'package:fedi/database/moor/moor_database_service_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/local_preferences_service_hive_impl.dart';
import 'package:fedi/permission/camera_permission_bloc.dart';
import 'package:fedi/permission/camera_permission_bloc_impl.dart';
import 'package:fedi/permission/mic_permission_bloc.dart';
import 'package:fedi/permission/mic_permission_bloc_impl.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:fedi/permission/permissions_service_impl.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc_impl.dart';
import 'package:fedi/provider/provider_context_bloc_impl.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("app_context_bloc_impl.dart");

class AppContextBloc extends ProviderContextBloc {
  static AppContextBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<AppContextBloc>(context, listen: listen);

  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");
    var globalProviderService = this;

    var connectionService = ConnectionService();
    await globalProviderService
        .asyncInitAndRegister<IConnectionService>(connectionService);

    var moorDatabaseService = MoorDatabaseService();
    await globalProviderService
        .asyncInitAndRegister<MoorDatabaseService>(moorDatabaseService);

    await globalProviderService
        .asyncInitAndRegister<DeepLinkHelper>(DeepLinkHelper());
    await globalProviderService.asyncInitAndRegister<PushHelper>(PushHelper());

    await globalProviderService
        .asyncInitAndRegister<IPermissionsService>(PermissionsService());
    var restService = RestService();
    await globalProviderService.asyncInitAndRegister<IRestService>(restService);
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

    var pleromaRestService = PleromaRestService(
        restService: restService, connectionService: connectionService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaRestService>(pleromaRestService);

    var pleromaAuthRestService = PleromaAuthRestService(
        restService: restService, connectionService: connectionService);
    await globalProviderService
        .asyncInitAndRegister<IPleromaAuthRestService>(pleromaAuthRestService);

    await globalProviderService
        .asyncInitAndRegister<IPleromaMediaAttachmentService>(
            PleromaMediaAttachmentService(restService: pleromaAuthRestService));
    await globalProviderService
        .asyncInitAndRegister<IPleromaAccountEditService>(
            PleromaAccountEditService(restService: pleromaAuthRestService));
    await globalProviderService.asyncInitAndRegister<IPleromaAccountService>(
        PleromaAccountService(restService: pleromaAuthRestService));
    await globalProviderService.asyncInitAndRegister<IPleromaTimelineService>(
        PleromaTimelineService(restService: pleromaAuthRestService));

    var accountRepository =
        AccountRepository(appDatabase: moorDatabaseService.appDatabase);
    await globalProviderService
        .asyncInitAndRegister<IAccountRepository>(accountRepository);

    var statusRepository = StatusRepository(
        appDatabase: moorDatabaseService.appDatabase,
        accountRepository: accountRepository);
    await globalProviderService
        .asyncInitAndRegister<IStatusRepository>(statusRepository);
  }
}
