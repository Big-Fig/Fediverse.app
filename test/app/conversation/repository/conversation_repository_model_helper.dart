import 'package:fedi/app/conversation/repository/conversation_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbConversation> insertDbConversation(
  ConversationRepository conversationRepository,
  DbConversation conversationData,
) async {
  var id = await conversationRepository.insert(conversationData);
  assert(id != null, true);
  var dbConversation = conversationData.copyWith(id: id);
  return dbConversation;
}
