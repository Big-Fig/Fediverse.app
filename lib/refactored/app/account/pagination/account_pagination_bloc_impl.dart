import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/list/account_list_service.dart';
import 'package:fedi/refactored/app/account/pagination/account_pagination_bloc.dart';
import 'package:fedi/refactored/app/pagination/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/cupertino.dart';

class AccountPaginationBloc
    extends CachedPleromaPaginationBloc<IAccount>
    implements IAccountPaginationBloc {
  final IAccountListService listService;

  AccountPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  @override
  Future<List<IAccount>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedNetworkPaginationPage<IAccount> olderPage,
          @required CachedNetworkPaginationPage<IAccount> newerPage}) =>
      listService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThanAccount: olderPage?.items?.first,
        olderThanAccount: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedNetworkPaginationPage<IAccount> olderPage,
      @required CachedNetworkPaginationPage<IAccount> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return listService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThanAccount: olderPage?.items?.first,
      olderThanAccount: newerPage?.items?.last,
    );
  }
}
