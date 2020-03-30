import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/list/conversation_list_service.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc.dart';
import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:flutter/cupertino.dart';

class ConversationPaginationBloc
    extends CachedPleromaPaginationBloc<IConversation>
    implements IConversationPaginationBloc {
  final IConversationListService listService;

  ConversationPaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  @override
  Future<List<IConversation>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedPaginationPage<IConversation> olderPage,
          @required CachedPaginationPage<IConversation> newerPage}) =>
      listService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThanConversation: olderPage?.items?.first,
        olderThanConversation: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<IConversation> olderPage,
      @required CachedPaginationPage<IConversation> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return listService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThanConversation: olderPage?.items?.first,
      olderThanConversation: newerPage?.items?.last,
    );
  }
}
