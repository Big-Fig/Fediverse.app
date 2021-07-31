import 'package:pleroma_fediverse_api/src/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';

abstract class IPleromaApiChatService extends IPleromaApiAuth {
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
