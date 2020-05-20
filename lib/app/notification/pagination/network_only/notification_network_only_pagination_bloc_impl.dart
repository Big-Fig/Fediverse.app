import 'package:fedi/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/pagination/network_only/notification_network_only_pagination_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NotificationNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<INotification>
    implements INotificationNetworkOnlyPaginationBloc {
  final IPleromaNetworkOnlyListService<INotification> listService;

  NotificationNetworkOnlyPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static NotificationNetworkOnlyPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      NotificationNetworkOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService:
              Provider.of<IPleromaNetworkOnlyListService<INotification>>(
                  context,
                  listen: false));

  @override
  Future<List<INotification>> loadItemsFromRemoteForPage(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required PaginationPage<INotification> olderPage,
          @required PaginationPage<INotification> newerPage}) =>
      listService.loadItemsFromRemoteForPage(
        itemsCountPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        minId: newerPage?.items?.last?.remoteId,
        maxId: olderPage?.items?.first?.remoteId,
      );
}
