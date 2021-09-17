import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc.dart';
import 'package:fedi/app/instance/announcement/pagination/cached/instance_announcement_cached_pagination_bloc.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementCachedPaginationBloc
    extends CachedPleromaPaginationBloc<IInstanceAnnouncement>
    implements IInstanceAnnouncementCachedPaginationBloc {
  final IInstanceAnnouncementCachedListBloc instanceAnnouncementListService;

  InstanceAnnouncementCachedPaginationBloc({
    required this.instanceAnnouncementListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi => instanceAnnouncementListService.unifediApi;

  @override
  Future<List<IInstanceAnnouncement>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IInstanceAnnouncement>? olderPage,
    required CachedPaginationPage<IInstanceAnnouncement>? newerPage,
  }) =>
      instanceAnnouncementListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items.first,
        olderThan: newerPage?.items.last,
      );

  @override
  Future refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IInstanceAnnouncement>? olderPage,
    required CachedPaginationPage<IInstanceAnnouncement>? newerPage,
  }) async {
    // cant refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return instanceAnnouncementListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.first,
      olderThan: newerPage?.items.last,
    );
  }

  static InstanceAnnouncementCachedPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      InstanceAnnouncementCachedPaginationBloc(
        instanceAnnouncementListService:
            Provider.of<IInstanceAnnouncementCachedListBloc>(
          context,
          listen: false,
        ),
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        maximumCachedPagesCount: maximumCachedPagesCount,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    int? maximumCachedPagesCount,
  }) {
    return DisposableProvider<
        ICachedPaginationBloc<CachedPaginationPage<IInstanceAnnouncement>,
            IInstanceAnnouncement>>(
      create: (context) =>
          InstanceAnnouncementCachedPaginationBloc.createFromContext(
        context,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: CachedPaginationBlocProxyProvider<
          CachedPaginationPage<IInstanceAnnouncement>,
          IInstanceAnnouncement>(child: child),
    );
  }
}
