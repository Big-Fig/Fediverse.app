// import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
// import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
// import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_repository.dart';
// import 'package:fedi/app/chat/conversation/with_last_message/list/cached/conversation_chat_with_last_message_cached_list_bloc.dart';
// import 'package:fedi/app/chat/conversation/with_last_message/list/conversation_chat_with_last_message_list_bloc.dart';
// import 'package:fedi/app/chat/conversation/with_last_message/pagination/conversation_chat_with_last_message_pagination_bloc.dart';
// import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
// import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
// import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
// import 'package:fedi/app/chat/pleroma/websockets/pleroma_chat_websockets_handler_impl.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_repository.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc_impl.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/list/pleroma_chat_with_last_message_list_bloc.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/pagination/pleroma_chat_with_last_message_pagination_bloc.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/pagination/pleroma_chat_with_last_message_pagination_bloc_impl.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/pagination/list/pleroma_chat_with_last_message_pagination_list_with_new_items_bloc_impl.dart';
// import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
// import 'package:fedi/app/notification/repository/notification_repository.dart';
// import 'package:fedi/app/status/repository/status_repository.dart';
// import 'package:fedi/disposable/disposable_owner.dart';
// import 'package:fedi/pagination/cached/cached_pagination_model.dart';
// import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
// import 'package:fedi/pagination/list/pagination_list_bloc.dart';
// import 'package:fedi/pagination/pagination_model.dart';
// import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
// import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
// import 'package:flutter/material.dart';
// import 'package:logging/logging.dart';
//
// var _logger = Logger("chats_home_tab_bloc_impl.dart");
//
// class ConversationChatWithLastMessageListBloc extends DisposableOwner
//     implements IConversationChatWithLastMessageListBloc {
//   @override
//   IConversationChatWithLastMessageCachedBloc chatListBloc;
//
//   @override
//   IConversationChatWithLastMessagePaginationBloc chatPaginationBloc;
//
//   @override
//   IPaginationListBloc<PaginationPage<IConversationChatWithLastMessage>,
//           IConversationChatWithLastMessage>
//       get chatPaginationListBloc => chatPaginationListWithNewItemsBloc;
//
//   @override
//   ICachedPaginationListWithNewItemsBloc<
//       CachedPaginationPage<IConversationChatWithLastMessage>,
//       IConversationChatWithLastMessage> chatPaginationListWithNewItemsBloc;
//
//   final INotificationRepository notificationRepository;
//   final IConversationChatMessageRepository chatMessageRepository;
//   final IConversationChatRepository chatRepository;
//   final IConversationChatWithLastMessageRepository chatWithLastMessageRepository;
//   final IStatusRepository statusRepository;
//   final IConversationChatRepository conversationRepository;
//   final IPleromaWebSocketsService pleromaWebSocketsService;
//   final IConversationChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
//
//   ConversationChatWithLastMessageListBloc({
//     @required IConversationChatService ConversationChatService,
//     @required this.notificationRepository,
//     @required this.chatMessageRepository,
//     @required this.chatRepository,
//     @required this.chatWithLastMessageRepository,
//     @required this.statusRepository,
//     @required this.conversationRepository,
//     @required this.pleromaWebSocketsService,
//     @required bool listenWebSocketsChanges,
//     @required this.chatNewMessagesHandlerBloc,
//   }) {
//     _logger.finest(() => "constructor");
//     chatListBloc = ConversationChatWithLastMessageCachedListBloc(
//         ConversationChatService: ConversationChatService,
//         chatWithLastMessageRepository: chatWithLastMessageRepository,
//         chatRepository: chatRepository);
//     addDisposable(disposable: chatListBloc);
//     chatPaginationBloc = ConversationChatWithLastMessagePaginationBloc(
//         itemsCountPerPage: 20,
//         listService: chatListBloc,
//         maximumCachedPagesCount: null);
//     addDisposable(disposable: chatListBloc);
//     chatPaginationListWithNewItemsBloc =
//         ConversationChatWithLastMessagePaginationListWithNewItemsBloc(
//       paginationBloc: chatPaginationBloc,
//       cachedListBloc: chatListBloc,
//       mergeNewItemsImmediately: true,
//     );
//     addDisposable(disposable: chatPaginationListWithNewItemsBloc);
//
//     if (listenWebSocketsChanges) {
//       addDisposable(
//           disposable: ConversationChatWebSocketsHandler(
//         notificationRepository: notificationRepository,
//         conversationRepository: conversationRepository,
//         statusRepository: statusRepository,
//         pleromaWebSocketsService: pleromaWebSocketsService,
//         chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
//       ));
//     }
//   }
//
//   static ConversationChatWithLastMessageListBloc createFromContext(BuildContext context) =>
//       ConversationChatWithLastMessageListBloc(
//         ConversationChatService: IConversationChatService.of(context, listen: false),
//         chatWithLastMessageRepository:
//             IConversationChatWithLastMessageRepository.of(context, listen: false),
//         notificationRepository:
//             INotificationRepository.of(context, listen: false),
//         chatMessageRepository:
//             IConversationChatMessageRepository.of(context, listen: false),
//         pleromaWebSocketsService:
//             IPleromaWebSocketsService.of(context, listen: false),
//         listenWebSocketsChanges:
//             IMyAccountSettingsBloc.of(context, listen: false)
//                 .isRealtimeWebSocketsEnabledFieldBloc
//                 .currentValue,
//         conversationRepository:
//             IConversationChatRepository.of(context, listen: false),
//         statusRepository: IStatusRepository.of(context, listen: false),
//         chatNewMessagesHandlerBloc:
//             IConversationChatNewMessagesHandlerBloc.of(context, listen: false),
//         chatRepository: IConversationChatRepository.of(context, listen: false),
//       );
// }
