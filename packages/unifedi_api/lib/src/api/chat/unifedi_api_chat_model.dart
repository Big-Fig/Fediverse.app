import '../account/unifedi_api_account_model.dart';
import '../unifedi_api_model.dart';
import 'message/unifedi_api_chat_message_model.dart';

abstract class IUnifediApiChat implements IUnifediApiResponse {
  String get id;

  int get unread;

  DateTime? get updatedAt;

  IUnifediApiAccount get account;

  IUnifediApiChatMessage? get lastMessage;
}
