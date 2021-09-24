import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/memory_access_bloc_impl.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteInstanceBloc extends AsyncInitLoadingBloc
    implements IRemoteInstanceBloc {
  @override
  final Uri instanceUri;

  final IConnectionService connectionService;

  @override
  // ignore: avoid-late-keyword
  late IUnifediApiManager unifediApiManager;

  RemoteInstanceBloc({
    required this.instanceUri,
    required this.connectionService,
    required this.unifediApiInstance,
  });

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
        unifediApiInstance: null,
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
  IUnifediApiInstance? unifediApiInstance;

  @override
  Future internalAsyncInit() async {
    var typeDetectorBloc = UnifediApiInstanceTypeDetectorBloc();

    var instanceType = await typeDetectorBloc.detectInstanceType(
      url: instanceUri.toString(),
    );

    var unifediApiAccessBloc = MemoryUnifediApiAccessBloc(
      access: UnifediApiAccess(
        url: instanceUri.toString(),
        instance: null,
        userAccessToken: null,
        applicationAccessToken: null,
      ),
    );
    unifediApiManager = instanceType.createApiManager(
      apiAccessBloc: unifediApiAccessBloc,
      computeImpl: null,
    );
    unifediApiManager.addDisposable(
      unifediApiAccessBloc,
    );

    var apiInstanceService = unifediApiManager.createInstanceService();
    unifediApiInstance = await apiInstanceService.getInstance();
    await typeDetectorBloc.dispose();

    await apiInstanceService.dispose();
  }
}
