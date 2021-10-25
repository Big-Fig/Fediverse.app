import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/statuses/with_replies/network_only/account_statuses_with_replies_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteAccountStatusesWithRepliesNetworkOnlyListBloc
    extends AccountStatusesWithRepliesNetworkOnlyListBloc {
  final Uri instanceUri;

  RemoteAccountStatusesWithRepliesNetworkOnlyListBloc({
    required IAccount? account,
    required IUnifediApiAccountService unifediApiAccountService,
    required this.instanceUri,
  }) : super(
          account: account,
          unifediApiAccountService: unifediApiAccountService,
        );

  static RemoteAccountStatusesWithRepliesNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required IAccount? account,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var unifediApiAccountService =
        remoteInstanceBloc.unifediApiManager.createAccountService();

    var bloc = RemoteAccountStatusesWithRepliesNetworkOnlyListBloc(
      account: account,
      instanceUri: instanceUri,
      unifediApiAccountService: unifediApiAccountService,
    );

    unifediApiAccountService.disposeWith(bloc);

    return bloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IAccount? account,
    required Widget child,
    required Uri instanceUri,
  }) =>
      DisposableProvider<IStatusNetworkOnlyListBloc>(
        create: (context) => RemoteAccountStatusesWithRepliesNetworkOnlyListBloc
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

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
