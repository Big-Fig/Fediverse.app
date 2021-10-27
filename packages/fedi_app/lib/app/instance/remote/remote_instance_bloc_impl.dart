import 'package:fedi_app/app/access/memory_access_bloc_impl.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteInstanceBloc extends AsyncInitLoadingBloc
    implements IRemoteInstanceBloc {
  @override
  final Uri instanceUri;

  final IConnectionService connectionService;
  final IConfigService configService;

  @override
  // ignore: avoid-late-keyword
  late IUnifediApiManager unifediApiManager;

  RemoteInstanceBloc({
    required this.instanceUri,
    required this.connectionService,
    required this.configService,
    required this.unifediApiInstance,
  });

  static RemoteInstanceBloc createFromContext(
    BuildContext context, {
    required Uri instanceUri,
  }) =>
      RemoteInstanceBloc(
        instanceUri: instanceUri,
        configService: IConfigService.of(
          context,
          listen: false,
        ),
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        unifediApiInstance: null,
      );

  @override
  IUnifediApiInstance? unifediApiInstance;

  @override
  Future<void> internalAsyncInit() async {
    var typeDetectorBloc = UnifediApiInstanceTypeDetectorBloc();

    var instanceType = await typeDetectorBloc.detectInstanceType(
      url: instanceUri.toString(),
    );

    var unifediApiAccessBloc = MemoryAccessBloc(
      configService: configService,
      access: UnifediApiAccess(
        url: instanceUri.toString(),
        instance: null,
        userAccessToken: null,
        applicationAccessToken: null,
      ),
    );

    var webSocketsModeSettingsBloc = WebSocketsModeSettingsBloc(
      mode: WebSocketsMode.disabledValue,
    );

    unifediApiManager = instanceType.createApiManager(
      apiAccessBloc: unifediApiAccessBloc,
      computeImpl: null,
      webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
    );
    unifediApiManager.addDisposable(
      unifediApiAccessBloc,
    );

    var apiInstanceService = unifediApiManager.createInstanceService();
    unifediApiInstance = await apiInstanceService.getInstance();

    await typeDetectorBloc.dispose();
    await webSocketsModeSettingsBloc.dispose();
    await apiInstanceService.dispose();
  }
}
