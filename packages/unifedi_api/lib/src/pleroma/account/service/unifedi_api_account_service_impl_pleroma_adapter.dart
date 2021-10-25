import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/account/identity_proof/unifedi_api_account_identity_proof_model.dart';
import '../../../api/account/register/response/unifedi_api_register_account_response_model.dart';
import '../../../api/account/register/unifedi_api_register_account_model.dart';
import '../../../api/account/relationship/unifedi_api_account_relationship_model.dart';
import '../../../api/account/service/unifedi_api_account_service.dart';
import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/list/unifedi_api_list_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../list/unifedi_api_list_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';
import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../../status/unifedi_api_status_model_pleroma_adapter.dart';
import '../../visibility/unifedi_api_visibility_sealed_pleroma_converter.dart';
import '../identity_proof/unifedi_api_account_identity_proof_model_pleroma_adapter.dart';
import '../register/response/unifedi_api_register_account_response_model_pleroma_adapter.dart';
import '../relationship/unifedi_api_account_relationship_model_pleroma_adapter.dart';
import '../unifedi_api_account_model_pleroma_adapter.dart';

class UnifediApiAccountServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiAccountService {
  final IPleromaApiAccountUserAccessService pleromaApiAccountUserAccessService;

  UnifediApiAccountServicePleromaAdapter({
    required this.pleromaApiAccountUserAccessService,
  });

  @override
  Future<IUnifediApiAccountRelationship> blockAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .blockAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get blockAccountFeature =>
      pleromaApiAccountUserAccessService.blockAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> blockDomain({
    required String domain,
  }) =>
      pleromaApiAccountUserAccessService.blockDomain(domain: domain);

