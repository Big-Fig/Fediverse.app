import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:flutter/widgets.dart';

DbConversation mapRemoteConversationToDbConversation(
    IPleromaConversation remoteConversation) {
  return DbConversation(
      id: null,
      remoteId: remoteConversation.id,
      unread: remoteConversation.unread);
}

PleromaConversation mapLocalConversationToRemoteConversation(
        IConversation conversation,
        {@required IStatus lastStatus,
        @required List<IAccount> accounts}) =>
    PleromaConversation(
        unread: conversation.unread,
        lastStatus: mapLocalStatusToRemoteStatus(lastStatus),
        id: conversation.remoteId,
        accounts: accounts?.map(mapLocalAccountToRemoteAccount)?.toList());
