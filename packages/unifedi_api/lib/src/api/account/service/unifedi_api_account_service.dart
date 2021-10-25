import '../../feature/unifedi_api_feature_model.dart';
import '../../list/unifedi_api_list_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../status/unifedi_api_status_model.dart';
import '../../unifedi_api_service.dart';
import '../../visibility/unifedi_api_visibility_sealed.dart';
import '../identity_proof/unifedi_api_account_identity_proof_model.dart';
import '../register/response/unifedi_api_register_account_response_model.dart';
import '../register/unifedi_api_register_account_model.dart';
import '../relationship/unifedi_api_account_relationship_model.dart';
import '../unifedi_api_account_model.dart';

abstract class IUnifediApiAccountService implements IUnifediApiService {
  IUnifediApiFeature get getAccountStatusesFeature;

  IUnifediApiFeature get getAccountStatusesWithMutedFeature;

  IUnifediApiFeature get getAccountStatusesExcludeVisibilitiesFeature;

  IUnifediApiFeature get getAccountStatusesPaginationMinIdFeature;

  IUnifediApiFeature get getAccountStatusesExcludeReblogsFeature;

  IUnifediApiFeature get getAccountStatusesTaggedFeature;

  IUnifediApiFeature get getAccountFavouritedStatusesFeature;

  IUnifediApiFeature get getAccountFeature;

  IUnifediApiFeature get getAccountWithRelationshipFeature;

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
  });

  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues();

  Future<List<IUnifediApiStatus>> getAccountFavouritedStatuses({
    required String accountId,
    required IUnifediApiPagination? pagination,
  });

  Future<IUnifediApiAccount> getAccount({
    required String accountId,
    required bool? withRelationship,
  });

  IUnifediApiFeature get getRelationshipWithAccountsFeature;

  IUnifediApiFeature get searchFeature;

  IUnifediApiFeature get getListsWithAccountFeature;

  IUnifediApiFeature get getAccountIdentifyProofsFeature;

  IUnifediApiFeature get followAccountFeature;

  IUnifediApiFeature get followAccountNotifyFeature;

  IUnifediApiFeature get unFollowAccountFeature;

  IUnifediApiFeature get pinAccountFeature;

  IUnifediApiFeature get unPinAccountFeature;

  IUnifediApiFeature get muteAccountFeature;

  IUnifediApiFeature get unMuteAccountFeature;

  IUnifediApiFeature get subscribeAccountFeature;

  IUnifediApiFeature get unSubscribeAccountFeature;

  IUnifediApiFeature get blockAccountFeature;

  IUnifediApiFeature get unBlockAccountFeature;

  IUnifediApiFeature get blockDomainFeature;

  IUnifediApiFeature get unBlockDomainFeature;

  IUnifediApiFeature get noteFeature;

  IUnifediApiFeature get reportAccountFeature;

  IUnifediApiFeature get reportAccountForwardFeature;

  IUnifediApiFeature get getAccountFollowingsFeature;

  IUnifediApiFeature get getAccountFollowersFeature;

  /// Find out whether a given account is followed, blocked, muted, etc.
  Future<List<IUnifediApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> accountIds,
  });

  Future<List<IUnifediApiAccount>> search({
    required String query,
    required bool? resolve,
    required bool? following,
    required int? limit,
  });

  Future<List<IUnifediApiList>> getListsWithAccount({
    required String accountId,
  });

  Future<List<IUnifediApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship> followAccount({
    required String accountId,
    required bool? notify,
    required bool? reblogs,
  });

  Future<IUnifediApiAccountRelationship> unFollowAccount({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship> subscribeAccount({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship> unSubscribeAccount({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship> pinAccount({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship> unPinAccount({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship> muteAccount({
    required String accountId,
    required bool? notifications,
    required Duration? expireIn,
  });

  Future<IUnifediApiAccountRelationship> unMuteAccount({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship> blockAccount({
    required String accountId,
  });

  Future<IUnifediApiAccountRelationship> unBlockAccount({
    required String accountId,
  });

  Future<void> blockDomain({
    required String domain,
  });

  Future<void> unBlockDomain({
    required String domain,
  });

  Future<void> reportAccount({
    required String accountId,
    required List<String>? statusIds,
    required String? comment,
    required bool? forward,
  });

  IUnifediApiFeature get getAccountFollowingsWithRelationshipFeature;

  Future<List<IUnifediApiAccount>> getAccountFollowings({
    required String accountId,
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  });

  IUnifediApiFeature get getAccountFollowersWithRelationshipFeature;

  Future<List<IUnifediApiAccount>> getAccountFollowers({
    required String accountId,
    required bool? withRelationship,
    required IUnifediApiPagination? pagination,
  });

  Future<IUnifediApiAccountRelationship> note({
    required String accountId,
    required String comment,
  });

  IUnifediApiFeature get registerAccountFeature;

  IUnifediApiFeature get registerAccountReasonFeature;

  IUnifediApiFeature get registerAccountCaptchaFeature;

  IUnifediApiFeature get registerAccountFullNameFeature;

  IUnifediApiFeature get registerAccountBioFeature;

  IUnifediApiFeature get registerAccountInviteTokenFeature;

  Future<IUnifediApiRegisterAccountResponse> registerAccount({
    required IUnifediApiRegisterAccount registerAccount,
  });
}
