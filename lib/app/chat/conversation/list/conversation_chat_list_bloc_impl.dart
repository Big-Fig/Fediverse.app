import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/list/cached/conversation_chat_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/list/cached/conversation_chat_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/list/conversation_chat_list_bloc.dart';
import 'package:fedi/app/chat/conversation/pagination/conversation_chat_pagination_bloc.dart';
import 'package:fedi/app/chat/conversation/pagination/conversation_chat_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/pagination/list/conversation_chat_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("conversation_chat_list_bloc_impl.dart");

class ConversationChatListBloc extends DisposableOwner
    implements IConversationChatListBloc {
  @override
  IConversationChatCachedListBloc conversationListService;

  @override
  IConversationChatPaginationBloc conversationPaginationBloc;

  @override
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IConversationChat>,
      IConversationChat> conversationPaginationListWithNewItemsBloc;

  @override
  IPaginationListBloc<PaginationPage<IConversationChat>, IConversationChat>
      get conversationPaginationListBloc =>
          conversationPaginationListWithNewItemsBloc;

  final IConversationChatRepository conversationChatRepository;

  ConversationChatListBloc({
    @required this.conversationChatRepository,
    @required IPleromaConversationService pleromaConversationService,
    @required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
  }) {
    _logger.finest(() => "constructor");
    conversationListService = ConversationChatCachedListBloc(
        pleromaConversationService: pleromaConversationService,
        conversationRepository: conversationChatRepository);
    addDisposable(disposable: conversationListService);
    conversationPaginationBloc = ConversationChatPaginationBloc(
        itemsCountPerPage: 20,
        listService: conversationListService,
        maximumCachedPagesCount: null);
    addDisposable(disposable: conversationListService);
    conversationPaginationListWithNewItemsBloc =
        ConversationChatPaginationListWithNewItemsBloc(
      paginationBloc: conversationPaginationBloc,
      cachedListService: conversationListService,
      mergeNewItemsImmediately: true,
    );
    addDisposable(disposable: conversationPaginationListBloc);

    addDisposable(
      disposable: webSocketsHandlerManagerBloc.listenDirectChannel(
        listenType: WebSocketsListenType.foreground,
      ),
    );
  }

  static ConversationChatListBloc createFromContext(BuildContext context) =>
      ConversationChatListBloc(
        pleromaConversationService:
            IPleromaConversationService.of(context, listen: false),
        conversationChatRepository: IConversationChatRepository.of(
          context,
          listen: false,
        ),
        webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
          context,
          listen: false,
        ),
      );
}
