import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../../status/pleroma_api_status_model.dart';
import '../../../pleroma_api_conversation_model.dart';

abstract class IPleromaApiConversationUserAccessService
    extends IPleromaApiService {
  IPleromaApiFeature get getConversationStatusesFeature;

  Future<List<IPleromaApiStatus>> getConversationStatuses({
    required String conversationId,
    required IPleromaApiPagination? pagination,
  });

  IPleromaApiFeature get getConversationFeature;

  Future<IPleromaApiConversation> getConversation({
    required String conversationId,
  });

  IPleromaApiFeature get markConversationAsReadFeature;

  Future<IPleromaApiConversation> markConversationAsRead({
    required String conversationId,
  });

  IPleromaApiFeature get deleteConversationFeature;

  Future<void> deleteConversation({
    required String conversationId,
  });

  IPleromaApiFeature get getConversationsFeature;

  Future<List<IPleromaApiConversation>> getConversations({
    required IPleromaApiPagination? pagination,
    required List<String>? recipientsIds,
  });
}
