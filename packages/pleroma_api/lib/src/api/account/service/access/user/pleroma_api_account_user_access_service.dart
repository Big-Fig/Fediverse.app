import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../list/pleroma_api_list_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../identity_proof/pleroma_api_account_identity_proof_model.dart';
import '../../../pleroma_api_account_model.dart';
import '../../../relationship/pleroma_api_account_relationship_model.dart';
import '../application/pleroma_api_account_application_access_service.dart';

abstract class IPleromaApiAccountUserAccessService extends IPleromaApiService
    implements IPleromaApiAccountApplicationAccessService {
  List<PleromaApiVisibility> calculatePossibleExcludeVisibilitiesValues();

  IPleromaApiFeature get getRelationshipWithAccountsFeature;

  IPleromaApiFeature get searchFeature;

  IPleromaApiFeature get getListsWithAccountFeature;

  IPleromaApiFeature get getAccountIdentifyProofsFeature;

  IPleromaApiFeature get followAccountFeature;

  IPleromaApiFeature get followAccountNotifyFeature;

  IPleromaApiFeature get unFollowAccountFeature;

  IPleromaApiFeature get pinAccountFeature;

  IPleromaApiFeature get unPinAccountFeature;

  IPleromaApiFeature get muteAccountFeature;

  IPleromaApiFeature get unMuteAccountFeature;

  IPleromaApiFeature get subscribeAccountFeature;

  IPleromaApiFeature get unSubscribeAccountFeature;

  IPleromaApiFeature get blockAccountFeature;

  IPleromaApiFeature get unBlockAccountFeature;

  IPleromaApiFeature get blockDomainFeature;

  IPleromaApiFeature get unBlockDomainFeature;

  IPleromaApiFeature get noteFeature;

  IPleromaApiFeature get reportAccountFeature;

  IPleromaApiFeature get reportAccountForwardFeature;

  IPleromaApiFeature get getAccountFollowingsFeature;

  IPleromaApiFeature get getAccountFollowersFeature;

  /// Find out whether a given account is followed, blocked, muted, etc.
  Future<List<IPleromaApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> accountIds,
  });

  Future<List<IPleromaApiAccount>> search({
    required String query,
    required bool? resolve,
    required bool? following,
    required int? limit,
  });

  Future<List<IPleromaApiList>> getListsWithAccount({
    required String accountId,
  });

  Future<List<IPleromaApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> followAccount({
    required String accountId,
    required bool? notify,
    required bool? reblogs,
  });

  Future<IPleromaApiAccountRelationship> unFollowAccount({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> subscribeAccount({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> unSubscribeAccount({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> pinAccount({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> unPinAccount({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> muteAccount({
    required String accountId,
    required bool? notifications,
    required Duration? expireIn,
  });

  Future<IPleromaApiAccountRelationship> unMuteAccount({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> blockAccount({
    required String accountId,
  });

  Future<IPleromaApiAccountRelationship> unBlockAccount({
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

  Future<List<IPleromaApiAccount>> getAccountFollowings({
    required String accountId,
    required bool? withRelationship,
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiAccount>> getAccountFollowers({
    required String accountId,
    required bool? withRelationship,
    required IPleromaApiPagination? pagination,
  });

  Future<IPleromaApiAccountRelationship> note({
    required String accountId,
    required String comment,
  });
}
