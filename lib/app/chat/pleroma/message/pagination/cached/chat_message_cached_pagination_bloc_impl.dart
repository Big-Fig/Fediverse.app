import 'package:fedi/app/chat/pleroma/message/chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/list/cached/chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pagination/cached/chat_message_cached_pagination_bloc.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatMessageCachedPaginationBloc
    extends CachedPleromaPaginationBloc<IChatMessage>
    implements IChatMessageCachedPaginationBloc {
  final IChatMessageCachedListBloc chatMessageListService;

  ChatMessageCachedPaginationBloc(
      {@required this.chatMessageListService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => chatMessageListService.pleromaApi;

  @override
  Future<List<IChatMessage>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedPaginationPage<IChatMessage> olderPage,
          @required CachedPaginationPage<IChatMessage> newerPage}) =>
      chatMessageListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<IChatMessage> olderPage,
      @required CachedPaginationPage<IChatMessage> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return chatMessageListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }

  static ChatMessageCachedPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      ChatMessageCachedPaginationBloc(
          chatMessageListService:
              Provider.of<IChatMessageCachedListBloc>(context, listen: false),
          itemsCountPerPage: itemsCountPerPage,
          maximumCachedPagesCount: maximumCachedPagesCount);

  static Widget provideToContext(BuildContext context,
      {int itemsCountPerPage = 20, int maximumCachedPagesCount, @required
      Widget child}) {
    return DisposableProvider<  ICachedPaginationBloc<CachedPaginationPage<IChatMessage>,
        IChatMessage>>(
      create: (context) => ChatMessageCachedPaginationBloc.createFromContext(
        context,
        itemsCountPerPage: itemsCountPerPage,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: CachedPaginationBlocProxyProvider<
          CachedPaginationPage<IChatMessage>,
          IChatMessage>(child: child),
    );
  }
}
