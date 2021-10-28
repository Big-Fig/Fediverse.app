import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_bloc_impl.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_bloc_proxy_provider.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalInstanceDirectoryBloc extends InstanceDirectoryBloc
    implements IInstanceDirectoryBloc {
  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  LocalInstanceDirectoryBloc({
    required IUnifediApiInstance? initialInstance,
    required this.unifediApiInstanceService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          instanceUri: Uri.parse(
              unifediApiInstanceService.restService.accessBloc.access.url),
          initialInstance: initialInstance,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  static LocalInstanceDirectoryBloc createFromContext(BuildContext context) {
    var unifediApiInstanceService =
        Provider.of<IUnifediApiInstanceService>(context, listen: false);
    var currentUnifediApiAccessBloc =
        ICurrentAccessBloc.of(context, listen: false);

    return LocalInstanceDirectoryBloc(
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
      DisposableProvider<IInstanceDirectoryBloc>(
        create: LocalInstanceDirectoryBloc.createFromContext,
        child: InstanceDirectoryBlocProxyProvider(child: child),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
