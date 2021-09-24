import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc_impl.dart';
import 'package:fedi/app/instance/activity/instance_activity_bloc_proxy_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LocalInstanceActivityBloc extends InstanceActivityBloc
    implements IInstanceActivityBloc {
  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  LocalInstanceActivityBloc({
    required IUnifediApiInstance instance,
    required this.unifediApiInstanceService,
  }) : super(
          instanceUri: unifediApiInstanceService.baseUri,
          instance: instance,
        );

  static LocalInstanceActivityBloc createFromContext(BuildContext context) {
    var unifediApiInstanceService =
        Provider.of<IUnifediApiInstanceService>(context, listen: false);
    var currentUnifediApiAccessBloc =
        ICurrentUnifediApiAccessBloc.of(context, listen: false);

    return LocalInstanceActivityBloc(
      unifediApiInstanceService: unifediApiInstanceService,
      instance: currentUnifediApiAccessBloc.currentInstance!.info!,
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
