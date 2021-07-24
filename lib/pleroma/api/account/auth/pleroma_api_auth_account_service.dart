import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiAuthAccountService extends IPleromaApiAuth
    implements IPleromaApiAccountService {
  static IPleromaApiAuthAccountService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiAuthAccountService>(
        context,
        listen: listen,
      );

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
