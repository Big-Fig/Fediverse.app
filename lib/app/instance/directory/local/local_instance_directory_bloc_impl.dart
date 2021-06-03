import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc_impl.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/directory/pleroma_api_directory_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:flutter/widgets.dart';

class LocalInstanceDirectoryBloc extends InstanceDirectoryBloc
    implements IInstanceDirectoryBloc {
  @override
  final IPleromaApiDirectoryService pleromaApiDirectoryService;

  LocalInstanceDirectoryBloc({
    required IPleromaApiInstance? initialInstance,
    required this.pleromaApiDirectoryService,
    required IPaginationSettingsBloc paginationSettingsBloc,
  }) : super(
          instanceUri: pleromaApiDirectoryService.restService.baseUri,
          initialInstance: initialInstance,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  static LocalInstanceDirectoryBloc createFromContext(BuildContext context) {
    var pleromaApiDirectoryService =
        IPleromaApiDirectoryService.of(context, listen: false);
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    return LocalInstanceDirectoryBloc(
      pleromaApiDirectoryService: pleromaApiDirectoryService,
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
