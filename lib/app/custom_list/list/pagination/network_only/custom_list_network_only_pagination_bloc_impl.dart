import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/list/pagination/custom_list_pagination_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<ICustomList>
    implements ICustomListNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<ICustomList> listService;

  CustomListNetworkOnlyPaginationBloc({
    @required this.listService,
    @required IPaginationSettingsBloc paginationSettingsBloc,
    @required int maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  static CustomListNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int maximumCachedPagesCount,
  }) =>
      CustomListNetworkOnlyPaginationBloc(
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
  Future<List<ICustomList>> loadItemsFromRemoteForPage(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required PaginationPage<ICustomList> olderPage,
          @required PaginationPage<ICustomList> newerPage}) =>
      listService.loadItemsFromRemoteForPage(
        itemsCountPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        minId: newerPage?.items?.last?.remoteId,
        maxId: olderPage?.items?.first?.remoteId,
      );

  static Widget provideToContext(BuildContext context,
          {@required Widget child}) =>
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
