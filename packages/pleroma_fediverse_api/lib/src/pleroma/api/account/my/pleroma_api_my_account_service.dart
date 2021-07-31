import 'package:pleroma_fediverse_api/src/pleroma/api/account/my/pleroma_api_my_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IPleromaApiMyAccountService extends IPleromaApi {
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
    required bool withRelationship,
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
