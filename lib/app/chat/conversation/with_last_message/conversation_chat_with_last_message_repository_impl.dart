// import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
// import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
// import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
// import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
// import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_repository.dart';
// import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
// import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
// import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
// import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
// import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_repository.dart';
// import 'package:fedi/app/status/repository/status_repository.dart';
// import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
// import 'package:flutter/widgets.dart';
//
// class ConversationChatWithLastMessageRepository extends AsyncInitLoadingBloc
//     implements IConversationChatWithLastMessageRepository {
//   final IConversationChatRepository conversationChatRepository;
//   final IStatusRepository statusRepository;
//
//   ConversationChatWithLastMessageRepository({
//     @required this.conversationChatRepository,
//     @required this.statusRepository,
//   });
//
//   @override
//   Future internalAsyncInit() async {
//     // nothing by now
//   }
//
//   @override
//   Future<IConversationChatWithLastMessage> getChatWithLastMessage({
//     @required IConversationChat olderThan,
//     @required IConversationChat newerThan,
//     @required ConversationOrderingTermData orderingTermData,
//   }) async {
//     var chat = await conversationChatRepository.getConversation(
//         olderThan: olderThan,
//         newerThan: newerThan,
//         orderingTermData: orderingTermData);
//
//     return await _createChatWithLastMessage(chat);
//   }
//
//   Future<ConversationChatWithLastMessageWrapper> _createChatWithLastMessage(
//           DbConversationChatPopulatedWrapper chat) async =>
//       ConversationChatWithLastMessageWrapper(
//         chat: chat,
//         lastChatMessage:
//             await statusRepository.getChatLastChatMessage(chat: chat),
//       );
//
//   @override
//   Stream<IConversationChatWithLastMessage> watchChatWithLastMessage({
//     @required IConversationChat olderThan,
//     @required IConversationChat newerThan,
//     @required PleromaChatOrderingTermData orderingTermData,
//   }) =>
//       conversationChatRepository
//           .watchChat(
//               olderThan: olderThan,
//               newerThan: newerThan,
//               orderingTermData: orderingTermData)
//           .asyncMap((chat) => _createChatWithLastMessage(chat));
//
//   @override
//   Future<List<IConversationChatWithLastMessage>> getChatsWithLastMessage({
//     @required IConversationChat olderThan,
//     @required IConversationChat newerThan,
//     @required int limit,
//     @required int offset,
//     @required PleromaChatOrderingTermData orderingTermData,
//   }) async {
//     var chats = await conversationChatRepository.getChats(
//         olderThan: olderThan,
//         newerThan: newerThan,
//         limit: limit,
//         offset: offset,
//         orderingTermData: orderingTermData);
//
//     return await _createChatWithLastMessageList(chats);
//   }
//
//   Future<List<ConversationChatWithLastMessageWrapper>> _createChatWithLastMessageList(
//       List<DbConversationChatPopulatedWrapper> chats) async {
//     var chatLastMessagesMap =
//         await statusRepository.getChatsLastChatMessage(chats: chats);
//     return chatLastMessagesMap.entries.map((entry) {
//       var chat = entry.key;
//       var lastChatMessage = entry.value;
//       return ConversationChatWithLastMessageWrapper(
//           chat: chat, lastChatMessage: lastChatMessage);
//     }).toList();
//   }
//
//   @override
//   Stream<List<IConversationChatWithLastMessage>> watchChatsWithLastMessage({
//     @required IConversationChat olderThan,
//     @required IConversationChat newerThan,
//     @required int limit,
//     @required int offset,
//     @required PleromaChatOrderingTermData orderingTermData,
//   }) {
//     return conversationChatRepository
//         .watchChats(
//             olderThan: olderThan,
//             newerThan: newerThan,
//             limit: limit,
//             offset: offset,
//             orderingTermData: orderingTermData)
//         .asyncMap((chats) => _createChatWithLastMessageList(chats));
//   }
// }
