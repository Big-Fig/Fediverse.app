import '../../../api/chat/message/post/unifedi_api_post_chat_message_model.dart';
import '../../../api/chat/message/unifedi_api_chat_message_model.dart';
import '../../../api/chat/service/unifedi_api_chat_service.dart';
import '../../../api/chat/unifedi_api_chat_model.dart';
import '../../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';

class UnifediApiChatServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter implements IUnifediApiChatService {
  @override
  final IUnifediApiRestService restService;

  UnifediApiChatServiceMastodonAdapter({
    required this.restService,
  });

  @override
  Future<void> deleteChatMessage({
    required String chatMessageId,
    required String chatId,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: deleteChatMessageFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get deleteChatMessageFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'deleteChatMessageFeature',
      );

  @override
  Future<IUnifediApiChat> getChat({
    required String id,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getChatFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getChatFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getChatFeature',
      );

  @override
  Future<List<IUnifediApiChatMessage>> getChatMessages({
    required String chatId,
    required IUnifediApiPagination? pagination,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getChatMessagesFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getChatMessagesFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getChatMessagesFeature',
      );

  @override
  Future<List<IUnifediApiChat>> getChats({
    required IUnifediApiPagination? pagination,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getChatsFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getChatsFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getChatsFeature',
      );

  @override
  Future<IUnifediApiChat> getOrCreateChatByAccountId({
    required String accountId,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getOrCreateChatByAccountIdFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getOrCreateChatByAccountIdFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getOrCreateChatByAccountIdFeature',
      );

  @override
  Future<IUnifediApiChat> markChatAsRead({
    required String chatId,
    required String lastReadChatMessageId,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: markChatAsReadFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get markChatAsReadFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'markChatAsReadFeature',
      );

  @override
  Future<IUnifediApiChatMessage> sendMessage({
    required String? idempotencyKey,
    required String chatId,
    required IUnifediApiPostChatMessage postChatMessage,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: sendMessageFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get sendMessageFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'sendMessageFeature',
      );
}
