import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../mastodon_api_conversation_model.dart';

abstract class IMastodonApiConversationUserAccessService
    extends IMastodonApiService {
  IMastodonApiFeature get markConversationAsReadFeature;

  Future<IMastodonApiConversation> markConversationAsRead({
    required String conversationId,
  });

  IMastodonApiFeature get deleteConversationFeature;

  Future<void> deleteConversation({
    required String conversationId,
  });

  IMastodonApiFeature get getConversationsFeature;

  Future<List<IMastodonApiConversation>> getConversations({
    required IMastodonApiPagination? pagination,
  });
}
