import 'package:collection/collection.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/scheduled/pagination/network_only/scheduled_status_network_only_pagination_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScheduledStatusNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IScheduledStatus>
    implements IScheduledStatusNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<IScheduledStatus> listService;

  ScheduledStatusNetworkOnlyPaginationBloc({
    required this.listService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static ScheduledStatusNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      ScheduledStatusNetworkOnlyPaginationBloc(
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        listService: Provider.of<INetworkOnlyListBloc<IScheduledStatus>>(
          context,
          listen: false,
        ),
      );

  @override
  Future<List<IScheduledStatus>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required PaginationPage<IScheduledStatus>? olderPage,
    required PaginationPage<IScheduledStatus>? newerPage,
  }) {
    return listService.loadItemsFromRemoteForPage(
        itemsCountPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        minId: newerPage?.items.lastOrNull?.remoteId,
        maxId: olderPage?.items.firstOrNull?.remoteId,
      );
  }
}
