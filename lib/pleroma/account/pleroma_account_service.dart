import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAccountService implements IPleromaApi {
  static IPleromaAccountService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaAccountService>(context, listen: listen);

  /// Find out whether a given account is followed, blocked, muted, etc.
  Future<List<IPleromaAccountRelationship>> getRelationshipWithAccounts(
      {@required List<String> remoteAccountIds});

  Future<List<IPleromaAccount>> search({
    @required String query,
    bool resolve,
    bool following,
    int limit = 20,
  });

  Future<List<IPleromaList>> getListsWithAccount({
    @required String accountRemoteId,
  });

  Future<List<IPleromaAccount>> getAccountFollowings({
    @required String accountRemoteId,
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaAccount>> getAccountFollowers({
    @required String accountRemoteId,
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaStatus>> getAccountStatuses({
    @required String accountRemoteId,
    String tagged,
    bool pinned,
    bool excludeReplies,
    bool excludeReblogs,
    List<String> excludeVisibilities,
    bool withMuted,
    bool onlyMedia,
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaAccountIdentityProof>> getAccountIdentifyProofs({
    @required String accountRemoteId,
  });

  Future<IPleromaAccount> getAccount({@required String accountRemoteId});

  Future<IPleromaAccountRelationship> followAccount({
    @required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> unFollowAccount({
    @required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> pinAccount({
    @required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> unPinAccount({
    @required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> muteAccount(
      {@required String accountRemoteId, bool notifications});

  Future<IPleromaAccountRelationship> unMuteAccount({
    @required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> blockAccount({
    @required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> unBlockAccount({
    @required String accountRemoteId,
  });

  Future blockDomain({@required String domain});

  Future unBlockDomain({@required String domain});


  Future<bool> reportAccount({
    @required IPleromaAccountReportRequest reportRequest,
  });
}
