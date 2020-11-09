import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:flutter/widgets.dart';

DbChat mapRemoteChatToDbPleromaChat(pleroma_lib.IPleromaChat remoteChat) {
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

pleroma_lib.PleromaChat mapLocalPleromaChatToRemoteChat(IPleromaChat chat,
    {@required IPleromaChatMessage lastChatMessage,
    @required List<IAccount> accounts}) {
  assert(accounts?.isNotEmpty == true);
  assert(accounts.length < 2, "only direct chats supported");
  return pleroma_lib.PleromaChat(
      unread: chat.unread,
      lastMessage: mapLocalPleromaChatMessageToRemoteChatMessage(lastChatMessage),
      id: chat.remoteId,
      account: mapLocalAccountToRemoteAccount(accounts.first),
      updatedAt: chat.updatedAt
//        accounts: accounts?.map(mapLocalAccountToRemoteAccount)?.toList()
      );
}
