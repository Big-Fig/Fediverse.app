import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/pleroma/chat/pleroma_chat_model.dart';

DbChatMessagePopulatedWrapper mapRemoteChatMessageToLocalChatMessage(
    IPleromaChatMessage remoteChatMessage, DbAccount dbAccount) {
  return DbChatMessagePopulatedWrapper(DbChatMessagePopulated(
    dbChatMessage: mapRemoteChatMessageToDbChatMessage(remoteChatMessage),
    dbAccount: dbAccount,
  ));
}

DbChatMessage mapRemoteChatMessageToDbChatMessage(
    IPleromaChatMessage remoteChatMessage) {
  return DbChatMessage(
      id: null,
      remoteId: remoteChatMessage.id,
      createdAt: remoteChatMessage.createdAt,
      content: remoteChatMessage.content,
      emojis: remoteChatMessage.emojis,
      accountRemoteId: remoteChatMessage.accountId,
      chatRemoteId: remoteChatMessage.chatId);
}

PleromaChatMessage mapLocalChatMessageToRemoteChatMessage(
    IChatMessage localChatMessage) {
  if (localChatMessage == null) {
    return null;
  }
  return PleromaChatMessage(
    id: localChatMessage.remoteId,
    createdAt: localChatMessage.createdAt,
    content: localChatMessage.content,
    emojis: localChatMessage.emojis,
    accountId: localChatMessage.account.remoteId,
    chatId: localChatMessage.chatRemoteId,
  );
}
