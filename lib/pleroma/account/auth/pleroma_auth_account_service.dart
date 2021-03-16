import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAuthAccountService
    implements IPleromaAccountService, IPleromaAuthApi {
  static IPleromaAuthAccountService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaAuthAccountService>(
        context,
        listen: listen,
      );

  /// Find out whether a given account is followed, blocked, muted, etc.
  Future<List<IPleromaAccountRelationship>> getRelationshipWithAccounts({
    required List<String> remoteAccountIds,
  });

  Future<List<IPleromaAccount>> search({
    required String query,
    bool? resolve,
    bool? following,
    IPleromaPaginationRequest? pagination,
  });

  Future<List<IPleromaList>> getListsWithAccount({
    required String accountRemoteId,
  });

  Future<List<IPleromaAccountIdentityProof>> getAccountIdentifyProofs({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> followAccount({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> unFollowAccount({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> subscribeAccount({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> unSubscribeAccount({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> pinAccount({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> unPinAccount({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> muteAccount({
    required String accountRemoteId,
    required bool? notifications,
    required int? expireDurationInSeconds,
  });

  Future<IPleromaAccountRelationship> unMuteAccount({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> blockAccount({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> unBlockAccount({
    required String accountRemoteId,
  });

  Future blockDomain({
    required String domain,
  });

  Future unBlockDomain({
    required String domain,
  });

  Future<bool> reportAccount({
    required IPleromaAccountReportRequest reportRequest,
  });
}
