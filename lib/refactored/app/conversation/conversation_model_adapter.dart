import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:logging/logging.dart';

var _logger = Logger("conversation_model_adapter.dart");

DbConversation mapRemoteConversationToDbConversation(
    IPleromaConversation remoteConversation) {
  return DbConversation(
      id: null,
      remoteId: remoteConversation.id,
      unread: remoteConversation.unread);
}
