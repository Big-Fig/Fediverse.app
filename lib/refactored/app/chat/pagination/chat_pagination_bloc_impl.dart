import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/list/cached/chat_cached_list_service.dart';
import 'package:fedi/refactored/app/chat/pagination/chat_pagination_bloc.dart';
import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';

class ChatPaginationBloc
    extends CachedPleromaPaginationBloc<IChat>
    implements IChatPaginationBloc {
  final IChatCachedListService listService;

  ChatPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  @override
  Future<List<IChat>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedPaginationPage<IChat> olderPage,
          @required CachedPaginationPage<IChat> newerPage}) =>
      listService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<IChat> olderPage,
      @required CachedPaginationPage<IChat> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return listService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }
}
