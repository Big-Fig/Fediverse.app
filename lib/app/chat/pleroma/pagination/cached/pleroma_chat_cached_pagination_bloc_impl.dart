import 'package:fedi/app/chat/pleroma/list/cached/pleroma_chat_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/pagination/cached/pleroma_chat_cached_pagination_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';

class PleromaChatCachedPaginationBloc
    extends CachedPleromaPaginationBloc<IPleromaChat>
    implements IPleromaChatCachedPaginationBloc {
  final IPleromaChatCachedListBloc listService;

  PleromaChatCachedPaginationBloc({
    @required this.listService,
    @required IPaginationSettingsBloc paginationSettingsBloc,
    @required int maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  @override
  Future<List<IPleromaChat>> loadLocalItems({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required CachedPaginationPage<IPleromaChat> olderPage,
    @required CachedPaginationPage<IPleromaChat> newerPage,
  }) =>
      listService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    @required int pageIndex,
    @required int itemsCountPerPage,
    @required CachedPaginationPage<IPleromaChat> olderPage,
    @required CachedPaginationPage<IPleromaChat> newerPage,
  }) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return listService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }
}
