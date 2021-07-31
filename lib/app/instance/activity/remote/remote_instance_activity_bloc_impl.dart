import 'package:fedi/app/instance/activity/instance_activity_bloc.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc_impl.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';

class RemoteInstanceActivityBloc extends InstanceActivityBloc
    implements IInstanceActivityBloc {
  final IRemoteInstanceBloc remoteInstanceBloc;

  @override
  final IPleromaApiInstanceService pleromaInstanceService;

  RemoteInstanceActivityBloc({
    required this.remoteInstanceBloc,
  })  : pleromaInstanceService = PleromaApiInstanceService(
          restService: remoteInstanceBloc.pleromaRestService,
        ),
        super(
          instance: null,
          instanceUri: remoteInstanceBloc.instanceUri,
        ) {
    addDisposable(pleromaInstanceService);
  }

  static RemoteInstanceActivityBloc createFromContext(BuildContext context) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(
      context,
      listen: false,
    );

    return RemoteInstanceActivityBloc(
      remoteInstanceBloc: remoteInstanceBloc,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProxyProvider<IRemoteInstanceBloc, IInstanceActivityBloc>(
        update: (context, value, previous) => RemoteInstanceActivityBloc(
          remoteInstanceBloc: value,
        ),
        child: InstanceActivityBlocProxyProvider(
          child: child,
        ),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
