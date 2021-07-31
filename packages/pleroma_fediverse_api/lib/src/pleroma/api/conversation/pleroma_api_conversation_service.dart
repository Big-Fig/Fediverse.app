import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/conversation/pleroma_api_conversation_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IPleromaApiConversationService extends IPleromaApiAuth {
  Future<List<IPleromaApiStatus>> getConversationStatuses({
    required String conversationRemoteId,
    IPleromaApiPaginationRequest? pagination,
  });

  Future<IPleromaApiConversation> getConversation({
    required String conversationRemoteId,
  });

  Future<IPleromaApiConversation> markConversationAsRead({
    required String conversationRemoteId,
  });

  Future deleteConversation({
    required String conversationRemoteId,
  });

  Future<List<IPleromaApiConversation>> getConversations({
    IPleromaApiPaginationRequest? pagination,
    List<String>? recipientsIds,
  });
}
