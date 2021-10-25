import 'package:collection/collection.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/notification/notification_model.dart';
import 'package:fedi_app/app/notification/pagination/network_only/notification_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class NotificationNetworkOnlyPaginationBloc
    extends NetworkOnlyUnifediPaginationBloc<INotification>
    implements INotificationNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<INotification> listService;

  NotificationNetworkOnlyPaginationBloc({
    required this.listService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
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
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
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
  }) =>
      listService.loadItemsFromRemoteForPage(
        itemsCountPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        minId: newerPage?.items.lastOrNull?.remoteId,
        maxId: olderPage?.items.firstOrNull?.remoteId,
      );
}
