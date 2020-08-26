import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_network_only_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

class CustomListNetworkOnlyListBloc
    extends INetworkOnlyListBloc<ICustomList> {
  final IPleromaListService pleromaListService;
  CustomListNetworkOnlyListBloc({
    @required this.pleromaListService,
  });

  @override
  IPleromaApi get pleromaApi => pleromaListService;

  static CustomListNetworkOnlyListBloc createFromContext(
      BuildContext context,
      {@required IAccount account}) {
    return CustomListNetworkOnlyListBloc(
      pleromaListService: IPleromaListService.of(context, listen: false),
    );
  }

  static Widget provideToContext(BuildContext context,
      {@required IAccount account, @required Widget child}) {
    return DisposableProvider<INetworkOnlyListBloc<ICustomList>>(
      create: (context) =>
          CustomListNetworkOnlyListBloc.createFromContext(
              context,
              account: account),
      child: ProxyProvider<INetworkOnlyListBloc<ICustomList>, INetworkOnlyListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }

  @override
  Future<List<ICustomList>> loadItemsFromRemoteForPage({
    int pageIndex,
    int itemsCountPerPage,
    String minId,
    String maxId,
  }) async {
    var remoteStatuses = await pleromaListService.getAccountStatuses(
        pinned: true,
        accountRemoteId: account.remoteId,
        limit: itemsCountPerPage,
        sinceId: minId,
        maxId: maxId);
    return remoteStatuses
        ?.map((remoteStatus) => mapRemoteStatusToLocalStatus(remoteStatus))
        ?.toList();
  }
}
