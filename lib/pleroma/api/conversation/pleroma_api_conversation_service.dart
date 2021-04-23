import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaConversationService extends IPleromaApi {
  static IPleromaConversationService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaConversationService>(
        context,
        listen: listen,
      );

  Future<List<IPleromaStatus>> getConversationStatuses({
    required String conversationRemoteId,
    IPleromaPaginationRequest? pagination,
  });

  Future<IPleromaConversation> getConversation({
    required String conversationRemoteId,
  });

  Future<IPleromaConversation> markConversationAsRead({
    required String conversationRemoteId,
  });

  Future<bool> deleteConversation({
    required String conversationRemoteId,
  });

  Future<List<IPleromaConversation>> getConversations({
    IPleromaPaginationRequest? pagination,
    List<String>? recipientsIds,
  });
}
