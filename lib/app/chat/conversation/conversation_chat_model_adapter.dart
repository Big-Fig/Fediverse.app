import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';

extension IPleromaConversationDbExtension on IPleromaConversation {
  DbConversation toDbConversation() {
    return DbConversation(
      id: null,
      remoteId: id,
      unread: unread,
      updatedAt: lastStatus?.createdAt,
    );
  }
}

extension IConversationChatExtension on IConversationChat {
  PleromaConversation toPleromaConversation({
    required IStatus? lastStatus,
    required List<IAccount> accounts,
  }) {
    var unread = this.unread;
    return PleromaConversation(
      unread: (unread != null && unread > 0) ? true : false,
      lastStatus: lastStatus?.toPleromaStatus(),
      id: remoteId,
      accounts: accounts.toPleromaAccounts(),
      pleroma: pleroma?.toPleromaConversationPleromaPart(),
    );
  }
}
