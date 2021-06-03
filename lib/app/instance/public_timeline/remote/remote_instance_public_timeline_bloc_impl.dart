import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc_impl.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service_impl.dart';
import 'package:flutter/widgets.dart';

class RemoteInstancePublicTimelineBloc extends InstancePublicTimelineBloc
    implements IInstancePublicTimelineBloc {

  final IRemoteInstanceBloc remoteInstanceBloc;

  @override
  final IPleromaApiInstanceService pleromaInstanceService;

  RemoteInstancePublicTimelineBloc({
    required this.remoteInstanceBloc,
  })  : pleromaInstanceService = PleromaApiInstanceService(
          restService: remoteInstanceBloc.pleromaRestService,
        ),
        super(
          initialInstance: null,
          instanceUri: remoteInstanceBloc.instanceUri,
        ) {
    addDisposable(disposable: pleromaInstanceService);
  }

  static RemoteInstancePublicTimelineBloc createFromContext(BuildContext context) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(
      context,
      listen: false,
    );

    return RemoteInstancePublicTimelineBloc(
      remoteInstanceBloc: remoteInstanceBloc,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProxyProvider<IRemoteInstanceBloc, IInstancePublicTimelineBloc>(
        update: (context, value, previous) => RemoteInstancePublicTimelineBloc(
          remoteInstanceBloc: value,
        ),
        child: InstancePublicTimelineBlocProxyProvider(
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
