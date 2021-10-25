import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi_app/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc.dart';
import 'package:fedi_app/app/instance/announcement/pagination/cached/instance_announcement_cached_pagination_bloc.dart';
import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class InstanceAnnouncementCachedPaginationBloc
    extends CachedUnifediPaginationBloc<IInstanceAnnouncement>
    implements IInstanceAnnouncementCachedPaginationBloc {
  final IInstanceAnnouncementCachedListBloc instanceAnnouncementListService;

  InstanceAnnouncementCachedPaginationBloc({
    required this.instanceAnnouncementListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi =>
      instanceAnnouncementListService.unifediApi;

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
  Future<void> refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IInstanceAnnouncement>? olderPage,
    required CachedPaginationPage<IInstanceAnnouncement>? newerPage,
  }) async {
    assert(
      !(pageIndex > 0 && olderPage == null && newerPage == null),
      'cant refresh not first page without actual items bounds',
    );

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
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
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
  }) =>
      DisposableProvider<
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
