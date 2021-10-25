import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository_impl.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

class ConversationRepositoryMockHelper {
  static Future<DbConversation> insertDbConversation(
    ConversationChatRepository conversationRepository,
    DbConversation conversationData,
  ) async {
    var id = await conversationRepository.insertInDbType(
      conversationData,
      mode: null,
    );
    assert(id > 0, true);
    var dbConversation = conversationData.copyWith(id: id);

    return dbConversation;
  }
}
