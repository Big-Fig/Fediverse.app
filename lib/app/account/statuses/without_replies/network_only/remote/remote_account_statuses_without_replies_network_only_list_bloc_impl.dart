import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/without_replies/network_only/account_statuses_without_replies_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:easy_dispose/easy_dispose.dart';

class RemoteAccountStatusesWithoutRepliesNetworkOnlyListBloc
    extends AccountStatusesWithoutRepliesNetworkOnlyListBloc {
  final Uri instanceUri;

  RemoteAccountStatusesWithoutRepliesNetworkOnlyListBloc({
    required IAccount? account,
    required IPleromaApiAccountService pleromaAccountService,
    required this.instanceUri,
  }) : super(
          account: account,
          pleromaAccountService: pleromaAccountService,
        );

  static RemoteAccountStatusesWithoutRepliesNetworkOnlyListBloc
      createFromContext(
    BuildContext context, {
    required IAccount? account,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var pleromaAccountService = PleromaApiAccountService(
      restService: remoteInstanceBloc.pleromaRestService,
    );

    var bloc = RemoteAccountStatusesWithoutRepliesNetworkOnlyListBloc(
      account: account,
      instanceUri: instanceUri,
      pleromaAccountService: pleromaAccountService,
    );

    pleromaAccountService.disposeWith(bloc);

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
          RemoteAccountStatusesWithoutRepliesNetworkOnlyListBloc
              .createFromContext(
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
