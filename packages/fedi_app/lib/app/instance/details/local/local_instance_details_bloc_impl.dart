import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/instance/details/instance_details_bloc.dart';
import 'package:fedi_app/app/instance/details/instance_details_bloc_impl.dart';
import 'package:fedi_app/app/instance/details/instance_details_bloc_proxy_provider.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalInstanceDetailsBloc extends InstanceDetailsBloc
    implements IInstanceDetailsBloc {
  @override
  final IUnifediApiInstanceService unifediApiInstanceService;

  LocalInstanceDetailsBloc({
    required IUnifediApiInstance? initialInstance,
    required this.unifediApiInstanceService,
  }) : super(
          instanceUri: Uri.parse(
            unifediApiInstanceService.restService.accessBloc.access.url,
          ),
          initialInstance: initialInstance,
        );

  static LocalInstanceDetailsBloc createFromContext(BuildContext context) {
    var unifediApiInstanceService =
        Provider.of<IUnifediApiInstanceService>(context, listen: false);
    var currentUnifediApiAccessBloc =
        ICurrentAccessBloc.of(context, listen: false);

    return LocalInstanceDetailsBloc(
      unifediApiInstanceService: unifediApiInstanceService,
      initialInstance: currentUnifediApiAccessBloc.currentInstance!.instance,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IInstanceDetailsBloc>(
        create: LocalInstanceDetailsBloc.createFromContext,
        child: InstanceDetailsBlocProxyProvider(child: child),
      );

  @override
  // ignore: no-empty-block
  Future<void> internalAsyncInit() async {
    // nothing here
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
