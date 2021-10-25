import '../../feature/unifedi_api_feature_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../unifedi_api_service.dart';
import '../message/post/unifedi_api_post_chat_message_model.dart';
import '../message/unifedi_api_chat_message_model.dart';
import '../unifedi_api_chat_model.dart';

abstract class IUnifediApiChatService extends IUnifediApiService {
  IUnifediApiFeature get getChatsFeature;

  Future<List<IUnifediApiChat>> getChats({
    required IUnifediApiPagination? pagination,
  });

  IUnifediApiFeature get getChatMessagesFeature;

  Future<List<IUnifediApiChatMessage>> getChatMessages({
    required String chatId,
    required IUnifediApiPagination? pagination,
  });

  IUnifediApiFeature get markChatAsReadFeature;

  Future<IUnifediApiChat> markChatAsRead({
    required String chatId,
    required String lastReadChatMessageId,
  });

  IUnifediApiFeature get getChatFeature;

  Future<IUnifediApiChat> getChat({
    required String id,
  });

  IUnifediApiFeature get getOrCreateChatByAccountIdFeature;

  Future<IUnifediApiChat> getOrCreateChatByAccountId({
    required String accountId,
  });

  IUnifediApiFeature get sendMessageFeature;

  Future<IUnifediApiChatMessage> sendMessage({
    required String? idempotencyKey,
    required String chatId,
    required IUnifediApiPostChatMessage postChatMessage,
  });

  IUnifediApiFeature get deleteChatMessageFeature;

  Future<void> deleteChatMessage({
    required String chatMessageId,
    required String chatId,
  });
}
