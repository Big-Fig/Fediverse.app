import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository_impl.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

class ChatMessageRepositoryMockHelper {
  static Future<DbChatMessage> insertDbChatMessage(
    UnifediChatMessageRepository chatMessageRepository,
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
