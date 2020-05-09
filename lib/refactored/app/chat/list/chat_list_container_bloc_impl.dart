import 'package:fedi/refactored/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/list/cached/chat_cached_list_service.dart';
import 'package:fedi/refactored/app/chat/list/cached/chat_cached_list_service_impl.dart';
import 'package:fedi/refactored/app/chat/list/chat_list_container_bloc.dart';
import 'package:fedi/refactored/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/refactored/app/chat/pagination/chat_pagination_bloc.dart';
import 'package:fedi/refactored/app/chat/pagination/chat_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/chat/pagination/list/chat_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/app/chat/repository/chat_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("chats_home_tab_bloc_impl.dart");

class ChatsListContainerBloc extends DisposableOwner implements IChatListContainerBloc {
  @override
  IChatCachedListService chatListService;

  @override
  IChatPaginationBloc chatPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IChat>, IChat> chatPaginationListBloc;

  final INotificationRepository notificationRepository;
  final IChatMessageRepository chatMessageRepository;
  final IChatRepository chatRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;

  ChatsListContainerBloc({
    @required IPleromaChatService pleromaChatService,
    @required this.notificationRepository,
    @required this.chatMessageRepository,
    @required this.chatRepository,
    @required this.pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
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
    chatPaginationListBloc = ChatPaginationListWithNewItemsBloc(
      paginationBloc: chatPaginationBloc,
      cachedListService: chatListService,
      mergeNewItemsImmediately: true,
    );
    addDisposable(disposable: chatPaginationListBloc);

//    if (listenWebSocketsChanges) {
//      addDisposable(
//          disposable: MyAccountChatsWebSocketsHandler(
//              notificationRepository: notificationRepository,
//              chatRepository: chatRepository,
//              chatMessageRepository: chatMessageRepository,
//              pleromaWebSocketsService: pleromaWebSocketsService));
//    }
  }

  static ChatsListContainerBloc createFromContext(BuildContext context) => ChatsListContainerBloc(
        pleromaChatService: IPleromaChatService.of(context, listen: false),
        chatRepository: IChatRepository.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        chatMessageRepository: IChatMessageRepository.of(context, listen: false),
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        listenWebSocketsChanges:
            IMyAccountSettingsBloc.of(context, listen: false)
                .isRealtimeWebSocketsEnabled,
      );
}
