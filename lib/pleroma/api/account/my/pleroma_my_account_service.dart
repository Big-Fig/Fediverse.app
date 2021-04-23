import 'package:fedi/pleroma/api/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaMyAccountService extends IPleromaApi {
  static IPleromaMyAccountService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaMyAccountService>(
        context,
        listen: listen,
      );

  Future<IPleromaMyAccount> updateCredentials(
    IPleromaMyAccountEdit accountEditData,
  );

  Future<IPleromaMyAccount> updateFiles(
    PleromaMyAccountFilesRequest accountFilesRequest,
  );

  Future<IPleromaMyAccount> verifyCredentials();

  Future<List<String>> getDomainBlocks({
    IPleromaPaginationRequest? pagination,
  });

  Future<List<IPleromaAccount>> getAccountBlocks({
    IPleromaPaginationRequest? pagination,
  });

  Future<List<IPleromaAccount>> getAccountMutes({
    IPleromaPaginationRequest? pagination,
  });

  Future<List<IPleromaStatus>> getBookmarks({
    IPleromaPaginationRequest? pagination,
  });

  Future<List<IPleromaStatus>> getFavourites({
    IPleromaPaginationRequest? pagination,
  });

  Future<List<IPleromaAccount>> getFollowRequests({
    IPleromaPaginationRequest? pagination,
  });

  Future<IPleromaAccountRelationship> acceptFollowRequest({
    required String accountRemoteId,
  });

  Future<IPleromaAccountRelationship> rejectFollowRequest({
    required String accountRemoteId,
  });
}
