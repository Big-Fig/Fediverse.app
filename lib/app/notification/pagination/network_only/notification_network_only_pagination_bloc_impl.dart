import 'package:collection/collection.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/pagination/network_only/notification_network_only_pagination_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NotificationNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<INotification>
    implements INotificationNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<INotification> listService;

  NotificationNetworkOnlyPaginationBloc({
    required this.listService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi => listService.unifediApi;

  static NotificationNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      NotificationNetworkOnlyPaginationBloc(
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        listService: Provider.of<INetworkOnlyListBloc<INotification>>(
          context,
          listen: false,
        ),
      );

  @override
  Future<List<INotification>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required PaginationPage<INotification>? olderPage,
    required PaginationPage<INotification>? newerPage,
  }) {
    return listService.loadItemsFromRemoteForPage(
      itemsCountPerPage: itemsCountPerPage,
      pageIndex: pageIndex,
      minId: newerPage?.items.lastOrNull?.remoteId,
      maxId: olderPage?.items.firstOrNull?.remoteId,
    );
  }
}
