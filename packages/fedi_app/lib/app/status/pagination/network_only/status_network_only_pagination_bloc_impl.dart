import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusNetworkOnlyPaginationBloc
    extends NetworkOnlyUnifediPaginationBloc<IStatus>
    implements IStatusNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<IStatus> listService;

  StatusNetworkOnlyPaginationBloc({
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

  static StatusNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      StatusNetworkOnlyPaginationBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
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
  }) =>
      listService.loadItemsFromRemoteForPage(
        itemsCountPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        minId: newerPage?.items.lastOrNull?.remoteId,
        maxId: olderPage?.items.firstOrNull?.remoteId,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    int? maximumCachedPagesCount,
  }) =>
      DisposableProvider<
          INetworkOnlyPaginationBloc<PaginationPage<IStatus>, IStatus>>(
        create: (context) => StatusNetworkOnlyPaginationBloc.createFromContext(
          context,
          maximumCachedPagesCount: maximumCachedPagesCount,
        ),
        child: NetworkOnlyPaginationBlocProxyProvider<PaginationPage<IStatus>,
            IStatus>(child: child),
      );
}
