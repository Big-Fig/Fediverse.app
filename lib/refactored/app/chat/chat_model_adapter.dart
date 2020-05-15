import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_model_adapter.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/pleroma/chat/pleroma_chat_model.dart';
import 'package:flutter/widgets.dart';

DbChat mapRemoteChatToDbChat(IPleromaChat remoteChat) {
  var updatedAt = remoteChat.updatedAt;
  // todo: hack
  // sometimes updatedAt not exposed on server side
  updatedAt ??= remoteChat.lastMessage?.createdAt;
  return DbChat(
      id: null,
      remoteId: remoteChat.id,
      unread: remoteChat.unread,
      updatedAt: updatedAt);
}

PleromaChat mapLocalChatToRemoteChat(IChat chat,
    {@required IChatMessage lastMessage, @required List<IAccount> accounts}) {
  assert(accounts?.isNotEmpty == true);
  assert(accounts.length < 2, "only direct chats supported");
  return PleromaChat(
      unread: chat.unread,
      lastMessage: mapLocalChatMessageToRemoteChatMessage(lastMessage),
      id: chat.remoteId,
      account: mapLocalAccountToRemoteAccount(accounts.first),
      updatedAt: chat.updatedAt
//        accounts: accounts?.map(mapLocalAccountToRemoteAccount)?.toList()
      );
}
