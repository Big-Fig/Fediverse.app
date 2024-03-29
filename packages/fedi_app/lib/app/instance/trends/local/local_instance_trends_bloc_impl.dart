import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/trends/instance_trends_bloc.dart';
import 'package:fedi_app/app/instance/trends/instance_trends_bloc_impl.dart';
import 'package:fedi_app/app/instance/trends/instance_trends_bloc_proxy_provider.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

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
        ICurrentAccessBloc.of(context, listen: false);

    return LocalInstanceTrendsBloc(
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      unifediApiInstanceService: unifediApiInstanceService,
      initialInstance: currentUnifediApiAccessBloc.currentInstance!.instance,
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
      DisposableProvider<IInstanceTrendsBloc>(
        create: LocalInstanceTrendsBloc.createFromContext,
        child: InstanceTrendsBlocProxyProvider(child: child),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
