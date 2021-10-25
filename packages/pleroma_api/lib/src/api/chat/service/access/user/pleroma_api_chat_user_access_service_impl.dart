import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../message/pleroma_api_chat_message_model.dart';
import '../../../message/pleroma_api_chat_message_model_impl.dart';
import '../../../message/post/pleroma_api_post_chat_message_model.dart';
import '../../../pleroma_api_chat_model.dart';
import '../../../pleroma_api_chat_model_impl.dart';
import 'pleroma_api_chat_user_access_service.dart';

// ignore_for_file: no-magic-number

class PleromaApiChatUserAccessService extends PleromaApiService
    implements IPleromaApiChatUserAccessService {
  static const v1ChatRelativeUrlPath = '/api/v1/pleroma/chats';
  static const v2ChatRelativeUrlPath = '/api/v2/pleroma/chats';

  PleromaApiChatUserAccessService({
    required IPleromaApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IPleromaApiChat>> getChats({
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getChatsFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: v2ChatRelativeUrlPath,
          queryArgs: pagination?.toQueryArgs(),
        ),
        jsonParser: (json) => PleromaApiChat.fromJson(json),
      );

  @override
  Future<List<IPleromaApiChatMessage>> getChatMessages({
    required String chatId,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getChatMessagesFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              v1ChatRelativeUrlPath,
              chatId,
              'messages',
            ],
          ),
          queryArgs: pagination?.toQueryArgs(),
        ),
        jsonParser: (json) => PleromaApiChatMessage.fromJson(json),
      );

  @override
  Future<IPleromaApiChat> markChatAsRead({
    required String chatId,
    required String lastReadChatMessageId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: markChatAsReadFeature,
        fieldFeatures: null,
        request: RestRequest.post(
          relativePath: UrlPathHelper.join(
            [
              v1ChatRelativeUrlPath,
              chatId,
              'read',
            ],
          ),
          bodyJson: <String, dynamic>{
            'last_read_id': lastReadChatMessageId,
          },
        ),
        jsonParser: (json) => PleromaApiChat.fromJson(json),
      );

  @override
  Future<IPleromaApiChat> getOrCreateChatByAccountId({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getOrCreateChatByAccountIdFeature,
        fieldFeatures: null,
        request: RestRequest.post(
          relativePath: UrlPathHelper.join(
            [
              v1ChatRelativeUrlPath,
              'by-account-id',
              accountId,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiChat.fromJson(json),
      );

  @override
  Future<IPleromaApiChat> getChat({
    required String id,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getChatFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              v1ChatRelativeUrlPath,
              id,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiChat.fromJson(json),
      );

  @override
  Future<IPleromaApiChatMessage> sendMessage({
    required String? idempotencyKey,
    required String chatId,
    required IPleromaApiPostChatMessage postChatMessage,
  }) {
    assert(
      !(postChatMessage.content != null && postChatMessage.mediaId != null),
      'Cant send content and media in one message',
    );

    return restService.sendHttpRequestAndParseJson(
      requestFeature: sendMessageFeature,
      fieldFeatures: null,
      request: RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            v1ChatRelativeUrlPath,
            chatId,
            'messages',
          ],
        ),
        headers: [
          if (idempotencyKey != null && idempotencyKey.isNotEmpty)
            RestHeader(
              key: 'Idempotency-Key',
              value: idempotencyKey,
            ),
        ],
        bodyJson: <String, dynamic>{
          'content': postChatMessage.content,
          'media_id': postChatMessage.mediaId,
        },
      ),
      jsonParser: (json) => PleromaApiChatMessage.fromJson(json),
    );
  }

  @override
  Future<void> deleteChatMessage({
    required String chatMessageId,
    required String chatId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: deleteChatMessageFeature,
        fieldFeatures: null,
        request: RestRequest.delete(
          relativePath: UrlPathHelper.join(
            [
              v1ChatRelativeUrlPath,
              chatId,
              'messages',
              chatMessageId,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiChatMessage.fromJson(json),
      );

  @override
  IPleromaApiFeature get deleteChatMessageFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  IPleromaApiFeature get getChatFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  IPleromaApiFeature get getChatMessagesFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  IPleromaApiFeature get getChatsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  IPleromaApiFeature get getOrCreateChatByAccountIdFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  IPleromaApiFeature get markChatAsReadFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  IPleromaApiFeature get sendMessageFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );
}
