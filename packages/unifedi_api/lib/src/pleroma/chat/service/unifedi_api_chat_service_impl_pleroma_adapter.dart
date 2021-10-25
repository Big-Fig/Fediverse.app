import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/chat/message/post/unifedi_api_post_chat_message_model.dart';
import '../../../api/chat/message/unifedi_api_chat_message_model.dart';
import '../../../api/chat/service/unifedi_api_chat_service.dart';
import '../../../api/chat/unifedi_api_chat_model.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../message/unifedi_api_chat_message_model_pleroma_adapter.dart';
import '../unifedi_api_chat_model_pleroma_adapter.dart';

class UnifediApiChatServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter implements IUnifediApiChatService {
  final IPleromaApiChatUserAccessService pleromaApiChatUserAccessService;

  UnifediApiChatServicePleromaAdapter({
    required this.pleromaApiChatUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiChatUserAccessService.restService,
      );

  @override
  Future<void> deleteChatMessage({
    required String chatMessageId,
    required String chatId,
  }) =>
      pleromaApiChatUserAccessService.deleteChatMessage(
        chatMessageId: chatMessageId,
        chatId: chatId,
      );

  @override
  IUnifediApiFeature get deleteChatMessageFeature =>
      pleromaApiChatUserAccessService.deleteChatMessageFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiChat> getChat({
    required String id,
  }) =>
      pleromaApiChatUserAccessService
          .getChat(
            id: id,
          )
          .then(
            (value) => value.toUnifediApiChatPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getChatFeature =>
      pleromaApiChatUserAccessService.getChatFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiChatMessage>> getChatMessages({
    required String chatId,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiChatUserAccessService
          .getChatMessages(
            chatId: chatId,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiChatMessagePleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getChatMessagesFeature =>
      pleromaApiChatUserAccessService.getChatMessagesFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiChat>> getChats({
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiChatUserAccessService
          .getChats(
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiChatPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getChatsFeature =>
      pleromaApiChatUserAccessService.getChatsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiChat> getOrCreateChatByAccountId({
    required String accountId,
  }) =>
      pleromaApiChatUserAccessService
          .getOrCreateChatByAccountId(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiChatPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getOrCreateChatByAccountIdFeature =>
      pleromaApiChatUserAccessService.getOrCreateChatByAccountIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiChat> markChatAsRead({
    required String chatId,
    required String lastReadChatMessageId,
  }) =>
      pleromaApiChatUserAccessService
          .markChatAsRead(
            chatId: chatId,
            lastReadChatMessageId: lastReadChatMessageId,
          )
          .then(
            (value) => value.toUnifediApiChatPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get markChatAsReadFeature =>
      pleromaApiChatUserAccessService.markChatAsReadFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiChatMessage> sendMessage({
    required String? idempotencyKey,
    required String chatId,
    required IUnifediApiPostChatMessage postChatMessage,
  }) =>
      pleromaApiChatUserAccessService
          .sendMessage(
            idempotencyKey: idempotencyKey,
            chatId: chatId,
            postChatMessage: PleromaApiPostChatMessage(
              content: postChatMessage.content,
              mediaId: postChatMessage.mediaId,
            ),
          )
          .then(
            (value) => value.toUnifediApiChatMessagePleromaAdapter(),
          );

  @override
  IUnifediApiFeature get sendMessageFeature =>
      pleromaApiChatUserAccessService.sendMessageFeature
          .toUnifediApiFeaturePleromaAdapter();
}
