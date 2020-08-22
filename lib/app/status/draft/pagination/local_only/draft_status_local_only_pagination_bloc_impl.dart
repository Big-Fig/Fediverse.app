import 'package:fedi/app/list/local_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/list/local_only/draft_status_local_only_list_bloc.dart';
import 'package:fedi/app/status/draft/pagination/local_only/draft_status_local_only_pagination_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/local_only/local_only_pagination_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DraftStatusLocalOnlyPaginationBloc
    extends LocalOnlyPaginationBloc<PaginationPage<IDraftStatus>, IDraftStatus>
    implements IDraftStatusLocalOnlyPaginationBloc {
  final ILocalOnlyListBloc<IDraftStatus> listService;

  DraftStatusLocalOnlyPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  static DraftStatusLocalOnlyPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      DraftStatusLocalOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService: Provider.of<ILocalOnlyListBloc<IDraftStatus>>(context,
              listen: false));

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required int itemsCountPerPage,
    @required int maximumCachedPagesCount,
  }) =>
      DisposableProvider<
          IPaginationBloc<PaginationPage<IDraftStatus>, IDraftStatus>>(
        create: (context) => DraftStatusLocalOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
          listService: IDraftStatusLocalOnlyListBloc.of(context, listen: false),
        ),
        child: child,
      );

  @override
  PaginationPage<IDraftStatus> createPage(
          {int pageIndex,
          List<IDraftStatus> loadedItems,
          int itemsCountPerPage}) =>
      PaginationPage(
          requestedLimitPerPage: itemsCountPerPage,
          pageIndex: pageIndex,
          items: loadedItems);

  @override
  Future<List<IDraftStatus>> loadItemsFromLocalForPage(
      {int pageIndex,
      int itemsCountPerPage,
      PaginationPage<IDraftStatus> olderPage,
      PaginationPage<IDraftStatus> newerPage}) {
    return listService.loadItemsFromLocalForPage(
      itemsCountPerPage: itemsCountPerPage,
      pageIndex: pageIndex,
      newerThan: newerPage?.items?.last,
      olderThan: olderPage?.items?.first,
    );
  }
}
