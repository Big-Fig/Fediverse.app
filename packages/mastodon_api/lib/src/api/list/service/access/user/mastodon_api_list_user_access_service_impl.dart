import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../account/mastodon_api_account_model.dart';
import '../../../../account/mastodon_api_account_model_impl.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../mastodon_api_list_model.dart';
import '../../../mastodon_api_list_model_impl.dart';
import '../../../replies_policy_type/mastodon_api_card_replies_policy_type_sealed.dart';
import 'mastodon_api_list_user_access_service.dart';

class MastodonApiListUserAccessService extends MastodonApiService
    implements IMastodonApiListUserAccessService {
  static const listRelativeUrlPath = '/api/v1/lists';

  MastodonApiListUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(restService: restService);

  @override
  Future<List<IMastodonApiList>> getLists() =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getListsFeature,
        fieldFeatures: null,
        request: createGetListsRequest(),
        jsonParser: (json) => MastodonApiList.fromJson(json),
      );

  RestRequest createGetListsRequest() => RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            listRelativeUrlPath,
          ],
        ),
      );

  @override
  Future<IMastodonApiList> getList({
    required String listId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getListFeature,
        fieldFeatures: null,
        request: createGetListRequest(listId: listId),
        jsonParser: (json) => MastodonApiList.fromJson(json),
      );

  RestRequest createGetListRequest({
    required String listId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            listRelativeUrlPath,
            listId,
          ],
        ),
      );

  @override
  Future<void> deleteList({
    required String listId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: deleteListFeature,
        fieldFeatures: null,
        request: createDeleteListRequest(listId: listId),
      );

  RestRequest createDeleteListRequest({
    required String listId,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          [
            listRelativeUrlPath,
            listId,
          ],
        ),
      );

  @override
  Future<IMastodonApiList> createList({
    required String title,
    required MastodonApiListRepliesPolicyType? repliesPolicy,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: createListFeature,
        fieldFeatures: [
          if (repliesPolicy != null) createListRepliesPolicyFeature,
        ],
        request: createCreateListRequest(
          title: title,
          repliesPolicy: repliesPolicy,
        ),
        jsonParser: (json) => MastodonApiList.fromJson(json),
      );

  RestRequest createCreateListRequest({
    required String title,
    required MastodonApiListRepliesPolicyType? repliesPolicy,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            listRelativeUrlPath,
          ],
        ),
        bodyJson: <String, dynamic>{
          'title': title,
          if (repliesPolicy != null)
            'replies_policy': repliesPolicy.stringValue,
        },
      );

  @override
  Future<IMastodonApiList> updateList({
    required String listId,
    required String title,
    required MastodonApiListRepliesPolicyType? repliesPolicy,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: updateListFeature,
        fieldFeatures: [
          if (repliesPolicy != null) updateListRepliesPolicyFeature,
        ],
        request: createUpdateListRequest(
          listId: listId,
          title: title,
          repliesPolicy: repliesPolicy,
        ),
        jsonParser: (json) => MastodonApiList.fromJson(json),
      );

  RestRequest createUpdateListRequest({
    required String listId,
    required String title,
    required MastodonApiListRepliesPolicyType? repliesPolicy,
  }) =>
      RestRequest.put(
        relativePath: UrlPathHelper.join(
          [
            listRelativeUrlPath,
            listId,
          ],
        ),
        bodyJson: <String, dynamic>{
          'title': title,
          if (repliesPolicy != null)
            'replies_policy': repliesPolicy.stringValue,
        },
      );

  @override
  Future<List<IMastodonApiAccount>> getListAccounts({
    required String listId,
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getListAccountsFeature,
        fieldFeatures: null,
        request: createGetListAccountsRequest(
          listId: listId,
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  RestRequest createGetListAccountsRequest({
    required String listId,
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            listRelativeUrlPath,
            listId,
            'accounts',
          ],
        ),
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );

  @override
  Future<void> addAccountsToList({
    required String listId,
    required List<String> accountIds,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: addAccountsToListFeature,
        fieldFeatures: null,
        request: createAddAccountsToListRequest(
          listId: listId,
          accountIds: accountIds,
        ),
      );

  RestRequest createAddAccountsToListRequest({
    required String listId,
    required List<String> accountIds,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            listRelativeUrlPath,
            listId,
            'accounts',
          ],
        ),
        bodyJson: <String, dynamic>{
          'account_ids': accountIds,
        },
      );

  @override
  Future<void> removeAccountsFromList({
    required String listId,
    required List<String> accountIds,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: removeAccountsFromListFeature,
        fieldFeatures: null,
        request: createRemoveAccountsFromListRequest(
          listId: listId,
          accountIds: accountIds,
        ),
      );

  RestRequest createRemoveAccountsFromListRequest({
    required String listId,
    required List<String> accountIds,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          [
            listRelativeUrlPath,
            listId,
            'accounts',
          ],
        ),
        bodyJson: <String, dynamic>{
          'account_ids': accountIds,
        },
      );

  @override
  IMastodonApiFeature get addAccountsToListFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  IMastodonApiFeature get deleteListFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  IMastodonApiFeature get getListAccountsFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  IMastodonApiFeature get getListFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  IMastodonApiFeature get getListsFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  IMastodonApiFeature get removeAccountsFromListFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  MastodonApiFeature get updateListFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  IMastodonApiFeature get updateListRepliesPolicyFeature =>
      updateListFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_3_0,
      );

  @override
  MastodonApiFeature get createListFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  IMastodonApiFeature get createListRepliesPolicyFeature =>
      updateListFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_3_0,
      );
}
