import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:flutter/widgets.dart';

DbConversation mapRemoteConversationToDbConversationChat(
    IPleromaConversation remoteConversation) {
  return DbConversation(
    id: null,
    remoteId: remoteConversation.id,
    unread: remoteConversation.unread,
    updatedAt: remoteConversation?.lastStatus?.createdAt
  );
}

PleromaConversation mapLocalConversationChatToRemoteConversation(
    IConversationChat conversation,
    {@required IStatus lastStatus,
    @required List<IAccount> accounts}) {
  var unread = conversation.unread;
  return PleromaConversation(
    unread: (unread != null && unread > 0) ? true : false,
    lastStatus: mapLocalStatusToRemoteStatus(lastStatus),
    id: conversation.remoteId,
    accounts: accounts?.map(mapLocalAccountToRemoteAccount)?.toList(),
  );
}
