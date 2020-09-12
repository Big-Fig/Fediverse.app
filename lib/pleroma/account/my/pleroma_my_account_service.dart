import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaMyAccountService implements IPleromaApi {
  static IPleromaMyAccountService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaMyAccountService>(context, listen: listen);

  Future<IPleromaMyAccount> updateCredentials(
      IPleromaMyAccountEdit accountEditData);

  Future<IPleromaMyAccount> updateFiles(
      PleromaMyAccountFilesRequest accountFilesRequest);

  Future<IPleromaMyAccount> verifyCredentials();

  Future<List<String>> getDomainBlocks({
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaAccount>> getAccountBlocks({
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaAccount>> getMutes({
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaStatus>> getBookmarks({
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaStatus>> getFavourites({
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<List<IPleromaAccount>> getFollowRequests({
    String sinceId,
    String maxId,
    int limit = 20,
  });

  Future<IPleromaAccountRelationship> acceptFollowRequest({
    String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> rejectFollowRequest({
    String accountRemoteId,
  });
}
