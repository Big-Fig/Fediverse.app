import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/chat/pleroma_chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatService implements IPleromaApi {
  static IPleromaChatService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaChatService>(context, listen: listen);

  Future<List<IPleromaChat>> getChats({
    String sinceId,
    String minId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaChatMessage>> getChatMessages({
    @required String chatId,
    String sinceId,
    String minId,
    String maxId,
    int limit = 20,
  });

  Future<IPleromaChat> markChatAsRead({@required String chatId});

  Future<IPleromaChat> getOrCreateChatByAccountId({@required String accountId});

  Future<IPleromaChatMessage> sendMessage(
      {@required String chatId, @required IPleromaChatMessageSendData data});
}
