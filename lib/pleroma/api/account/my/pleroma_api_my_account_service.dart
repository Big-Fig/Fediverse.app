import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiMyAccountService extends IPleromaApi {
  static IPleromaApiMyAccountService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiMyAccountService>(
        context,
        listen: listen,
      );

  Future<IPleromaApiMyAccount> updateCredentials(
    IPleromaApiMyAccountEdit accountEditData,
  );

  Future<IPleromaApiMyAccount> updateFiles(
    PleromaApiMyAccountFilesRequest accountFilesRequest,
  );

  Future<IPleromaApiMyAccount> verifyCredentials();

  Future<List<String>> getDomainBlocks({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiAccount>> getAccountBlocks({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiAccount>> getAccountMutes({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiStatus>> getBookmarks({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiStatus>> getFavourites({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiAccount>> getFollowRequests({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<IPleromaApiAccountRelationship> acceptFollowRequest({
    required String accountRemoteId,
  });

  Future<IPleromaApiAccountRelationship> rejectFollowRequest({
    required String accountRemoteId,
  });
}
