import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:flutter/widgets.dart';

class RemoteInstanceBloc extends DisposableOwner
    implements IRemoteInstanceBloc {
  @override
  final Uri instanceUri;

  final IConnectionService connectionService;

  RestService restService;
  @override
  PleromaRestService pleromaRestService;

  RemoteInstanceBloc({
    @required this.instanceUri,
    @required this.connectionService,
  }) {
    restService = RestService(
      baseUri: instanceUri,
    );
    pleromaRestService = PleromaRestService(
      connectionService: connectionService,
      restService: restService,
    );

    addDisposable(disposable: restService);
    addDisposable(disposable: pleromaRestService);
  }

  static RemoteInstanceBloc createFromContext(
    BuildContext context, {
    @required Uri instanceUri,
  }) =>
      RemoteInstanceBloc(
        instanceUri: instanceUri,
        connectionService: IConnectionService.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required Uri instanceUri,
  }) =>
      DisposableProvider<IRemoteInstanceBloc>(
        create: (context) => createFromContext(
          context,
          instanceUri: instanceUri,
        ),
        child: child,
      );
}
