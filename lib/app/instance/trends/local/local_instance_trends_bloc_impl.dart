import 'package:fedi/app/access/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc_impl.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:fediverse_api/fediverse_api.dart';

class LocalInstanceTrendsBloc extends InstanceTrendsBloc
    implements IInstanceTrendsBloc {
  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  LocalInstanceTrendsBloc({
    required IUnifediApiInstance? initialInstance,
    required this.unifediApiInstanceService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          instanceUri:
              unifediApiInstanceService.restService.accessBloc.access.uri,
          initialInstance: initialInstance,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  static LocalInstanceTrendsBloc createFromContext(BuildContext context) {
    var unifediApiInstanceService =
        Provider.of<IUnifediApiInstanceService>(context, listen: false);
    var currentUnifediApiAccessBloc =
        ICurrentUnifediApiAccessBloc.of(context, listen: false);

    return LocalInstanceTrendsBloc(
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      unifediApiInstanceService: unifediApiInstanceService,
      initialInstance: currentUnifediApiAccessBloc.currentInstance!.info,
      paginationSettingsBloc: IPaginationSettingsBloc.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IInstanceTrendsBloc>(
      create: (context) => LocalInstanceTrendsBloc.createFromContext(context),
      child: InstanceTrendsBlocProxyProvider(child: child),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
