import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

class AccountStatusesPinnedOnlyNetworkOnlyListBloc
    extends AccountStatusesNetworkOnlyListBloc {
  AccountStatusesPinnedOnlyNetworkOnlyListBloc({
    @required IAccount account,
    @required IPleromaAccountService pleromaAccountService,
  }) : super(account: account, pleromaAccountService: pleromaAccountService);

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  static AccountStatusesPinnedOnlyNetworkOnlyListBloc createFromContext(
      BuildContext context,
      {@required IAccount account}) {
    return AccountStatusesPinnedOnlyNetworkOnlyListBloc(
      account: account,
      pleromaAccountService: IPleromaAccountService.of(context, listen: false),
    );
  }

  static Widget provideToContext(BuildContext context,
      {@required IAccount account, @required Widget child}) {
    return DisposableProvider<IStatusNetworkOnlyListBloc>(
      create: (context) =>
          AccountStatusesPinnedOnlyNetworkOnlyListBloc.createFromContext(
        context,
        account: account,
      ),
      child: StatusNetworkOnlyListBlocProxyProvider(
        child: ProxyProvider<IStatusNetworkOnlyListBloc, INetworkOnlyListBloc>(
          update: (context, value, previous) => value,
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
  Future<List<IStatus>> loadItemsFromRemoteForPage({
    int pageIndex,
    int itemsCountPerPage,
    String minId,
    String maxId,
  }) async {
    var remoteStatuses = await pleromaAccountService.getAccountStatuses(
      pinned: true,
      accountRemoteId: account.remoteId,
      pagination: PleromaPaginationRequest(
        limit: itemsCountPerPage,
        sinceId: minId,
        maxId: maxId,
      ),
    );
    return remoteStatuses
        ?.map((remoteStatus) => mapRemoteStatusToLocalStatus(remoteStatus))
        ?.toList();
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;
}
