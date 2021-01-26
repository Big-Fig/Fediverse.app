import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/media_only/network_only/account_statuses_media_only_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

class RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc
    extends AccountStatusesMediaOnlyNetworkOnlyListBloc {
  final Uri instanceUri;

  RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc({
    @required IAccount account,
    @required IPleromaAccountService pleromaAccountService,
    @required this.instanceUri,
  }) : super(
          account: account,
          pleromaAccountService: pleromaAccountService,
        );

  static RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    @required IAccount account,
    @required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var pleromaAccountService = PleromaAccountService(
        restService: remoteInstanceBloc.pleromaRestService);

    var bloc = RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc(
      account: account,
      instanceUri: instanceUri,
      pleromaAccountService: pleromaAccountService,
    );

    bloc.addDisposable(disposable: pleromaAccountService);
    return bloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    @required IAccount account,
    @required Widget child,
    @required Uri instanceUri,
  }) {
    return DisposableProvider<IStatusNetworkOnlyListBloc>(
      create: (context) =>
          RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc.createFromContext(
        context,
        account: account,
        instanceUri: instanceUri,
      ),
      child: ProxyProvider<IStatusNetworkOnlyListBloc, INetworkOnlyListBloc>(
        update: (context, value, previous) => value,
        child: StatusNetworkOnlyListBlocProxyProvider(
          child: ProxyProvider<IStatusNetworkOnlyListBloc,
              INetworkOnlyListBloc<IStatus>>(
            update: (context, value, previous) => value,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
