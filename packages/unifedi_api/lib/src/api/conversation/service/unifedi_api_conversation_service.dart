import '../../feature/unifedi_api_feature_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../status/unifedi_api_status_model.dart';
import '../../unifedi_api_service.dart';
import '../unifedi_api_conversation_model.dart';

abstract class IUnifediApiConversationService extends IUnifediApiService {
  IUnifediApiFeature get getConversationStatusesFeature;

  Future<List<IUnifediApiStatus>> getConversationStatuses({
    required String conversationId,
    required IUnifediApiPagination? pagination,
  });

  IUnifediApiFeature get getConversationFeature;

  Future<IUnifediApiConversation> getConversation({
    required String conversationId,
  });

  IUnifediApiFeature get markConversationAsReadFeature;

  Future<IUnifediApiConversation> markConversationAsRead({
    required String conversationId,
  });

  IUnifediApiFeature get deleteConversationFeature;

  Future<void> deleteConversation({
    required String conversationId,
  });

  IUnifediApiFeature get getConversationsFeature;

  IUnifediApiFeature get getConversationsRecipientsIdsFeature;

  Future<List<IUnifediApiConversation>> getConversations({
    required IUnifediApiPagination? pagination,
    required List<String>? recipientsIds,
  });
}
