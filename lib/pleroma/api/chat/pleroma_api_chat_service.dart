import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatService extends IPleromaAuthApi {
  static IPleromaChatService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaChatService>(context, listen: listen);

  Future<List<IPleromaChat>> getChats({
    IPleromaPaginationRequest? pagination,
  });

  Future<List<IPleromaChatMessage>> getChatMessages({
    required String? chatId,
    IPleromaPaginationRequest? pagination,
  });

  Future<IPleromaChat> markChatAsRead({
    required String? chatId,
    required String? lastReadChatMessageId,
  });

  Future<IPleromaChat> getChat({
    required String? id,
  });

  Future<IPleromaChat> getOrCreateChatByAccountId({
    required String? accountId,
  });

  Future<IPleromaChatMessage> sendMessage({
    required String? chatId,
    required IPleromaChatMessageSendData data,
  });

  Future deleteChatMessage({
    required String? chatMessageRemoteId,
    required String? chatId,
  });
}
