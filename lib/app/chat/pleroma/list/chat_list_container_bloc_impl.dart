import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/chat/pleroma/chat_model.dart';
import 'package:fedi/app/chat/pleroma/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/list/cached/chat_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/list/cached/chat_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/list/chat_list_container_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/pagination/cached/chat_cached_pagination_bloc.dart';
import 'package:fedi/app/chat/pleroma/pagination/cached/chat_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pagination/list/chat_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/repository/chat_repository.dart';
import 'package:fedi/app/chat/pleroma/websockets/chat_websockets_handler_impl.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("chats_home_tab_bloc_impl.dart");

class ChatsListContainerBloc extends DisposableOwner
    implements IChatListContainerBloc {
  @override
  IChatCachedListBloc chatListService;

  @override
  IChatCachedPaginationBloc chatPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IChat>, IChat>
      get chatPaginationListBloc => chatPaginationListWithNewItemsBloc;

  @override
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IChat>, IChat>
      chatPaginationListWithNewItemsBloc;

  final INotificationRepository notificationRepository;
  final IChatMessageRepository chatMessageRepository;
  final IChatRepository chatRepository;
  final IStatusRepository statusRepository;
  final IConversationChatRepository conversationRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;

  ChatsListContainerBloc({
    @required IPleromaChatService pleromaChatService,
    @required this.notificationRepository,
    @required this.chatMessageRepository,
    @required this.chatRepository,
    @required this.statusRepository,
    @required this.conversationRepository,
    @required this.pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
    @required this.chatNewMessagesHandlerBloc,
  }) {
    _logger.finest(() => "constructor");
    chatListService = ChatCachedListBloc(
        pleromaChatService: pleromaChatService, chatRepository: chatRepository);
    addDisposable(disposable: chatListService);
    chatPaginationBloc = ChatCachedPaginationBloc(
        itemsCountPerPage: 20,
        listService: chatListService,
        maximumCachedPagesCount: null);
    addDisposable(disposable: chatListService);
    chatPaginationListWithNewItemsBloc = ChatPaginationListWithNewItemsBloc(
      paginationBloc: chatPaginationBloc,
      cachedListBloc: chatListService,
      mergeNewItemsImmediately: true,
    );
    addDisposable(disposable: chatPaginationListWithNewItemsBloc);

    if (listenWebSocketsChanges) {
      addDisposable(
          disposable: ChatWebSocketsHandler(
        notificationRepository: notificationRepository,
        conversationRepository: conversationRepository,
        statusRepository: statusRepository,
        pleromaWebSocketsService: pleromaWebSocketsService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
      ));
    }
  }

  static ChatsListContainerBloc createFromContext(BuildContext context) =>
      ChatsListContainerBloc(
          pleromaChatService: IPleromaChatService.of(context, listen: false),
          chatRepository: IChatRepository.of(context, listen: false),
          notificationRepository:
              INotificationRepository.of(context, listen: false),
          chatMessageRepository:
              IChatMessageRepository.of(context, listen: false),
          pleromaWebSocketsService:
              IPleromaWebSocketsService.of(context, listen: false),
          listenWebSocketsChanges:
              IMyAccountSettingsBloc.of(context, listen: false)
                  .isRealtimeWebSocketsEnabledFieldBloc
                  .currentValue,
          conversationRepository:
              IConversationChatRepository.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          chatNewMessagesHandlerBloc:
              IChatNewMessagesHandlerBloc.of(context, listen: false));
}
