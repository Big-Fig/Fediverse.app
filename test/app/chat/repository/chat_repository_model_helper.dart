import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbChat> insertDbChat(
  PleromaChatRepository chatRepository,
  DbChat chatData,
) async {
  var id = await chatRepository.insert(chatData);
  assert(id != null, true);
  var dbChat = chatData.copyWith(id: id);
  return dbChat;
}
