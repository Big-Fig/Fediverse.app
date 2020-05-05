import 'package:fedi/refactored/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/refactored/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/scheduled/pagination/network_only/scheduled_status_network_only_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScheduledStatusNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IScheduledStatus>
    implements IScheduledStatusNetworkOnlyPaginationBloc {
  final IPleromaNetworkOnlyListService<IScheduledStatus> listService;

  ScheduledStatusNetworkOnlyPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static ScheduledStatusNetworkOnlyPaginationBloc createFromContext(BuildContext context,
          {int itemsCountPerPage = 20, int maximumCachedPagesCount}) =>
      ScheduledStatusNetworkOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService: Provider.of<IPleromaNetworkOnlyListService<IScheduledStatus>>(
              context,
              listen: false));

  @override
  Future<List<IScheduledStatus>> loadItemsFromRemoteForPage(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required PaginationPage<IScheduledStatus> olderPage,
          @required PaginationPage<IScheduledStatus> newerPage}) =>
      listService.loadItemsFromRemoteForPage(
        itemsCountPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        minId: newerPage?.items?.last?.remoteId,
        maxId: olderPage?.items?.first?.remoteId,
      );
}
