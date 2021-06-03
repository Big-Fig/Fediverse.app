import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc_impl.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service.dart';
import 'package:flutter/widgets.dart';

class LocalInstancePublicTimelineBloc extends InstancePublicTimelineBloc
    implements IInstancePublicTimelineBloc {
  @override
  final IPleromaApiInstanceService pleromaInstanceService;

  LocalInstancePublicTimelineBloc({
    required IPleromaApiInstance? initialInstance,
    required this.pleromaInstanceService,
  }) : super(
          instanceUri: pleromaInstanceService.restService.baseUri,
          initialInstance: initialInstance,
        );

  static LocalInstancePublicTimelineBloc createFromContext(BuildContext context) {
    var pleromaInstanceService =
        IPleromaApiInstanceService.of(context, listen: false);
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    return LocalInstancePublicTimelineBloc(
      pleromaInstanceService: pleromaInstanceService,
      initialInstance: currentAuthInstanceBloc.currentInstance!.info,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IInstancePublicTimelineBloc>(
      create: (context) => LocalInstancePublicTimelineBloc.createFromContext(context),
      child: InstancePublicTimelineBlocProxyProvider(child: child),
    );
  }

  @override
  // ignore: no-empty-block
  Future internalAsyncInit() async {
    // nothing here
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;


}
