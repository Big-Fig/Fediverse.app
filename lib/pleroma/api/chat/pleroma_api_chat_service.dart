import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiChatService extends IPleromaApiAuth {
  static IPleromaApiChatService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaApiChatService>(context, listen: listen);

  Future<List<IPleromaApiChat>> getChats({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiChatMessage>> getChatMessages({
    required String chatId,
    IPleromaApiPaginationRequest? pagination,
  });

  Future<IPleromaApiChat> markChatAsRead({
    required String chatId,
    required String lastReadChatMessageId,
  });

  Future<IPleromaApiChat> getChat({
    required String id,
  });

  Future<IPleromaApiChat> getOrCreateChatByAccountId({
    required String accountId,
  });

  Future<IPleromaApiChatMessage> sendMessage({
    required String chatId,
    required IPleromaApiChatMessageSendData data,
  });

  Future deleteChatMessage({
    required String chatMessageRemoteId,
    required String chatId,
  });
}
