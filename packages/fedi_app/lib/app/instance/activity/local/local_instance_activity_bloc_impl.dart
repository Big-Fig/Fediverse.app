import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/instance/activity/instance_activity_bloc.dart';
import 'package:fedi_app/app/instance/activity/instance_activity_bloc_impl.dart';
import 'package:fedi_app/app/instance/activity/instance_activity_bloc_proxy_provider.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalInstanceActivityBloc extends InstanceActivityBloc
    implements IInstanceActivityBloc {
  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  LocalInstanceActivityBloc({
    required IUnifediApiInstance instance,
    required this.unifediApiInstanceService,
  }) : super(
          instanceUri: Uri.parse(
              unifediApiInstanceService.restService.accessBloc.access.url),
          instance: instance,
        );

  static LocalInstanceActivityBloc createFromContext(BuildContext context) {
    var unifediApiInstanceService =
        Provider.of<IUnifediApiInstanceService>(context, listen: false);
    var currentUnifediApiAccessBloc =
        ICurrentAccessBloc.of(context, listen: false);

    return LocalInstanceActivityBloc(
      unifediApiInstanceService: unifediApiInstanceService,
      instance: currentUnifediApiAccessBloc.currentInstance!.instance!,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IInstanceActivityBloc>(
        create: LocalInstanceActivityBloc.createFromContext,
        child: InstanceActivityBlocProxyProvider(child: child),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
