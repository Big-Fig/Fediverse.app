import 'package:fedi/app/instance/trends/instance_trends_bloc.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc_impl.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';

class RemoteInstanceTrendsBloc extends InstanceTrendsBloc
    implements IInstanceTrendsBloc {
  final IRemoteInstanceBloc remoteInstanceBloc;

  @override
  final IUnifediApiInstanceService UnifediApiInstanceService;

  RemoteInstanceTrendsBloc({
    required this.remoteInstanceBloc,
    required IPaginationSettingsBloc paginationSettingsBloc,
  })  : UnifediApiInstanceService = UnifediApiInstanceService(
          restService: remoteInstanceBloc.unifediApiRestService,
        ),
        super(
          initialInstance: null,
          instanceUri: remoteInstanceBloc.instanceUri,
          paginationSettingsBloc: paginationSettingsBloc,
        ) {
    addDisposable(UnifediApiInstanceService);
  }

  static RemoteInstanceTrendsBloc createFromContext(BuildContext context) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(
      context,
      listen: false,
    );

    return RemoteInstanceTrendsBloc(
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
      DisposableProxyProvider<IRemoteInstanceBloc, IInstanceTrendsBloc>(
        update: (context, value, previous) => RemoteInstanceTrendsBloc(
          remoteInstanceBloc: value,
          paginationSettingsBloc: IPaginationSettingsBloc.of(
            context,
            listen: false,
          ),
        ),
        child: InstanceTrendsBlocProxyProvider(
          child: child,
        ),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
