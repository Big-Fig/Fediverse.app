import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc_impl.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LocalInstanceTrendsBloc extends InstanceTrendsBloc
    implements IInstanceTrendsBloc {
  @override
  final IPleromaApiTrendsService pleromaApiTrendsService;

  LocalInstanceTrendsBloc({
    required IPleromaApiInstance? initialInstance,
    required this.pleromaApiTrendsService,
    required IPaginationSettingsBloc paginationSettingsBloc,
  }) : super(
          instanceUri: pleromaApiTrendsService.restService.baseUri,
          initialInstance: initialInstance,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  static LocalInstanceTrendsBloc createFromContext(BuildContext context) {
    var pleromaApiTrendsService =
        Provider.of<IPleromaApiTrendsService>(context, listen: false);
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    return LocalInstanceTrendsBloc(
      pleromaApiTrendsService: pleromaApiTrendsService,
      initialInstance: currentAuthInstanceBloc.currentInstance!.info,
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
