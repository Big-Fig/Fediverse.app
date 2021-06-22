import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_model.dart';

extension IPleromaConversationDbExtension on IPleromaApiConversation {
  DbConversation toDbConversation() {
    return DbConversation(
      id: null,
      remoteId: id,
      unread: unread == true,
      updatedAt: lastStatus?.createdAt,
    );
  }
}

extension IConversationChatExtension on IConversationChat {
  PleromaApiConversation toPleromaConversation({
    required IStatus? lastStatus,
    required List<IAccount> accounts,
  }) {
    var unread = this.unread;

    return PleromaApiConversation(
      unread: (unread > 0) ? true : false,
      lastStatus: lastStatus?.toPleromaApiStatus(),
      id: remoteId,
      accounts: accounts.toPleromaApiAccounts(),
      pleroma: pleroma?.toPleromaApiConversationPleromaPart(),
    );
  }
}
