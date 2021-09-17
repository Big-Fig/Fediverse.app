import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc.dart';
import 'package:fedi/app/status/scheduled/pagination/cached/scheduled_status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScheduledStatusCachedPaginationBloc
    extends CachedPleromaPaginationBloc<IScheduledStatus>
    implements IScheduledStatusCachedPaginationBloc {
  final IScheduledStatusCachedListBloc scheduledStatusListService;

  ScheduledStatusCachedPaginationBloc({
    required this.scheduledStatusListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi => scheduledStatusListService.unifediApi;

  @override
  Future<List<IScheduledStatus>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IScheduledStatus>? olderPage,
    required CachedPaginationPage<IScheduledStatus>? newerPage,
  }) =>
      scheduledStatusListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items.first,
        olderThan: newerPage?.items.last,
      );

  @override
  Future refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IScheduledStatus>? olderPage,
    required CachedPaginationPage<IScheduledStatus>? newerPage,
  }) async {
    // cant refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return scheduledStatusListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.first,
      olderThan: newerPage?.items.last,
    );
  }

  static ScheduledStatusCachedPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      ScheduledStatusCachedPaginationBloc(
        scheduledStatusListService:
            Provider.of<IScheduledStatusCachedListBloc>(context, listen: false),
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        maximumCachedPagesCount: maximumCachedPagesCount,
      );

  static Widget provideToContext(
    BuildContext context, {
    // todo: refactor
    // ignore: no-magic-number
    int itemsCountPerPage = 20,
    int? maximumCachedPagesCount,
    required Widget child,
  }) {
    return DisposableProvider<
        ICachedPaginationBloc<CachedPaginationPage<IScheduledStatus>,
            IScheduledStatus>>(
      create: (context) =>
          ScheduledStatusCachedPaginationBloc.createFromContext(
        context,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: CachedPaginationBlocProxyProvider<
          CachedPaginationPage<IScheduledStatus>,
          IScheduledStatus>(child: child),
    );
  }
}
