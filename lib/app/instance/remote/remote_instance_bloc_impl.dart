import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RemoteInstanceBloc extends AsyncInitLoadingBloc
    implements IRemoteInstanceBloc {
  @override
  final Uri instanceUri;

  final IConnectionService connectionService;

  final RestService restService;
  @override
  // ignore: avoid-late-keyword
  late PleromaApiRestService pleromaRestService;

  RemoteInstanceBloc({
    required this.instanceUri,
    required this.connectionService,
    required this.pleromaApiInstance,
  }) : restService = RestService(
          baseUri: instanceUri,
        ) {
    pleromaRestService = PleromaApiRestService(
      connectionService: connectionService,
      restService: restService,
    );

    addDisposable(restService);
    addDisposable(pleromaRestService);
  }

  static RemoteInstanceBloc createFromContext(
    BuildContext context, {
    required Uri instanceUri,
  }) =>
      RemoteInstanceBloc(
        instanceUri: instanceUri,
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        pleromaApiInstance: null,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required Uri instanceUri,
  }) =>
      DisposableProvider<IRemoteInstanceBloc>(
        create: (context) => createFromContext(
          context,
          instanceUri: instanceUri,
        ),
        child: child,
      );

  @override
  IPleromaApiInstance? pleromaApiInstance;

  @override
  Future internalAsyncInit() async {
    if (pleromaApiInstance == null) {
      var pleromaApiInstanceService =
          PleromaApiInstanceService(restService: pleromaRestService);

      pleromaApiInstance = await pleromaApiInstanceService.getInstance();

      await pleromaApiInstanceService.dispose();
    }
  }
}
