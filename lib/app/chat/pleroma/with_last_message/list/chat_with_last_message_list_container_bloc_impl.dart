import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/chat/pleroma/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/chat_repository.dart';
import 'package:fedi/app/chat/pleroma/websockets/chat_websockets_handler_impl.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/chat_with_last_message_repository.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/chat_with_last_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/chat_with_last_message_list_container_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/chat_with_last_message_pagination_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/chat_with_last_message_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/list/chat_with_last_message_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_repository.dart';
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

class ChatWithLastMessageListContainerBloc extends DisposableOwner
    implements IChatWithLastMessageListContainerBloc {
  @override
  IChatWithLastMessageCachedBloc chatListBloc;

  @override
  IChatWithLastMessagePaginationBloc chatPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IChatWithLastMessage>,
          IChatWithLastMessage>
      get chatPaginationListBloc => chatPaginationListWithNewItemsBloc;

  @override
  ICachedPaginationListWithNewItemsBloc<
      CachedPaginationPage<IChatWithLastMessage>,
      IChatWithLastMessage> chatPaginationListWithNewItemsBloc;

  final INotificationRepository notificationRepository;
  final IChatMessageRepository chatMessageRepository;
  final IChatRepository chatRepository;
  final IChatWithLastMessageRepository chatWithLastMessageRepository;
  final IStatusRepository statusRepository;
  final IConversationRepository conversationRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;

  ChatWithLastMessageListContainerBloc({
    @required IPleromaChatService pleromaChatService,
    @required this.notificationRepository,
    @required this.chatMessageRepository,
    @required this.chatRepository,
    @required this.chatWithLastMessageRepository,
    @required this.statusRepository,
    @required this.conversationRepository,
    @required this.pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
    @required this.chatNewMessagesHandlerBloc,
  }) {
    _logger.finest(() => "constructor");
    chatListBloc = ChatWithLastMessageCachedListBloc(
        pleromaChatService: pleromaChatService,
        chatWithLastMessageRepository: chatWithLastMessageRepository,
        chatRepository: chatRepository);
    addDisposable(disposable: chatListBloc);
    chatPaginationBloc = ChatWithLastMessagePaginationBloc(
        itemsCountPerPage: 20,
        listService: chatListBloc,
        maximumCachedPagesCount: null);
    addDisposable(disposable: chatListBloc);
    chatPaginationListWithNewItemsBloc =
        ChatWithLastMessagePaginationListWithNewItemsBloc(
      paginationBloc: chatPaginationBloc,
      cachedListBloc: chatListBloc,
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

  static ChatWithLastMessageListContainerBloc createFromContext(BuildContext context) =>
      ChatWithLastMessageListContainerBloc(
        pleromaChatService: IPleromaChatService.of(context, listen: false),
        chatWithLastMessageRepository:
            IChatWithLastMessageRepository.of(context, listen: false),
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
            IConversationRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        chatNewMessagesHandlerBloc:
            IChatNewMessagesHandlerBloc.of(context, listen: false),
        chatRepository: IChatRepository.of(context, listen: false),
      );
}
