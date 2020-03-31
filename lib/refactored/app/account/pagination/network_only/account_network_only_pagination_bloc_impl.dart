import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/refactored/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/refactored/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IAccount>
    implements IAccountNetworkOnlyPaginationBloc {
  final IPleromaNetworkOnlyListService<IAccount> listService;

  AccountNetworkOnlyPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static AccountNetworkOnlyPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      AccountNetworkOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService: Provider.of<IPleromaNetworkOnlyListService<IAccount>>(
              context,
              listen: false));

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required PaginationPage<IAccount> olderPage,
          @required PaginationPage<IAccount> newerPage}) =>
      listService.loadItemsFromRemoteForPage(
          itemsCountPerPage: itemsCountPerPage,
          maxId: newerPage?.items?.last?.remoteId,
          minId: olderPage?.items?.first?.remoteId,
          pageIndex: pageIndex);
}
