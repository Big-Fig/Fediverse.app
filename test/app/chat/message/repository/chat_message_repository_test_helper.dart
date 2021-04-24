import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

class ChatMessageRepositoryTestHelper {
  static Future<DbChatMessage> insertDbChatMessage(
    PleromaChatMessageRepository chatMessageRepository,
    DbChatMessage chatMessageData,
  ) async {
    var id = await chatMessageRepository.insertInDbType(
      chatMessageData,
      mode: null,
    );
    assert(id > 0, true);
    var dbChatMessage = chatMessageData.copyWith(id: id);
    return dbChatMessage;
  }
}
