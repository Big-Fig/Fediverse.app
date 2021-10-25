import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_bloc_impl.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_bloc_proxy_provider.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteInstanceDirectoryBloc extends InstanceDirectoryBloc
    implements IInstanceDirectoryBloc {
  final IRemoteInstanceBloc remoteInstanceBloc;

  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  RemoteInstanceDirectoryBloc({
    required this.remoteInstanceBloc,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required IConnectionService connectionService,
  })  : unifediApiInstanceService =
            remoteInstanceBloc.unifediApiManager.createInstanceService(),
        super(
          connectionService: connectionService,
          initialInstance: null,
          instanceUri: remoteInstanceBloc.instanceUri,
          paginationSettingsBloc: paginationSettingsBloc,
        ) {
    addDisposable(unifediApiInstanceService);
  }

  static RemoteInstanceDirectoryBloc createFromContext(BuildContext context) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(
      context,
      listen: false,
    );

    return RemoteInstanceDirectoryBloc(
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      remoteInstanceBloc: remoteInstanceBloc,
      paginationSettingsBloc: IPaginationSettingsBloc.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProxyProvider<IRemoteInstanceBloc, IInstanceDirectoryBloc>(
        update: (context, value, previous) => RemoteInstanceDirectoryBloc(
          connectionService: Provider.of<IConnectionService>(
            context,
            listen: false,
          ),
          remoteInstanceBloc: value,
          paginationSettingsBloc: IPaginationSettingsBloc.of(
            context,
            listen: false,
          ),
        ),
        child: InstanceDirectoryBlocProxyProvider(
          child: child,
        ),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
