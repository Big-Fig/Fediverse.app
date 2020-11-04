import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbChatMessage> insertDbChatMessage(
  ChatMessageRepository chatMessageRepository,
  DbChatMessage chatMessageData,
) async {
  var id = await chatMessageRepository.insert(chatMessageData);
  assert(id != null, true);
  var dbChatMessage = chatMessageData.copyWith(id: id);
  return dbChatMessage;
}
