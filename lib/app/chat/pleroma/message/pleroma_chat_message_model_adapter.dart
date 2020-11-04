import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;

DbChatMessagePopulatedWrapper mapRemoteChatMessageToLocalPleromaChatMessage(
    pleroma_lib.IPleromaChatMessage remoteChatMessage, DbAccount dbAccount) {
  return DbChatMessagePopulatedWrapper(DbChatMessagePopulated(
    dbChatMessage: mapRemoteChatMessageToDbPleromaChatMessage(remoteChatMessage),
    dbAccount: dbAccount,
  ));
}

DbChatMessage mapRemoteChatMessageToDbPleromaChatMessage(
    pleroma_lib.IPleromaChatMessage remoteChatMessage) {
  return DbChatMessage(
    id: null,
    remoteId: remoteChatMessage.id,
    createdAt: remoteChatMessage.createdAt,
    content: remoteChatMessage.content,
    emojis: remoteChatMessage.emojis,
    card: remoteChatMessage.card,
    mediaAttachment: remoteChatMessage.mediaAttachment,
    accountRemoteId: remoteChatMessage.accountId,
    chatRemoteId: remoteChatMessage.chatId,
  );
}

pleroma_lib.PleromaChatMessage mapLocalPleromaChatMessageToRemoteChatMessage(
    IPleromaChatMessage localChatMessage) {
  if (localChatMessage == null) {
    return null;
  }
  return pleroma_lib.PleromaChatMessage(
    id: localChatMessage.remoteId,
    createdAt: localChatMessage.createdAt,
    content: localChatMessage.content,
    emojis: localChatMessage.emojis,
    mediaAttachment: localChatMessage.mediaAttachment,
    accountId: localChatMessage.account.remoteId,
    chatId: localChatMessage.chatRemoteId,
    card: localChatMessage.card,
  );
}
