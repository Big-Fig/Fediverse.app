import 'package:collection/collection.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/list/pagination/custom_list_pagination_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<ICustomList>
    implements ICustomListNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<ICustomList> listService;

  CustomListNetworkOnlyPaginationBloc({
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

  static CustomListNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      CustomListNetworkOnlyPaginationBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        listService: Provider.of<INetworkOnlyListBloc<ICustomList>>(
          context,
          listen: false,
        ),
      );

  @override
  Future<List<ICustomList>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required PaginationPage<ICustomList>? olderPage,
    required PaginationPage<ICustomList>? newerPage,
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
  }) =>
      DisposableProvider<ICustomListNetworkOnlyPaginationBloc>(
        create: (context) =>
            CustomListNetworkOnlyPaginationBloc.createFromContext(context),
        child: ProxyProvider<ICustomListNetworkOnlyPaginationBloc,
            INetworkOnlyPleromaPaginationBloc<ICustomList>>(
          update: (context, value, previous) => value,
          child: ProxyProvider<ICustomListNetworkOnlyPaginationBloc,
              IPaginationBloc<PaginationPage<ICustomList>, ICustomList>>(
            update: (context, value, previous) => value,
            child: ProxyProvider<ICustomListNetworkOnlyPaginationBloc,
                IPaginationBloc>(
              update: (context, value, previous) => value,
              child: child,
            ),
          ),
        ),
      );
}
