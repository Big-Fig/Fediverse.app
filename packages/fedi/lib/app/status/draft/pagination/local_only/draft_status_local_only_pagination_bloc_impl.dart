import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/list/local_only/local_only_list_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/list/local_only/draft_status_local_only_list_bloc.dart';
import 'package:fedi/app/status/draft/pagination/local_only/draft_status_local_only_pagination_bloc.dart';
import 'package:fedi/pagination/local_only/local_only_pagination_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DraftStatusLocalOnlyPaginationBloc
    extends LocalOnlyPaginationBloc<PaginationPage<IDraftStatus>, IDraftStatus>
    implements IDraftStatusLocalOnlyPaginationBloc {
  final ILocalOnlyListBloc<IDraftStatus> listService;

  DraftStatusLocalOnlyPaginationBloc({
    required this.listService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  static DraftStatusLocalOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      DraftStatusLocalOnlyPaginationBloc(
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        listService: Provider.of<ILocalOnlyListBloc<IDraftStatus>>(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required int? maximumCachedPagesCount,
  }) =>
      DisposableProvider<
          IPaginationBloc<PaginationPage<IDraftStatus>, IDraftStatus>>(
        create: (context) => DraftStatusLocalOnlyPaginationBloc(
          maximumCachedPagesCount: maximumCachedPagesCount,
          listService: IDraftStatusLocalOnlyListBloc.of(
            context,
            listen: false,
          ),
          paginationSettingsBloc: IPaginationSettingsBloc.of(
            context,
            listen: false,
          ),
        ),
        child: child,
      );

  @override
  PaginationPage<IDraftStatus> createPage({
    required int pageIndex,
    required List<IDraftStatus> loadedItems,
    required int? itemsCountPerPage,
  }) =>
      PaginationPage(
        requestedLimitPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        items: loadedItems,
      );

  @override
  Future<List<IDraftStatus>> loadItemsFromLocalForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required PaginationPage<IDraftStatus>? olderPage,
    required PaginationPage<IDraftStatus>? newerPage,
  }) =>
      listService.loadItemsFromLocalForPage(
        itemsCountPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        newerThan: newerPage?.items.lastOrNull,
        olderThan: olderPage?.items.firstOrNull,
      );
}
