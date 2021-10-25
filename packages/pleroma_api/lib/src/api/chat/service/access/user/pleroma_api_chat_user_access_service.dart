import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../message/pleroma_api_chat_message_model.dart';
import '../../../message/post/pleroma_api_post_chat_message_model.dart';
import '../../../pleroma_api_chat_model.dart';

abstract class IPleromaApiChatUserAccessService extends IPleromaApiService {
  IPleromaApiFeature get getChatsFeature;

  Future<List<IPleromaApiChat>> getChats({
    required IPleromaApiPagination? pagination,
  });

  IPleromaApiFeature get getChatMessagesFeature;

  Future<List<IPleromaApiChatMessage>> getChatMessages({
    required String chatId,
    required IPleromaApiPagination? pagination,
  });

  IPleromaApiFeature get markChatAsReadFeature;

  Future<IPleromaApiChat> markChatAsRead({
    required String chatId,
    required String lastReadChatMessageId,
  });

  IPleromaApiFeature get getChatFeature;

  Future<IPleromaApiChat> getChat({
    required String id,
  });

  IPleromaApiFeature get getOrCreateChatByAccountIdFeature;

  Future<IPleromaApiChat> getOrCreateChatByAccountId({
    required String accountId,
  });

  IPleromaApiFeature get sendMessageFeature;

  Future<IPleromaApiChatMessage> sendMessage({
    required String? idempotencyKey,
    required String chatId,
    required IPleromaApiPostChatMessage postChatMessage,
  });

  IPleromaApiFeature get deleteChatMessageFeature;

  Future<void> deleteChatMessage({
    required String chatMessageId,
    required String chatId,
  });
}
