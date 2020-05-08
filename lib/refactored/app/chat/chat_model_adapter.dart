import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/pleroma/chat/pleroma_chat_model.dart';
import 'package:flutter/widgets.dart';

DbChat mapRemoteChatToDbChat(IPleromaChat remoteChat) {
  return DbChat(
      id: null,
      remoteId: remoteChat.id,
      unread: remoteChat.unread);
}

PleromaChat mapLocalChatToRemoteChat(IChat chat,
        {@required IChatMessage lastMessage,
        @required List<IAccount> accounts}) =>
    PleromaChat(
        unread: chat.unread,
//        lastMessage: mapLocalMessageToRemoteMessage(lastMessage),
        id: chat.remoteId,
        account: mapLocalAccountToRemoteAccount(accounts.first)
//        accounts: accounts?.map(mapLocalAccountToRemoteAccount)?.toList()
        );
