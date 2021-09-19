import 'package:fedi/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc_impl.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';

class RemoteInstanceDirectoryBloc extends InstanceDirectoryBloc
    implements IInstanceDirectoryBloc {
  final IRemoteInstanceBloc remoteInstanceBloc;

  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  RemoteInstanceDirectoryBloc({
    required this.remoteInstanceBloc,
    required IPaginationSettingsBloc paginationSettingsBloc,
  })  : unifediApiInstanceService = remoteInstanceBloc.unifediApiManager.createInstanceService(),
        super(
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
