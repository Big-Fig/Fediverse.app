import 'package:fedi/app/chat/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/chat/with_last_message/list/cached/chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/with_last_message/pagination/chat_with_last_message_pagination_bloc.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';

class ChatWithLastMessagePaginationBloc
    extends CachedPleromaPaginationBloc<IChatWithLastMessage>
    implements IChatWithLastMessagePaginationBloc {
  final IChatWithLastMessageCachedBloc listService;

  ChatWithLastMessagePaginationBloc(
      {@required this.listService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  @override
  Future<List<IChatWithLastMessage>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedPaginationPage<IChatWithLastMessage> olderPage,
          @required CachedPaginationPage<IChatWithLastMessage> newerPage}) =>
      listService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<IChatWithLastMessage> olderPage,
      @required CachedPaginationPage<IChatWithLastMessage> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return listService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }
}
