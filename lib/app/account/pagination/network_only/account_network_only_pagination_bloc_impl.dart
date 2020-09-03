import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IAccount>
    implements IAccountNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<IAccount> listBloc;

  AccountNetworkOnlyPaginationBloc(
      {@required this.listBloc,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listBloc.pleromaApi;

  static AccountNetworkOnlyPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      AccountNetworkOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listBloc: Provider.of<INetworkOnlyListBloc<IAccount>>(
              context,
              listen: false));

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required PaginationPage<IAccount> olderPage,
          @required PaginationPage<IAccount> newerPage}) =>
      listBloc.loadItemsFromRemoteForPage(
          itemsCountPerPage: itemsCountPerPage,
          maxId: newerPage?.items?.last?.remoteId,
          minId: olderPage?.items?.first?.remoteId,
          pageIndex: pageIndex);
}
