import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/with_replies/network_only/account_statuses_with_replies_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RemoteAccountStatusesWithRepliesNetworkOnlyListBloc
    extends AccountStatusesWithRepliesNetworkOnlyListBloc {
  final Uri instanceUri;

  RemoteAccountStatusesWithRepliesNetworkOnlyListBloc({
    required IAccount? account,
    required IPleromaApiAccountService pleromaAccountService,
    required this.instanceUri,
  }) : super(
          account: account,
          pleromaAccountService: pleromaAccountService,
        );

  static RemoteAccountStatusesWithRepliesNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required IAccount? account,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var pleromaAccountService = PleromaApiAccountService(
      restService: remoteInstanceBloc.pleromaRestService,
    );

    var bloc = RemoteAccountStatusesWithRepliesNetworkOnlyListBloc(
      account: account,
      instanceUri: instanceUri,
      pleromaAccountService: pleromaAccountService,
    );

    bloc.addDisposable(disposable: pleromaAccountService);

    return bloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IAccount? account,
    required Widget child,
    required Uri instanceUri,
  }) {
    return DisposableProvider<IStatusNetworkOnlyListBloc>(
      create: (context) =>
          RemoteAccountStatusesWithRepliesNetworkOnlyListBloc.createFromContext(
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
