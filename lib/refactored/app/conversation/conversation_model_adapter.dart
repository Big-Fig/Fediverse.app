import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';

DbConversation mapRemoteConversationToDbConversation(
    IPleromaConversation remoteConversation) {
  return DbConversation(
      id: null,
      remoteId: remoteConversation.id,
      unread: remoteConversation.unread);
}
