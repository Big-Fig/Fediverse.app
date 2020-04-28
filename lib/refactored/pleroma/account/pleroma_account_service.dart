import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/list/pleroma_mastodon_list_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAccountService implements IPleromaApi {
  static IPleromaAccountService of(BuildContext context, {listen: true}) =>
      Provider.of<IPleromaAccountService>(context, listen: listen);

  /// Find out whether a given account is followed, blocked, muted, etc.
  Future<List<IPleromaAccountRelationship>> getRelationshipWithAccounts(
      {@required List<String> remoteAccountIds});

  Future<List<IPleromaAccount>> search({
    @required String query,

    /// Attempt WebFinger lookup. Defaults to false. Use this when q is an
    /// exact address.
    bool resolve,

    /// Only who the user is following. Defaults to false.
    bool following,

    /// Maximum number of results to return
    int limit = 20,
  });

  Future<List<IPleromaList>> getAccountLists({
    @required String accountRemoteId,
  });

  Future<List<IPleromaAccount>> getAccountFollowings({
    @required String accountRemoteId,

    /// Return results newer than id
    String sinceId,

    /// Return results immediately newer than id
    String maxId,

    /// Maximum number of results to return
    int limit = 20,
  });

  Future<List<IPleromaAccount>> getAccountFollowers({
    @required String accountRemoteId,

    /// Return results newer than id
    String sinceId,

    /// Return results immediately newer than id
    String maxId,

    /// Maximum number of results to return
    int limit = 20,
  });

  Future<List<IPleromaStatus>> getAccountStatuses({
    @required String accountRemoteId,

    /// Return results newer than id
    String sinceId,

    /// Return results immediately newer than id
    String maxId,

    /// Maximum number of results to return
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

  Future<bool> reportAccount({
    @required IPleromaAccountReportRequest reportRequest,
  });
}