  @override
  IUnifediApiFeature get blockDomainFeature =>
      pleromaApiAccountUserAccessService.blockDomainFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> followAccount({
    required String accountId,
    required bool? notify,
    required bool? reblogs,
  }) =>
      pleromaApiAccountUserAccessService
          .followAccount(
            accountId: accountId,
            notify: notify,
            reblogs: reblogs,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get followAccountFeature =>
      pleromaApiAccountUserAccessService.followAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get followAccountNotifyFeature =>
      pleromaApiAccountUserAccessService.followAccountNotifyFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccount> getAccount({
    required String accountId,
    required bool? withRelationship,
  }) =>
      pleromaApiAccountUserAccessService
          .getAccount(
            accountId: accountId,
            withRelationship: withRelationship,
          )
          .then(
            (value) => value.toUnifediApiAccountPleromaAdapter(),
          );

  @override
  Future<List<IUnifediApiStatus>> getAccountFavouritedStatuses({
    required String accountId,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiAccountUserAccessService
          .getAccountFavouritedStatuses(
            accountId: accountId,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiStatusPleromaAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getAccountFavouritedStatusesFeature =>
      pleromaApiAccountUserAccessService.getAccountFavouritedStatusesFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getAccountFeature =>
      pleromaApiAccountUserAccessService.getAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> getAccountFollowers({
    required String accountId,
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiAccountUserAccessService
          .getAccountFollowers(
            accountId: accountId,
            withRelationship: withRelationship,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiAccountPleromaAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getAccountFollowersFeature =>
      pleromaApiAccountUserAccessService.getAccountFollowersFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccount>> getAccountFollowings({
    required String accountId,
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiAccountUserAccessService
          .getAccountFollowings(
            accountId: accountId,
            withRelationship: withRelationship,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiAccountPleromaAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getAccountFollowingsFeature =>
      pleromaApiAccountUserAccessService.getAccountFollowingsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .getAccountIdentifyProofs(
            accountId: accountId,
          )
          .then(
            (list) => list
                .map(
                  (value) =>
                      value.toUnifediApiAccountIdentityProofPleromaAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getAccountIdentifyProofsFeature =>
      pleromaApiAccountUserAccessService.getAccountIdentifyProofsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  // ignore: long-parameter-list
  Future<List<IUnifediApiStatus>> getAccountStatuses({
    required String accountId,
    required String? tagged,
    required bool? pinned,
    required bool? excludeReplies,
    required bool? excludeReblogs,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required bool? withMuted,
    required bool? onlyWithMedia,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiAccountUserAccessService
          .getAccountStatuses(
            accountId: accountId,
            tagged: tagged,
            pinned: pinned,
            excludeReplies: excludeReplies,
            excludeReblogs: excludeReblogs,
            excludeVisibilities:
                excludeVisibilities?.toPleromaApiVisibilityList(),
            withMuted: withMuted,
            onlyWithMedia: onlyWithMedia,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiStatusPleromaAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getAccountStatusesExcludeReblogsFeature =>
      pleromaApiAccountUserAccessService.getAccountStatusesExcludeReblogsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getAccountStatusesFeature =>
      pleromaApiAccountUserAccessService.getAccountStatusesFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getAccountStatusesPaginationMinIdFeature =>
      pleromaApiAccountUserAccessService
          .getAccountStatusesPaginationMinIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getAccountStatusesTaggedFeature =>
      pleromaApiAccountUserAccessService.getAccountStatusesTaggedFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiList>> getListsWithAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .getListsWithAccount(
            accountId: accountId,
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiListPleromaAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getListsWithAccountFeature =>
      pleromaApiAccountUserAccessService.getListsWithAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> accountIds,
  }) =>
      pleromaApiAccountUserAccessService
          .getRelationshipWithAccounts(
            accountIds: accountIds,
          )
          .then(
            (list) => list
                .map(
                  (value) =>
                      value.toUnifediApiAccountRelationshipPleromaAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getRelationshipWithAccountsFeature =>
      pleromaApiAccountUserAccessService.getRelationshipWithAccountsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> muteAccount({
    required String accountId,
    required bool? notifications,
    required Duration? expireIn,
  }) =>
      pleromaApiAccountUserAccessService
          .muteAccount(
            accountId: accountId,
            notifications: notifications,
            expireIn: expireIn,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get muteAccountFeature =>
      pleromaApiAccountUserAccessService.muteAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> note({
    required String accountId,
    required String comment,
  }) =>
      pleromaApiAccountUserAccessService
          .note(
            accountId: accountId,
            comment: comment,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get noteFeature =>
      pleromaApiAccountUserAccessService.noteFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> pinAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .pinAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get pinAccountFeature =>
      pleromaApiAccountUserAccessService.pinAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  // ignore: long-parameter-list
  Future<IUnifediApiRegisterAccountResponse> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  }) =>
      pleromaApiAccountUserAccessService
          .registerAccount(
            registerAccount: PleromaApiRegisterAccount(
              username: registerAccount.username,
              email: registerAccount.email,
              password: registerAccount.password,
              agreement: registerAccount.agreement,
              locale: registerAccount.locale,
              reason: registerAccount.reason,
              captchaToken: registerAccount.captchaToken,
              captchaAnswerData: registerAccount.captchaAnswerData,
              captchaSolution: registerAccount.captchaSolution,
              fullName: registerAccount.fullName,
              bio: registerAccount.bio,
              inviteToken: registerAccount.inviteToken,
            ),
          )
          .then(
            (value) =>
                value.toUnifediApiRegisterAccountResponsePleromaAdapter(),
          );

  @override
  IUnifediApiFeature get registerAccountFeature =>
      pleromaApiAccountUserAccessService.registerAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get registerAccountReasonFeature =>
      pleromaApiAccountUserAccessService.registerAccountReasonFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> reportAccount({
    required String accountId,
    required List<String>? statusIds,
    required String? comment,
    required bool? forward,
  }) =>
      pleromaApiAccountUserAccessService.reportAccount(
        accountId: accountId,
        statusIds: statusIds,
        comment: comment,
        forward: forward,
      );

  @override
  IUnifediApiFeature get reportAccountFeature =>
      pleromaApiAccountUserAccessService.reportAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get reportAccountForwardFeature =>
      pleromaApiAccountUserAccessService.reportAccountForwardFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiAccountUserAccessService.restService,
      );

  @override
  Future<List<IUnifediApiAccount>> search({
    required String query,
    required bool? resolve,
    required bool? following,
    required int? limit,
  }) =>
      pleromaApiAccountUserAccessService
          .search(
            query: query,
            resolve: resolve,
            following: following,
            limit: limit,
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiAccountPleromaAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get searchFeature =>
      pleromaApiAccountUserAccessService.searchFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> subscribeAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .subscribeAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get subscribeAccountFeature =>
      pleromaApiAccountUserAccessService.subscribeAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unBlockAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .unBlockAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unBlockAccountFeature =>
      pleromaApiAccountUserAccessService.unBlockAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> unBlockDomain({
    required String domain,
  }) =>
      pleromaApiAccountUserAccessService.unBlockDomain(domain: domain);

  @override
  IUnifediApiFeature get unBlockDomainFeature =>
      pleromaApiAccountUserAccessService.unBlockDomainFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unFollowAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .unFollowAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unFollowAccountFeature =>
      pleromaApiAccountUserAccessService.unFollowAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unMuteAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .unMuteAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unMuteAccountFeature =>
      pleromaApiAccountUserAccessService.unMuteAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unPinAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .unPinAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unPinAccountFeature =>
      pleromaApiAccountUserAccessService.unPinAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unSubscribeAccount({
    required String accountId,
  }) =>
      pleromaApiAccountUserAccessService
          .unSubscribeAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get unSubscribeAccountFeature =>
      pleromaApiAccountUserAccessService.unSubscribeAccountFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getAccountFollowersWithRelationshipFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getAccountFollowingsWithRelationshipFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getAccountWithRelationshipFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get registerAccountCaptchaFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getAccountStatusesWithMutedFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getAccountStatusesExcludeVisibilitiesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get registerAccountBioFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get registerAccountFullNameFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get registerAccountInviteTokenFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues() =>
      pleromaApiAccountUserAccessService
          .calculatePossibleExcludeVisibilitiesValues()
          .toUnifediApiVisibilityList();
}
