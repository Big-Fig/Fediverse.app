import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../list/pleroma_api_list_model.dart';
import '../../../../list/pleroma_api_list_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../identity_proof/pleroma_api_account_identity_proof_model.dart';
import '../../../identity_proof/pleroma_api_account_identity_proof_model_impl.dart';
import '../../../pleroma_api_account_model.dart';
import '../../../pleroma_api_account_model_impl.dart';
import '../../../relationship/pleroma_api_account_relationship_model.dart';
import '../../../relationship/pleroma_api_account_relationship_model_impl.dart';
import '../application/pleroma_api_account_application_access_service_impl.dart';
import '../public/pleroma_api_account_public_access_service_impl.dart';
import 'pleroma_api_account_user_access_service.dart';

class PleromaApiAccountUserAccessService
    extends PleromaApiAccountApplicationAccessService
    implements IPleromaApiAccountUserAccessService {
  final MastodonApiAccountUserAccessService mastodonApiAccountUserAccessService;

  PleromaApiAccountUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiAccountUserAccessService =
            MastodonApiAccountUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(restService: restService) {
    mastodonApiAccountUserAccessService.disposeWith(this);
  }

  @override
  Future<IPleromaApiAccountRelationship> blockAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: blockAccountFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createBlockAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get blockAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.blockAccountFeature,
      );

  @override
  Future<void> blockDomain({
    required String domain,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: blockDomainFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createBlockDomainRequest(
          domain: domain,
        ),
      );

  @override
  IPleromaApiFeature get blockDomainFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.blockDomainFeature,
      );

  @override
  Future<IPleromaApiAccountRelationship> followAccount({
    required String accountId,
    required bool? notify,
    required bool? reblogs,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: followAccountFeature,
        fieldFeatures: [
          if (notify != null) followAccountNotifyFeature,
        ],
        request: mastodonApiAccountUserAccessService.createFollowAccountRequest(
          accountId: accountId,
          notify: notify,
          reblogs: reblogs,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get followAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.followAccountFeature,
      );

  @override
  IPleromaApiFeature get followAccountNotifyFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.followAccountNotifyFeature,
      );

  @override
  Future<List<IPleromaApiAccount>> getAccountFollowers({
    required String accountId,
    required bool? withRelationship,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountFollowersFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService
            .createGetAccountFollowersRequest(
          accountId: accountId,
          pagination: pagination,
        )
            .copyAndAppend(
          queryArgs: [
            if (withRelationship != null)
              UrlQueryArg(
                key: PleromaApiAccountPublicAccessService
                    .withRelationshipRequestBodyKey,
                value: withRelationship.toString(),
              ),
          ],
        ),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get getAccountFollowersFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.getAccountFollowersFeature,
      );

  @override
  Future<List<IPleromaApiAccount>> getAccountFollowings({
    required String accountId,
    required bool? withRelationship,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountFollowingsFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService
            .createGetAccountFollowingsRequest(
          accountId: accountId,
          pagination: pagination,
        )
            .copyAndAppend(
          queryArgs: [
            if (withRelationship != null)
              UrlQueryArg(
                key: PleromaApiAccountPublicAccessService
                    .withRelationshipRequestBodyKey,
                value: withRelationship.toString(),
              ),
          ],
        ),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get getAccountFollowingsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.getAccountFollowingsFeature,
      );

  @override
  Future<List<IPleromaApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAccountIdentifyProofsFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService
            .createGetAccountIdentifyProofsRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => PleromaApiAccountIdentityProof.fromJson(json),
      );

  @override
  IPleromaApiFeature get getAccountIdentifyProofsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.getAccountIdentifyProofsFeature,
      );

  @override
  Future<List<IPleromaApiList>> getListsWithAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getListsWithAccountFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService
            .createGetListsWithAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => PleromaApiList.fromJson(json),
      );

  @override
  IPleromaApiFeature get getListsWithAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.getListsWithAccountFeature,
      );

  @override
  Future<List<IPleromaApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> accountIds,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getRelationshipWithAccountsFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService
            .createGetRelationshipWithAccountsRequest(
          accountIds: accountIds,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get getRelationshipWithAccountsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.getRelationshipWithAccountsFeature,
      );

  @override
  Future<IPleromaApiAccountRelationship> muteAccount({
    required String accountId,
    required bool? notifications,
    required Duration? expireIn,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: muteAccountFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createMuteAccountRequest(
          accountId: accountId,
          notifications: notifications,
          expireIn: expireIn,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get muteAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.muteAccountFeature,
      );

  @override
  IPleromaApiFeature get noteFeature => PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.noteFeature,
      );

  @override
  Future<IPleromaApiAccountRelationship> pinAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: pinAccountFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createPinAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get pinAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.pinAccountFeature,
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
        fieldFeatures: [
          if (forward != null) reportAccountForwardFeature,
        ],
        request: mastodonApiAccountUserAccessService.createReportAccountRequest(
          accountId: accountId,
          statusIds: statusIds,
          comment: comment,
          forward: forward,
        ),
      );

  @override
  IPleromaApiFeature get reportAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.reportAccountFeature,
      );

  @override
  IPleromaApiFeature get reportAccountForwardFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.reportAccountForwardFeature,
      );

  @override
  Future<List<IPleromaApiAccount>> search({
    required String query,
    required bool? resolve,
    required bool? following,
    required int? limit,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: searchFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createSearchRequest(
          query: query,
          resolve: resolve,
          following: following,
          limit: limit,
        ),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get searchFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.searchFeature,
      );

  @override
  IPleromaApiFeature get subscribeAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  IPleromaApiFeature get unSubscribeAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        null,
      );

  @override
  Future<IPleromaApiAccountRelationship> subscribeAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: subscribeAccountFeature,
        fieldFeatures: null,
        request: RestRequest.post(
          relativePath: UrlPathHelper.join(
            [
              PleromaApiAccountPublicAccessService
                  .pleromaAccountRelativeUrlPath,
              accountId,
              'subscribe',
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  Future<IPleromaApiAccountRelationship> unSubscribeAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unSubscribeAccountFeature,
        fieldFeatures: null,
        request: RestRequest.post(
          relativePath: UrlPathHelper.join(
            [
              PleromaApiAccountPublicAccessService
                  .pleromaAccountRelativeUrlPath,
              accountId,
              'unsubscribe',
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  Future<IPleromaApiAccountRelationship> unBlockAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unBlockAccountFeature,
        fieldFeatures: null,
        request:
            mastodonApiAccountUserAccessService.createUnBlockAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get unBlockAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.unBlockAccountFeature,
      );

  @override
  Future<void> unBlockDomain({
    required String domain,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: unBlockDomainFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createUnBlockDomainRequest(
          domain: domain,
        ),
      );

  @override
  IPleromaApiFeature get unBlockDomainFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.unBlockDomainFeature,
      );

  @override
  Future<IPleromaApiAccountRelationship> unFollowAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unFollowAccountFeature,
        fieldFeatures: null,
        request:
            mastodonApiAccountUserAccessService.createUnFollowAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get unFollowAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.unFollowAccountFeature,
      );

  @override
  Future<IPleromaApiAccountRelationship> unMuteAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unMuteAccountFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createUnMuteAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get unMuteAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.unMuteAccountFeature,
      );

  @override
  Future<IPleromaApiAccountRelationship> unPinAccount({
    required String accountId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: unPinAccountFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createUnPinAccountRequest(
          accountId: accountId,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  IPleromaApiFeature get unPinAccountFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiAccountUserAccessService.unPinAccountFeature,
      );

  @override
  Future<IPleromaApiAccountRelationship> note({
    required String accountId,
    required String comment,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: noteFeature,
        fieldFeatures: null,
        request: mastodonApiAccountUserAccessService.createNoteRequest(
          accountId: accountId,
          comment: comment,
        ),
        jsonParser: (json) => PleromaApiAccountRelationship.fromJson(json),
      );

  @override
  List<PleromaApiVisibility> calculatePossibleExcludeVisibilitiesValues() =>
      PleromaApiVisibility.calculatePossibleExcludeVisibilitiesValues();
}
