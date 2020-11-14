import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/websockets/conversation_chat_websockets_handler_impl.dart';
import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_repository.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/cached/conversation_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/cached/conversation_chat_with_last_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/conversation_chat_with_last_message_list_bloc.dart';
import 'package:fedi/app/chat/conversation/with_last_message/pagination/conversation_chat_with_last_message_pagination_bloc.dart';
import 'package:fedi/app/chat/conversation/with_last_message/pagination/conversation_chat_with_last_message_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/with_last_message/pagination/list/conversation_chat_with_last_message_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("conversation_chat_with_last_message_list_bloc_impl.dart");

class ConversationChatWithLastMessageListBloc extends DisposableOwner
    implements IConversationChatWithLastMessageListBloc {
  @override
  IConversationChatWithLastMessageCachedBloc chatListBloc;

  @override
  IConversationChatWithLastMessagePaginationBloc chatPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IConversationChatWithLastMessage>,
          IConversationChatWithLastMessage>
      get chatPaginationListBloc => chatPaginationListWithNewItemsBloc;

  @override
  ICachedPaginationListWithNewItemsBloc<
      CachedPaginationPage<IConversationChatWithLastMessage>,
      IConversationChatWithLastMessage> chatPaginationListWithNewItemsBloc;

  final INotificationRepository notificationRepository;
  final IStatusRepository statusRepository;
  final IConversationChatRepository chatRepository;
  final IConversationChatWithLastMessageRepository
      chatWithLastMessageRepository;
  final IConversationChatRepository conversationRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IConversationChatNewMessagesHandlerBloc
      conversationChatNewMessagesHandlerBloc;

  ConversationChatWithLastMessageListBloc({
    @required IPleromaConversationService conversationService,
    @required this.notificationRepository,
    @required this.chatRepository,
    @required this.chatWithLastMessageRepository,
    @required this.statusRepository,
    @required this.conversationRepository,
    @required this.pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
    @required this.chatNewMessagesHandlerBloc,
    @required this.conversationChatNewMessagesHandlerBloc,
  }) {
    _logger.finest(() => "constructor");
    chatListBloc = ConversationChatWithLastMessageCachedListBloc(
        conversationChatService: conversationService,
        chatWithLastMessageRepository: chatWithLastMessageRepository,
        conversationRepository: chatRepository);
    addDisposable(disposable: chatListBloc);
    chatPaginationBloc = ConversationChatWithLastMessagePaginationBloc(
        itemsCountPerPage: 20,
        listService: chatListBloc,
        maximumCachedPagesCount: null);
    addDisposable(disposable: chatListBloc);
    chatPaginationListWithNewItemsBloc =
        ConversationChatWithLastMessagePaginationListWithNewItemsBloc(
      paginationBloc: chatPaginationBloc,
      cachedListBloc: chatListBloc,
      mergeNewItemsImmediately: true,
    );
    addDisposable(disposable: chatPaginationListWithNewItemsBloc);

    if (listenWebSocketsChanges) {
      addDisposable(
          disposable: ConversationChatWebSocketsHandler(
        notificationRepository: notificationRepository,
        conversationRepository: conversationRepository,
        statusRepository: statusRepository,
        pleromaWebSocketsService: pleromaWebSocketsService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        accountId: null,
      ));
    }
  }

  static ConversationChatWithLastMessageListBloc createFromContext(
          BuildContext context) =>
      ConversationChatWithLastMessageListBloc(
        chatWithLastMessageRepository:
            IConversationChatWithLastMessageRepository.of(context,
                listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        listenWebSocketsChanges:
            IWebSocketsSettingsBloc.of(context, listen: false)
                .isRealtimeWebSocketsEnabled,
        conversationRepository:
            IConversationChatRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        chatNewMessagesHandlerBloc:
            IPleromaChatNewMessagesHandlerBloc.of(context, listen: false),
        conversationChatNewMessagesHandlerBloc:
            IConversationChatNewMessagesHandlerBloc.of(context, listen: false),
        chatRepository: IConversationChatRepository.of(context, listen: false),
        conversationService: IPleromaConversationService.of(
          context,
          listen: false,
        ),
      );
}
