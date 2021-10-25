import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository_impl.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

class ChatRepositoryMockHelper {
  static Future<DbChat> insertDbChat(
    UnifediChatRepository chatRepository,
    DbChat chatData,
  ) async {
    var id = await chatRepository.insertInDbType(
      chatData,
      mode: null,
    );
    assert(id > 0, true);
    var dbChat = chatData.copyWith(id: id);

    return dbChat;
  }
}
