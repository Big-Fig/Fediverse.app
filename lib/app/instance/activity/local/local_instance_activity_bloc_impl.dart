import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc_impl.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service.dart';
import 'package:flutter/widgets.dart';

class LocalInstanceActivityBloc extends InstanceActivityBloc
    implements IInstanceActivityBloc {
  @override
  final IPleromaApiInstanceService pleromaInstanceService;

  LocalInstanceActivityBloc({
    required IPleromaApiInstance instance,
    required this.pleromaInstanceService,
  }) : super(
          instanceUri: pleromaInstanceService.restService.baseUri,
          instance: instance,
        );

  static LocalInstanceActivityBloc createFromContext(BuildContext context) {
    var pleromaInstanceService =
        IPleromaApiInstanceService.of(context, listen: false);
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    return LocalInstanceActivityBloc(
      pleromaInstanceService: pleromaInstanceService,
      instance: currentAuthInstanceBloc.currentInstance!.info!,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IInstanceActivityBloc>(
      create: (context) => LocalInstanceActivityBloc.createFromContext(context),
      child: InstanceActivityBlocProxyProvider(child: child),
    );
  }


  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
