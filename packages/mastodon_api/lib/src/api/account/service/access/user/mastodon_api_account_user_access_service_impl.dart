import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../access/mastodon_api_access_model.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../list/mastodon_api_list_model.dart';
import '../../../../list/mastodon_api_list_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../identity_proof/mastodon_api_account_identity_proof_model.dart';
import '../../../identity_proof/mastodon_api_account_identity_proof_model_impl.dart';
import '../../../mastodon_api_account_model.dart';
import '../../../mastodon_api_account_model_impl.dart';
import '../../../relationship/mastodon_api_account_relationship_model.dart';
import '../../../relationship/mastodon_api_account_relationship_model_impl.dart';
import '../application/mastodon_api_account_application_access_service_impl.dart';
import 'mastodon_api_account_user_access_service.dart';

class MastodonApiAccountUserAccessService
    extends MastodonApiAccountApplicationAccessService
    implements IMastodonApiAccountUserAccessService {
  final String accountReportRelativeUrlPath = '/api/v1/reports';

  MastodonApiAccountUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(restService: restService);

  @override
  MastodonApiFeature get blockAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeBlocksOrFollow,
      );

  @override
  MastodonApiFeature get blockDomainFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeBlocksOrFollow,
      );

  @override
  MastodonApiFeature get followAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFollowsOrFollow,
      );

  @override
  MastodonApiFeature get followAccountNotifyFeature =>
      followAccountFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_0_0,
      );

  @override
  MastodonApiFeature get getAccountIdentifyProofsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_8_0,
      );

  @override
  MastodonApiFeature get getListsWithAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement: MastodonApiAccessScopesRequirement.readLists,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_1_0,
      );

  @override
  MastodonApiFeature get getRelationshipWithAccountsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readFollowsOrFollow,
      );

  @override
  MastodonApiFeature get muteAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeMutesOrFollow,
      );

  @override
  MastodonApiFeature get noteFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_2_0,
      );

  @override
  MastodonApiFeature get pinAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_5_0,
      );

  @override
  MastodonApiFeature get reportAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeReports,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast1_1_0,
      );

  @override
  MastodonApiFeature get reportAccountForwardFeature =>
      reportAccountFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_3_0,
      );

  @override
  MastodonApiFeature get searchFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readAccounts,
      );

  @override
  MastodonApiFeature get unBlockAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeBlocksOrFollow,
      );

  @override
  MastodonApiFeature get unBlockDomainFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeBlocksOrFollow,
      );

  @override
  MastodonApiFeature get unFollowAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFollowsOrFollow,
      );

  @override
  MastodonApiFeature get unMuteAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeMutesOrFollow,
      );

  @override
  MastodonApiFeature get unPinAccountFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_5_0,
      );

  @override
  MastodonApiFeature get getAccountFollowersFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readAccounts,
      );

  @override
  MastodonApiFeature get getAccountFollowingsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readAccounts,
      );

  @override
  Future<List<IMastodonApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> accountIds,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getRelationshipWithAccountsFeature,
        fieldFeatures: createGetRelationshipWithAccountsFieldFeatures(),
        request: createGetRelationshipWithAccountsRequest(
          accountIds: accountIds,
        ),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetRelationshipWithAccountsFieldFeatures() =>
      null;

  RestRequest createGetRelationshipWithAccountsRequest({
    required List<String> accountIds,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            'relationships',
          ],
        ),
        queryArgs: accountIds
            .map(
              (id) => UrlQueryArg(key: 'id[]', value: id),
            )
            .toList(),
      );

  @override
  Future<IMastodonApiAccountRelationship> blockAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: blockAccountFeature,
        fieldFeatures: createBlockAccountFieldFeatures(),
        request: createBlockAccountRequest(accountId: accountId),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createBlockAccountFieldFeatures() => null;

  RestRequest createBlockAccountRequest({
    required String accountId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'block',
          ],
        ),
      );

  @override
  Future<IMastodonApiAccountRelationship> followAccount({
    required String accountId,
    required bool? notify,
    required bool? reblogs,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: followAccountFeature,
        fieldFeatures: createFollowAccountFieldFeatures(
          notify: notify,
        ),
        request: createFollowAccountRequest(
          accountId: accountId,
          notify: notify,
          reblogs: reblogs,
        ),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature<IMastodonApiAccess>>
      createFollowAccountFieldFeatures({
    bool? notify,
  }) =>
          [
            if (notify != null) followAccountNotifyFeature,
          ];

  RestRequest createFollowAccountRequest({
    required String accountId,
    required bool? notify,
    required bool? reblogs,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'follow',
          ],
        ),
        bodyJson: <String, dynamic>{
          if (notify != null) 'notify': notify,
          if (reblogs != null) 'reblogs': reblogs,
        },
      );

  @override
  Future<IMastodonApiAccountRelationship> muteAccount({
    required String accountId,
    required bool? notifications,
    required Duration? expireIn,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: muteAccountFeature,
        fieldFeatures: createMuteAccountFieldFeatures(),
        request: createMuteAccountRequest(
          accountId: accountId,
          notifications: notifications,
          expireIn: expireIn,
        ),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createMuteAccountFieldFeatures() => null;

  RestRequest createMuteAccountRequest({
    required String accountId,
    required bool? notifications,
    required Duration? expireIn,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'mute',
          ],
        ),
        bodyJson: <String, dynamic>{
          if (notifications != null) 'notifications': notifications,
          if (expireIn != null)
            'duration':
                expireIn.inMilliseconds ~/ Duration.millisecondsPerSecond,
        },
      );

  @override
  Future<IMastodonApiAccountRelationship> pinAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: pinAccountFeature,
        fieldFeatures: createPinAccountFieldFeatures(),
        request: createPinAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createPinAccountFieldFeatures() => null;

  RestRequest createPinAccountRequest({
    required String accountId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'pin',
          ],
        ),
      );

  @override
  Future<IMastodonApiAccountRelationship> unBlockAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unBlockAccountFeature,
        fieldFeatures: createUnBlockAccountFieldFeatures(),
        request: createUnBlockAccountRequest(accountId: accountId),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createUnBlockAccountFieldFeatures() => null;

  RestRequest createUnBlockAccountRequest({
    required String accountId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'unblock',
          ],
        ),
      );

  @override
  Future<IMastodonApiAccountRelationship> unFollowAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unFollowAccountFeature,
        fieldFeatures: createUnFollowAccountFieldFeatures(),
        request: createUnFollowAccountRequest(accountId: accountId),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createUnFollowAccountFieldFeatures() => null;

  RestRequest createUnFollowAccountRequest({
    required String accountId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'unfollow',
          ],
        ),
      );

  @override
  Future<IMastodonApiAccountRelationship> unMuteAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unMuteAccountFeature,
        fieldFeatures: createUnMuteAccountFieldFeatures(),
        request: createUnMuteAccountRequest(accountId: accountId),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createUnMuteAccountFieldFeatures() => null;

  RestRequest createUnMuteAccountRequest({
    required String accountId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'unmute',
          ],
        ),
      );

  @override
  Future<IMastodonApiAccountRelationship> unPinAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unPinAccountFeature,
        fieldFeatures: createUnPinAccountFieldFeatures(),
        request: createUnPinAccountRequest(accountId: accountId),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createUnPinAccountFieldFeatures() => null;

  RestRequest createUnPinAccountRequest({
    required String accountId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'unpin',
          ],
        ),
      );

  @override
  Future<List<IMastodonApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountIdentifyProofsFeature,
        fieldFeatures: creatGetAccountIdentifyProofsFieldFeatures(),
        request: createGetAccountIdentifyProofsRequest(accountId: accountId),
        jsonParser: (json) => MastodonApiAccountIdentityProof.fromJson(json),
      );

  List<IMastodonApiFeature>? creatGetAccountIdentifyProofsFieldFeatures() =>
      null;

  RestRequest createGetAccountIdentifyProofsRequest({
    required String accountId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'identity_proofs',
          ],
        ),
      );

  @override
  Future<List<IMastodonApiList>> getListsWithAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getListsWithAccountFeature,
        fieldFeatures: createGetListsWithAccountFieldFeatures(),
        request: createGetListsWithAccountRequest(accountId: accountId),
        jsonParser: (json) => MastodonApiList.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetListsWithAccountFieldFeatures() => null;

  RestRequest createGetListsWithAccountRequest({
    required String accountId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            accountId,
            'lists',
          ],
        ),
      );

  @override
  Future<List<IMastodonApiAccount>> search({
    required String query,
    required bool? resolve,
    required bool? following,
    required int? limit,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: searchFeature,
        fieldFeatures: createSearchFieldFeatures(),
        request: createSearchRequest(
          query: query,
          resolve: resolve,
          following: following,
          limit: limit,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createSearchFieldFeatures() => null;

  RestRequest createSearchRequest({
    required String query,
    required bool? resolve,
    required bool? following,
    required int? limit,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            accountRelativeUrlPath,
            'search',
          ],
        ),
        queryArgs: [
          UrlQueryArg(
            key: 'q',
            value: query,
          ),
          if (resolve != null)
            UrlQueryArg(
              key: 'resolve',
              value: resolve.toString(),
            ),
          if (limit != null)
            UrlQueryArg(
              key: 'limit',
              value: limit.toString(),
            ),
          if (following != null)
            UrlQueryArg(
              key: 'following',
              value: following.toString(),
            ),
        ],
      );

  @override
  Future<void> reportAccount({
    required String accountId,
    required List<String>? statusIds,
    required String? comment,
    required bool? forward,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: reportAccountFeature,
        fieldFeatures: createReportAccountFieldFeatures(forward: forward),
        request: createReportAccountRequest(
          accountId: accountId,
          statusIds: statusIds,
          comment: comment,
          forward: forward,
        ),
      );

  List<IMastodonApiFeature<IMastodonApiAccess>>
      createReportAccountFieldFeatures({
    bool? forward,
  }) =>
          [
            if (forward != null) reportAccountForwardFeature,
          ];

  RestRequest createReportAccountRequest({
    required String accountId,
    required List<String>? statusIds,
    required String? comment,
    required bool? forward,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            accountReportRelativeUrlPath,
          ],
        ),
        bodyJson: <String, dynamic>{
          'account_id': accountId,
          if (statusIds?.isNotEmpty == true) 'status_ids': statusIds,
          if (comment?.isNotEmpty == true) 'comment': comment,
          if (forward != null) 'forward': forward,
        },
      );

  @override
  Future<void> blockDomain({
    required String domain,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: blockDomainFeature,
        fieldFeatures: createBlockDomainFieldFeatures(),
        request: createBlockDomainRequest(domain: domain),
      );

  List<IMastodonApiFeature>? createBlockDomainFieldFeatures() => null;

  RestRequest createBlockDomainRequest({
    required String domain,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            'api/v1/domain_blocks',
          ],
        ),
        queryArgs: [
          UrlQueryArg(
            key: 'domain',
            value: domain,
          ),
        ],
      );

  @override
  Future<void> unBlockDomain({
    required String domain,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: unBlockDomainFeature,
        fieldFeatures: createUnBlockDomainFieldFeatures(),
        request: createUnBlockDomainRequest(domain: domain),
      );

  List<IMastodonApiFeature>? createUnBlockDomainFieldFeatures() => null;

  RestRequest createUnBlockDomainRequest({
    required String domain,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          ['api/v1/domain_blocks'],
        ),
        queryArgs: [
          UrlQueryArg(
            key: 'domain',
            value: domain,
          ),
        ],
      );

  @override
  Future<List<IMastodonApiAccount>> getAccountFollowings({
    required String accountId,
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountFollowingsFeature,
        fieldFeatures: createGetAccountFollowingsFieldFeatures(),
        request: createGetAccountFollowingsRequest(
          accountId: accountId,
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetAccountFollowingsFieldFeatures() => null;

  RestRequest createGetAccountFollowingsRequest({
    required String accountId,
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join([
          accountRelativeUrlPath,
          accountId,
          'following',
        ]),
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );

  @override
  Future<List<MastodonApiAccount>> getAccountFollowers({
    required String accountId,
    required IMastodonApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountFollowersFeature,
        fieldFeatures: createGetAccountFollowersFieldFeatures(),
        request: createGetAccountFollowersRequest(
          accountId: accountId,
          pagination: pagination,
        ),
        jsonParser: (json) => MastodonApiAccount.fromJson(json),
      );

  List<IMastodonApiFeature>? createGetAccountFollowersFieldFeatures() => null;

  RestRequest createGetAccountFollowersRequest({
    required String accountId,
    required IMastodonApiPagination? pagination,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join([
          accountRelativeUrlPath,
          accountId,
          'followers',
        ]),
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
        ],
      );

  @override
  Future<IMastodonApiAccountRelationship> note({
    required String accountId,
    required String comment,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: noteFeature,
        fieldFeatures: createNoteFieldFeatures(),
        request: createNoteRequest(
          accountId: accountId,
          comment: comment,
        ),
        jsonParser: (json) => MastodonApiAccountRelationship.fromJson(json),
      );

  List<IMastodonApiFeature>? createNoteFieldFeatures() => null;

  RestRequest createNoteRequest({
    required String accountId,
    required String comment,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join([
          accountRelativeUrlPath,
          accountId,
          'note',
        ]),
        bodyJson: <String, dynamic>{
          'comment': comment,
        },
      );
}
