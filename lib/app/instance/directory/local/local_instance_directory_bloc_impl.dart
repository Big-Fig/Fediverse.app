import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc_impl.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LocalInstanceDirectoryBloc extends InstanceDirectoryBloc
    implements IInstanceDirectoryBloc {
  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  LocalInstanceDirectoryBloc({
    required IUnifediApiInstance? initialInstance,
    required this.unifediApiInstanceService,
    required IPaginationSettingsBloc paginationSettingsBloc,
  }) : super(
          instanceUri: unifediApiInstanceService.restService.baseUri,
          initialInstance: initialInstance,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  static LocalInstanceDirectoryBloc createFromContext(BuildContext context) {
    var unifediApiInstanceService =
        Provider.of<IUnifediApiInstanceService>(context, listen: false);
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    return LocalInstanceDirectoryBloc(
      unifediApiInstanceService: unifediApiInstanceService,
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
    return DisposableProvider<IInstanceDirectoryBloc>(
      create: (context) =>
          LocalInstanceDirectoryBloc.createFromContext(context),
      child: InstanceDirectoryBlocProxyProvider(child: child),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
