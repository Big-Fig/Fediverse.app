import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/chat/pleroma/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/list/conversation_chat_list_bloc.dart';
import 'package:fedi/app/chat/conversation/list/cached/conversation_chat_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/list/cached/conversation_chat_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/pagination/conversation_chat_pagination_bloc.dart';
import 'package:fedi/app/chat/conversation/pagination/conversation_chat_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/pagination/list/conversation_chat_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/websockets/conversation_chat_websockets_handler_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
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
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IConversationChat>, IConversationChat>
      conversationPaginationListWithNewItemsBloc;
  @override
  IPaginationListBloc<PaginationPage<IConversationChat>, IConversationChat> get
      conversationPaginationListBloc =>
      conversationPaginationListWithNewItemsBloc;

  final INotificationRepository notificationRepository;
  final IStatusRepository statusRepository;
  final IConversationChatRepository conversationRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;

  ConversationChatListBloc({
    @required IPleromaConversationService pleromaConversationService,
    @required this.notificationRepository,
    @required this.statusRepository,
    @required this.conversationRepository,
    @required this.pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
    @required this.chatNewMessagesHandlerBloc,
  }) {
    _logger.finest(() => "constructor");
    conversationListService = ConversationChatCachedListBloc(
        pleromaConversationService: pleromaConversationService,
        conversationRepository: conversationRepository);
    addDisposable(disposable: conversationListService);
    conversationPaginationBloc = ConversationChatPaginationBloc(
        itemsCountPerPage: 20,
        listService: conversationListService,
        maximumCachedPagesCount: null);
    addDisposable(disposable: conversationListService);
    conversationPaginationListWithNewItemsBloc = ConversationChatPaginationListWithNewItemsBloc(
      paginationBloc: conversationPaginationBloc,
      cachedListService: conversationListService,
      mergeNewItemsImmediately: true,
    );
    addDisposable(disposable: conversationPaginationListBloc);

    if (listenWebSocketsChanges) {
      addDisposable(
          disposable: ConversationChatWebSocketsHandler(
        notificationRepository: notificationRepository,
        conversationRepository: conversationRepository,
        statusRepository: statusRepository,
        pleromaWebSocketsService: pleromaWebSocketsService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc, accountId: null,
      ));
    }
  }

  static ConversationChatListBloc createFromContext(
          BuildContext context) =>
      ConversationChatListBloc(
          pleromaConversationService:
              IPleromaConversationService.of(context, listen: false),
          conversationRepository:
              IConversationChatRepository.of(context, listen: false),
          notificationRepository:
              INotificationRepository.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          pleromaWebSocketsService:
              IPleromaWebSocketsService.of(context, listen: false),
          listenWebSocketsChanges:
              IMyAccountSettingsBloc.of(context, listen: false)
                  .isRealtimeWebSocketsEnabledFieldBloc.currentValue,
          chatNewMessagesHandlerBloc:
              IChatNewMessagesHandlerBloc.of(context, listen: false));
}
