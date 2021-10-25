import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../mastodon_api_conversation_model.dart';
import '../../../mastodon_api_conversation_model_impl.dart';
import 'mastodon_api_conversation_user_access_service.dart';

class MastodonApiConversationUserAccessService extends MastodonApiService
    implements IMastodonApiConversationUserAccessService {
  final conversationRelativeUrlPath = '/api/v1/conversations/';

  MastodonApiConversationUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(restService: restService);

  @override
  Future<List<IMastodonApiConversation>> getConversations({
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getConversationsFeature,
        fieldFeatures: null,
        request: createGetConversationsRequest(pagination: pagination),
        jsonParser: (json) => MastodonApiConversation.fromJson(json),
      );

  RestRequest createGetConversationsRequest({
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            conversationRelativeUrlPath,
          ],
        ),
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );

  @override
  Future<void> deleteConversation({
    required String conversationId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: deleteConversationFeature,
        fieldFeatures: null,
        request: createDeleteConversationRequest(
          conversationId: conversationId,
        ),
      );

  RestRequest createDeleteConversationRequest({
    required String conversationId,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          [
            conversationRelativeUrlPath,
            conversationId,
          ],
        ),
      );

  @override
  Future<IMastodonApiConversation> markConversationAsRead({
    required String conversationId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: markConversationAsReadFeature,
        fieldFeatures: null,
        request: createMarkConversationAsReadFeature(
          conversationId: conversationId,
        ),
        jsonParser: (json) => MastodonApiConversation.fromJson(json),
      );

  RestRequest createMarkConversationAsReadFeature({
    required String conversationId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            conversationRelativeUrlPath,
            conversationId,
            'read',
          ],
        ),
      );

  @override
  IMastodonApiFeature get deleteConversationFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeConversations,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );

  @override
  IMastodonApiFeature get getConversationsFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );

  @override
  IMastodonApiFeature get markConversationAsReadFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeConversations,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );
}
