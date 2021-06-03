import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

class ConversationRepositoryTestHelper {
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
