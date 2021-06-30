import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service_impl.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service_impl.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter/widgets.dart';

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
        connectionService: IConnectionService.of(
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
