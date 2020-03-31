import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi/refactored/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/refactored/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IStatus>
    implements IStatusNetworkOnlyPaginationBloc {
  final IPleromaNetworkOnlyListService<IStatus> listService;

  StatusNetworkOnlyPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static StatusNetworkOnlyPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      StatusNetworkOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService:
              Provider.of<IPleromaNetworkOnlyListService<IStatus>>(context,
                  listen: false));

  @override
  Future<List<IStatus>> loadItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required PaginationPage<IStatus> olderPage,
      @required PaginationPage<IStatus> newerPage}) => listService.loadItemsFromRemoteForPage(
      itemsCountPerPage: itemsCountPerPage,
      minId: newerPage?.items?.last?.remoteId,
      maxId: olderPage?.items?.first?.remoteId,
    );
}
