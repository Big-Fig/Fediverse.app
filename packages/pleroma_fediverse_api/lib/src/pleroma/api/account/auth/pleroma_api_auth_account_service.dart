import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';

abstract class IPleromaApiAuthAccountService extends IPleromaApiAuth
    implements IPleromaApiAccountService {
  /// Find out whether a given account is followed, blocked, muted, etc.
  Future<List<IPleromaApiAccountRelationship>> getRelationshipWithAccounts({
    required List<String> remoteAccountIds,
  });

  Future<List<IPleromaApiAccount>> search({
    required String query,
    bool? resolve,
    bool? following,
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiList>> getListsWithAccount({
    required String accountRemoteId,
  });

  Future<List<IPleromaApiAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> followAccount({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> unFollowAccount({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> subscribeAccount({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> unSubscribeAccount({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> pinAccount({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> unPinAccount({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> muteAccount({
    required String accountRemoteId,
    required bool? notifications,
    required int? expireDurationInSeconds,
  });

  Future<IPleromaApiAccountRelationship> unMuteAccount({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> blockAccount({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> unBlockAccount({
    required String accountRemoteId,
  });

  Future blockDomain({
    required String domain,
  });

  Future unBlockDomain({
    required String domain,
  });

  Future reportAccount({
    required IPleromaApiAccountReportRequest reportRequest,
  });
}
