import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/chat_message_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
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
      updatedAt: updatedAt,
      accountRemoteId: remoteChat.account?.id);
}

PleromaChat mapLocalChatToRemoteChat(IChat chat,
    {@required IChatMessage lastChatMessage,
    @required List<IAccount> accounts}) {
  assert(accounts?.isNotEmpty == true);
  assert(accounts.length < 2, "only direct chats supported");
  return PleromaChat(
      unread: chat.unread,
      lastMessage: mapLocalChatMessageToRemoteChatMessage(lastChatMessage),
      id: chat.remoteId,
      account: mapLocalAccountToRemoteAccount(accounts.first),
      updatedAt: chat.updatedAt
//        accounts: accounts?.map(mapLocalAccountToRemoteAccount)?.toList()
      );
}
