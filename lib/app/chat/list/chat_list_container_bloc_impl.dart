import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/list/cached/chat_cached_list_service.dart';
import 'package:fedi/app/chat/list/cached/chat_cached_list_service_impl.dart';
import 'package:fedi/app/chat/list/chat_list_container_bloc.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/pagination/chat_pagination_bloc.dart';
import 'package:fedi/app/chat/pagination/chat_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/pagination/list/chat_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/chat/websockets/chat_websockets_handler_impl.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("chats_home_tab_bloc_impl.dart");

class ChatsListContainerBloc extends DisposableOwner
    implements IChatListContainerBloc {
  @override
  IChatCachedListService chatListService;

  @override
  IChatPaginationBloc chatPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IChat>, IChat> get
  chatPaginationListBloc => chatPaginationListWithNewItemsBloc;

  @override
  IPaginationListWithNewItemsBloc<PaginationPage<IChat>, IChat>
      chatPaginationListWithNewItemsBloc;

  final INotificationRepository notificationRepository;
  final IChatMessageRepository chatMessageRepository;
  final IChatRepository chatRepository;
  final IStatusRepository statusRepository;
  final IConversationRepository conversationRepository;
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
    chatListService = ChatCachedListService(
        pleromaChatService: pleromaChatService, chatRepository: chatRepository);
    addDisposable(disposable: chatListService);
    chatPaginationBloc = ChatPaginationBloc(
        itemsCountPerPage: 20,
        listService: chatListService,
        maximumCachedPagesCount: null);
    addDisposable(disposable: chatListService);
    chatPaginationListWithNewItemsBloc = ChatPaginationListWithNewItemsBloc(
      paginationBloc: chatPaginationBloc,
      cachedListService: chatListService,
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
                  .isRealtimeWebSocketsEnabled,
          conversationRepository:
              IConversationRepository.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          chatNewMessagesHandlerBloc:
              IChatNewMessagesHandlerBloc.of(context, listen: false));
}
