import 'package:fedi/app/instance/details/instance_details_bloc.dart';
import 'package:fedi/app/instance/details/instance_details_bloc_impl.dart';
import 'package:fedi/app/instance/details/instance_details_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';

class RemoteInstanceDetailsBloc extends InstanceDetailsBloc
    implements IInstanceDetailsBloc {
  final IRemoteInstanceBloc remoteInstanceBloc;

  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  RemoteInstanceDetailsBloc({
    required this.remoteInstanceBloc,
  })  : unifediApiInstanceService =
            remoteInstanceBloc.unifediApiManager.createInstanceService(),
        super(
          initialInstance: null,
          instanceUri: remoteInstanceBloc.instanceUri,
        ) {
    addDisposable(unifediApiInstanceService);
  }

  static RemoteInstanceDetailsBloc createFromContext(BuildContext context) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(
      context,
      listen: false,
    );

    return RemoteInstanceDetailsBloc(
      remoteInstanceBloc: remoteInstanceBloc,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProxyProvider<IRemoteInstanceBloc, IInstanceDetailsBloc>(
        update: (context, value, previous) => RemoteInstanceDetailsBloc(
          remoteInstanceBloc: value,
        ),
        child: InstanceDetailsBlocProxyProvider(
          child: child,
        ),
      );

  @override
  Future internalAsyncInit() => refresh();

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
