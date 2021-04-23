import 'package:collection/collection.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IStatus>
    implements IStatusNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<IStatus> listService;

  StatusNetworkOnlyPaginationBloc({
    required this.listService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static StatusNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      StatusNetworkOnlyPaginationBloc(
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        listService: Provider.of<INetworkOnlyListBloc<IStatus>>(
          context,
          listen: false,
        ),
      );

  @override
  Future<List<IStatus>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required PaginationPage<IStatus>? olderPage,
    required PaginationPage<IStatus>? newerPage,
  }) {
    return listService.loadItemsFromRemoteForPage(
      itemsCountPerPage: itemsCountPerPage,
      pageIndex: pageIndex,
      minId: newerPage?.items.lastOrNull?.remoteId,
      maxId: olderPage?.items.firstOrNull?.remoteId,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    int? maximumCachedPagesCount,
  }) {
    return DisposableProvider<
        INetworkOnlyPaginationBloc<PaginationPage<IStatus>, IStatus>>(
      create: (context) => StatusNetworkOnlyPaginationBloc.createFromContext(
        context,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: NetworkOnlyPaginationBlocProxyProvider<PaginationPage<IStatus>,
          IStatus>(child: child),
    );
  }
}
