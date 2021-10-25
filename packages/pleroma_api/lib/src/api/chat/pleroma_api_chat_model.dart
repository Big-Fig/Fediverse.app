import '../account/pleroma_api_account_model.dart';
import '../pleroma_api_model.dart';
import 'message/pleroma_api_chat_message_model.dart';

abstract class IPleromaApiChat implements IPleromaApiResponse {
  String get id;

  int get unread;

  DateTime? get updatedAt;

  IPleromaApiAccount get account;

  IPleromaApiChatMessage? get lastMessage;
}
