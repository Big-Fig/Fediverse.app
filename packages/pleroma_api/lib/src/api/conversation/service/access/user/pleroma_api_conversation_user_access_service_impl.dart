import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../requirement/access/level/pleroma_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/pleroma_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/pleroma_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../../status/pleroma_api_status_model.dart';
import '../../../../status/pleroma_api_status_model_impl.dart';
import '../../../pleroma_api_conversation_model.dart';
import '../../../pleroma_api_conversation_model_impl.dart';
import 'pleroma_api_conversation_user_access_service.dart';

class PleromaApiConversationUserAccessService extends PleromaApiService
    implements IPleromaApiConversationUserAccessService {
  static const pleromaConversationRelativeUrlPath =
      '/api/v1/pleroma/conversations/';
  static const conversationStatusesRelativeUrlPath = 'statuses';

  final MastodonApiConversationUserAccessService
      mastodonApiConversationUserAccessService;

  PleromaApiConversationUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiConversationUserAccessService =
            MastodonApiConversationUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(restService: restService) {
    mastodonApiConversationUserAccessService.disposeWith(this);
  }

  @override
  Future<List<IPleromaApiStatus>> getConversationStatuses({
    required String conversationId,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getConversationStatusesFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              pleromaConversationRelativeUrlPath,
              conversationId,
              conversationStatusesRelativeUrlPath,
            ],
          ),
          queryArgs: [
            if (pagination != null) ...pagination.toQueryArgs(),
          ],
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<IPleromaApiConversation> getConversation({
    required String conversationId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getConversationFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              pleromaConversationRelativeUrlPath,
              conversationId,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiConversation.fromJson(json),
      );

  @override
  Future<List<IPleromaApiConversation>> getConversations({
    required IPleromaApiPagination? pagination,
    required List<String>? recipientsIds,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getConversationsFeature,
        fieldFeatures: null,
        request: mastodonApiConversationUserAccessService
            .createGetConversationsRequest(
          pagination: pagination,
        )
            .copyAndAppend(
          queryArgs: [
            if (recipientsIds != null && recipientsIds.isNotEmpty)
              ...recipientsIds.map(
                (id) => UrlQueryArg(
                  key: 'recipients[]',
                  value: id,
                ),
              ),
          ],
        ),
        jsonParser: (json) => PleromaApiConversation.fromJson(json),
      );

  @override
  Future<void> deleteConversation({
    required String conversationId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: deleteConversationFeature,
        fieldFeatures: null,
        request: mastodonApiConversationUserAccessService
            .createDeleteConversationRequest(
          conversationId: conversationId,
        ),
      );

  @override
  Future<IPleromaApiConversation> markConversationAsRead({
    required String conversationId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: markConversationAsReadFeature,
        fieldFeatures: null,
        request: mastodonApiConversationUserAccessService
            .createMarkConversationAsReadFeature(
          conversationId: conversationId,
        ),
        jsonParser: (json) => PleromaApiConversation.fromJson(json),
      );

  @override
  IPleromaApiFeature get deleteConversationFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiConversationUserAccessService.deleteConversationFeature,
      );

  @override
  IPleromaApiFeature get getConversationFeature => PleromaApiFeature(
        mastodonApiFeature: null,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            PleromaApiAccessScopesRequirement.readConversations,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IPleromaApiFeature get getConversationStatusesFeature => PleromaApiFeature(
        mastodonApiFeature: null,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: PleromaApiAccessScopesRequirement.readStatuses,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IPleromaApiFeature get getConversationsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiConversationUserAccessService.getConversationsFeature,
      );

  @override
  IPleromaApiFeature get markConversationAsReadFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiConversationUserAccessService.markConversationAsReadFeature,
      );
}
