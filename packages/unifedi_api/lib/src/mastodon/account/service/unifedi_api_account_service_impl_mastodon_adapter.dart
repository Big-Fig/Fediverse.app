import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/account/identity_proof/unifedi_api_account_identity_proof_model.dart';
import '../../../api/account/register/response/unifedi_api_register_account_response_model.dart';
import '../../../api/account/register/unifedi_api_register_account_model.dart';
import '../../../api/account/relationship/unifedi_api_account_relationship_model.dart';
import '../../../api/account/service/unifedi_api_account_service.dart';
import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/list/unifedi_api_list_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../list/unifedi_api_list_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';
import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../../status/unifedi_api_status_model_mastodon_adapter.dart';
import '../identity_proof/unifedi_api_account_identity_proof_model_mastodon_adapter.dart';
import '../register/response/unifedi_api_register_account_response_model_mastodon_adapter.dart';
import '../relationship/unifedi_api_account_relationship_model_mastodon_adapter.dart';
import '../unifedi_api_account_model_mastodon_adapter.dart';

class UnifediApiAccountServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiAccountService {
  final IMastodonApiAccountUserAccessService
      mastodonApiAccountUserAccessService;

  UnifediApiAccountServiceMastodonAdapter({
    required this.mastodonApiAccountUserAccessService,
  });

  @override
  Future<IUnifediApiAccountRelationship> blockAccount({
    required String accountId,
  }) =>
      mastodonApiAccountUserAccessService
          .blockAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get blockAccountFeature =>
      mastodonApiAccountUserAccessService.blockAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> blockDomain({
    required String domain,
  }) =>
      mastodonApiAccountUserAccessService.blockDomain(domain: domain);

  @override
  IUnifediApiFeature get blockDomainFeature =>
      mastodonApiAccountUserAccessService.blockDomainFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship> followAccount({
    required String accountId,
    required bool? notify,
    required bool? reblogs,
  }) =>
      mastodonApiAccountUserAccessService
          .followAccount(
            accountId: accountId,
            notify: notify,
            reblogs: reblogs,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get followAccountFeature =>
      mastodonApiAccountUserAccessService.followAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get followAccountNotifyFeature =>
      mastodonApiAccountUserAccessService.followAccountNotifyFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccount> getAccount({
    required String accountId,
    required bool? withRelationship,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withRelationship,
      feature: getAccountWithRelationshipFeature,
    );

    return mastodonApiAccountUserAccessService
        .getAccount(
          accountId: accountId,
        )
        .then(
          (value) => value.toUnifediApiAccountMastodonAdapter(),
        );
  }

  @override
  Future<List<IUnifediApiStatus>> getAccountFavouritedStatuses({
    required String accountId,
    required IUnifediApiPagination? pagination,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getAccountFavouritedStatusesFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getAccountFavouritedStatusesFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getAccountFavouritedStatuses',
      );

  @override
  IUnifediApiFeature get getAccountFeature =>
      mastodonApiAccountUserAccessService.getAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> getAccountFollowers({
    required String accountId,
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withRelationship,
      feature: getAccountFollowersWithRelationshipFeature,
    );

    return mastodonApiAccountUserAccessService
        .getAccountFollowers(
          accountId: accountId,
          pagination: pagination?.toMastodonApiPagination(),
        )
        .then(
          (list) => list
              .map(
                (value) => value.toUnifediApiAccountMastodonAdapter(),
              )
              .toList(),
        );
  }

  @override
  IUnifediApiFeature get getAccountFollowersFeature =>
      mastodonApiAccountUserAccessService.getAccountFollowersFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccount>> getAccountFollowings({
    required String accountId,
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withRelationship,
      feature: getAccountFollowingsWithRelationshipFeature,
    );

    return mastodonApiAccountUserAccessService
        .getAccountFollowings(
          accountId: accountId,
          pagination: pagination?.toMastodonApiPagination(),
        )
        .then(
          (list) => list
              .map(
                (value) => value.toUnifediApiAccountMastodonAdapter(),
              )
              .toList(),
        );
  }

  @override
  IUnifediApiFeature get getAccountFollowingsFeature =>
      mastodonApiAccountUserAccessService.getAccountFollowingsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountId,
  }) =>
      mastodonApiAccountUserAccessService
          .getAccountIdentifyProofs(
            accountId: accountId,
          )
          .then(
            (list) => list
                .map(
                  (value) =>
                      value.toUnifediApiAccountIdentityProofMastodonAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getAccountIdentifyProofsFeature =>
      mastodonApiAccountUserAccessService.getAccountIdentifyProofsFeature
          .toUnifediApiFeatureMastodonAdapter();

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
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: withMuted,
      feature: getAccountStatusesWithMutedFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: excludeVisibilities,
      feature: getAccountStatusesExcludeVisibilitiesFeature,
    );

    return mastodonApiAccountUserAccessService
        .getAccountStatuses(
          accountId: accountId,
          tagged: tagged,
          pinned: pinned,
          excludeReplies: excludeReplies,
          excludeReblogs: excludeReblogs,
          onlyWithMedia: onlyWithMedia,
          pagination: pagination?.toMastodonApiPagination(),
        )
        .then(
          (list) => list
              .map(
                (value) => value.toUnifediApiStatusMastodonAdapter(),
              )
              .toList(),
        );
  }

