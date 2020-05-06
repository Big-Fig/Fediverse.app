import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/pagination/cached/account_cached_pagination_bloc.dart';
import 'package:fedi/refactored/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountCachedPaginationBloc extends CachedPleromaPaginationBloc<IAccount>
    implements IAccountCachedPaginationBloc {
  final IPleromaCachedListBloc<IAccount> listService;

  AccountCachedPaginationBloc(
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
          @required CachedPaginationPage<IAccount> olderPage,
          @required CachedPaginationPage<IAccount> newerPage}) =>
      listService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<IAccount> olderPage,
      @required CachedPaginationPage<IAccount> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return listService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }

  static AccountCachedPaginationBloc createFromContext(BuildContext context,
          {int itemsCountPerPage = 20, int maximumCachedPagesCount}) =>
      AccountCachedPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService: Provider.of<IPleromaCachedListBloc<IAccount>>(context,
              listen: false));
}
