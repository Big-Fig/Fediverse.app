import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiConversationService extends IPleromaApiAuth {
  static IPleromaApiConversationService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiConversationService>(
        context,
        listen: listen,
      );

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