  @override
  IUnifediApiFeature get getAccountStatusesExcludeReblogsFeature =>
      mastodonApiAccountUserAccessService
          .getAccountStatusesExcludeReblogsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getAccountStatusesFeature =>
      mastodonApiAccountUserAccessService.getAccountStatusesFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getAccountStatusesPaginationMinIdFeature =>
      mastodonApiAccountUserAccessService
          .getAccountStatusesPaginationMinIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getAccountStatusesTaggedFeature =>
      mastodonApiAccountUserAccessService.getAccountStatusesTaggedFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiList>> getListsWithAccount({
    required String accountId,
  }) =>
      mastodonApiAccountUserAccessService
          .getListsWithAccount(
            accountId: accountId,
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiListMastodonAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getListsWithAccountFeature =>
      mastodonApiAccountUserAccessService.getListsWithAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> accountIds,
  }) =>
      mastodonApiAccountUserAccessService
          .getRelationshipWithAccounts(
            accountIds: accountIds,
          )
          .then(
            (list) => list
                .map(
                  (value) =>
                      value.toUnifediApiAccountRelationshipMastodonAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get getRelationshipWithAccountsFeature =>
      mastodonApiAccountUserAccessService.getRelationshipWithAccountsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship> muteAccount({
    required String accountId,
    required bool? notifications,
    required Duration? expireIn,
  }) =>
      mastodonApiAccountUserAccessService
          .muteAccount(
            accountId: accountId,
            notifications: notifications,
            expireIn: expireIn,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get muteAccountFeature =>
      mastodonApiAccountUserAccessService.muteAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship> note({
    required String accountId,
    required String comment,
  }) =>
      mastodonApiAccountUserAccessService
          .note(
            accountId: accountId,
            comment: comment,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get noteFeature =>
      mastodonApiAccountUserAccessService.noteFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship> pinAccount({
    required String accountId,
  }) =>
      mastodonApiAccountUserAccessService
          .pinAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get pinAccountFeature =>
      mastodonApiAccountUserAccessService.pinAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  // ignore: long-parameter-list
  Future<IUnifediApiRegisterAccountResponse> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: registerAccount.captchaToken,
      feature: registerAccountCaptchaFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: registerAccount.captchaAnswerData,
      feature: registerAccountCaptchaFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: registerAccount.captchaSolution,
      feature: registerAccountCaptchaFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: registerAccount.fullName,
      feature: registerAccountFullNameFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: registerAccount.bio,
      feature: registerAccountBioFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: registerAccount.fullName,
      feature: registerAccountInviteTokenFeature,
    );

    return mastodonApiAccountUserAccessService
        .registerAccount(
          registerAccount: MastodonApiRegisterAccount(
            username: registerAccount.username,
            email: registerAccount.email,
            password: registerAccount.password,
            agreement: registerAccount.agreement,
            locale: registerAccount.locale,
            reason: registerAccount.reason,
          ),
        )
        .then(
          (value) => value.toUnifediApiRegisterAccountResponseMastodonAdapter(),
        );
  }

  @override
  IUnifediApiFeature get registerAccountFeature =>
      mastodonApiAccountUserAccessService.registerAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get registerAccountReasonFeature =>
      mastodonApiAccountUserAccessService.registerAccountReasonFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> reportAccount({
    required String accountId,
    required List<String>? statusIds,
    required String? comment,
    required bool? forward,
  }) =>
      mastodonApiAccountUserAccessService.reportAccount(
        accountId: accountId,
        statusIds: statusIds,
        comment: comment,
        forward: forward,
      );

  @override
  IUnifediApiFeature get reportAccountFeature =>
      mastodonApiAccountUserAccessService.reportAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get reportAccountForwardFeature =>
      mastodonApiAccountUserAccessService.reportAccountForwardFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService: mastodonApiAccountUserAccessService.restService,
      );

  @override
  Future<List<IUnifediApiAccount>> search({
    required String query,
    required bool? resolve,
    required bool? following,
    required int? limit,
  }) =>
      mastodonApiAccountUserAccessService
          .search(
            query: query,
            resolve: resolve,
            following: following,
            limit: limit,
          )
          .then(
            (list) => list
                .map(
                  (value) => value.toUnifediApiAccountMastodonAdapter(),
                )
                .toList(),
          );

  @override
  IUnifediApiFeature get searchFeature =>
      mastodonApiAccountUserAccessService.searchFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unSubscribeAccount({
    required String accountId,
  }) =>
      followAccount(
        accountId: accountId,
        notify: false,
        reblogs: null,
      );

  @override
  IUnifediApiFeature get unSubscribeAccountFeature =>
      followAccountNotifyFeature;

  @override
  Future<IUnifediApiAccountRelationship> subscribeAccount({
    required String accountId,
  }) =>
      followAccount(
        accountId: accountId,
        notify: true,
        reblogs: null,
      );

  @override
  IUnifediApiFeature get subscribeAccountFeature => followAccountNotifyFeature;

  @override
  Future<IUnifediApiAccountRelationship> unBlockAccount({
    required String accountId,
  }) =>
      mastodonApiAccountUserAccessService
          .unBlockAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unBlockAccountFeature =>
      mastodonApiAccountUserAccessService.unBlockAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> unBlockDomain({
    required String domain,
  }) =>
      mastodonApiAccountUserAccessService.unBlockDomain(domain: domain);

  @override
  IUnifediApiFeature get unBlockDomainFeature =>
      mastodonApiAccountUserAccessService.unBlockDomainFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unFollowAccount({
    required String accountId,
  }) =>
      mastodonApiAccountUserAccessService
          .unFollowAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unFollowAccountFeature =>
      mastodonApiAccountUserAccessService.unFollowAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unMuteAccount({
    required String accountId,
  }) =>
      mastodonApiAccountUserAccessService
          .unMuteAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unMuteAccountFeature =>
      mastodonApiAccountUserAccessService.unMuteAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiAccountRelationship> unPinAccount({
    required String accountId,
  }) =>
      mastodonApiAccountUserAccessService
          .unPinAccount(
            accountId: accountId,
          )
          .then(
            (value) => value.toUnifediApiAccountRelationshipMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get unPinAccountFeature =>
      mastodonApiAccountUserAccessService.unPinAccountFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  UnifediApiTypeNotSupportedFeature
      get getAccountFollowersWithRelationshipFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getAccountFollowersWithRelationshipFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature
      get getAccountFollowingsWithRelationshipFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getAccountFollowingsWithRelationshipFeature',
          );

  @override
  UnifediApiTypeNotSupportedFeature get getAccountWithRelationshipFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getAccountWithRelationshipFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get registerAccountCaptchaFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'registerAccountCaptchaFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get registerAccountFullNameFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'registerAccountFullNameFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get registerAccountBioFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'registerAccountBioFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get registerAccountInviteTokenFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'registerAccountInviteTokenFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get getAccountStatusesWithMutedFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getAccountStatusesWithMutedFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get getAccountStatusesExcludeVisibilitiesFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getAccountStatusesExcludeVisibilitiesFeature',
          );

  @override
  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues() =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getAccountStatusesExcludeVisibilitiesFeature,
      );
}
