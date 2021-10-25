import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../list/mastodon_api_list_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../identity_proof/mastodon_api_account_identity_proof_model.dart';
import '../../../mastodon_api_account_model.dart';
import '../../../relationship/mastodon_api_account_relationship_model.dart';
import '../application/mastodon_api_account_application_access_service.dart';

abstract class IMastodonApiAccountUserAccessService extends IMastodonApiService
    implements IMastodonApiAccountApplicationAccessService {
  IMastodonApiFeature get getRelationshipWithAccountsFeature;

  IMastodonApiFeature get searchFeature;

  IMastodonApiFeature get getListsWithAccountFeature;

  IMastodonApiFeature get getAccountIdentifyProofsFeature;

  IMastodonApiFeature get followAccountFeature;

  IMastodonApiFeature get followAccountNotifyFeature;

  IMastodonApiFeature get unFollowAccountFeature;

  IMastodonApiFeature get pinAccountFeature;

  IMastodonApiFeature get unPinAccountFeature;

  IMastodonApiFeature get muteAccountFeature;

  IMastodonApiFeature get unMuteAccountFeature;

  IMastodonApiFeature get blockAccountFeature;

  IMastodonApiFeature get unBlockAccountFeature;

  IMastodonApiFeature get blockDomainFeature;

  IMastodonApiFeature get unBlockDomainFeature;

  IMastodonApiFeature get noteFeature;

  IMastodonApiFeature get reportAccountFeature;

  IMastodonApiFeature get reportAccountForwardFeature;

  IMastodonApiFeature get getAccountFollowingsFeature;

  IMastodonApiFeature get getAccountFollowersFeature;

  /// Find out whether a given account is followed, blocked, muted, etc.
  Future<List<IMastodonApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> accountIds,
  });

  Future<List<IMastodonApiAccount>> search({
    required String query,
    required bool? resolve,
    required bool? following,
    required int? limit,
  });

  Future<List<IMastodonApiList>> getListsWithAccount({
    required String accountId,
  });

  Future<List<IMastodonApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountId,
  });

  Future<IMastodonApiAccountRelationship> followAccount({
    required String accountId,
    required bool? notify,
    required bool? reblogs,
  });

  Future<IMastodonApiAccountRelationship> unFollowAccount({
    required String accountId,
  });

  Future<IMastodonApiAccountRelationship> pinAccount({
    required String accountId,
  });

  Future<IMastodonApiAccountRelationship> unPinAccount({
    required String accountId,
  });

  Future<IMastodonApiAccountRelationship> muteAccount({
    required String accountId,
    required bool? notifications,
    required Duration? expireIn,
  });

  Future<IMastodonApiAccountRelationship> unMuteAccount({
    required String accountId,
  });

  Future<IMastodonApiAccountRelationship> blockAccount({
    required String accountId,
  });

  Future<IMastodonApiAccountRelationship> unBlockAccount({
    required String accountId,
  });

  Future<void> blockDomain({
    required String domain,
  });

  Future<void> unBlockDomain({
    required String domain,
  });

  Future<IMastodonApiAccountRelationship> note({
    required String accountId,
    required String comment,
  });

  Future<void> reportAccount({
    required String accountId,
    required List<String>? statusIds,
    required String? comment,
    required bool? forward,
  });

  Future<List<IMastodonApiAccount>> getAccountFollowings({
    required String accountId,
    required IMastodonApiPagination? pagination,
  });

  Future<List<IMastodonApiAccount>> getAccountFollowers({
    required String accountId,
    required IMastodonApiPagination? pagination,
  });
}
