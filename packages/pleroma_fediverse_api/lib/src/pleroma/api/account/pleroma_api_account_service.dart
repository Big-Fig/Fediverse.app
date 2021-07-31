import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IPleromaApiAccountService extends IPleromaApi {
  Future<List<IPleromaApiAccount>> getAccountFollowings({
    required String accountRemoteId,
    required bool withRelationship,
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiAccount>> getAccountFollowers({
    required String accountRemoteId,
    required bool withRelationship,
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiStatus>> getAccountStatuses({
    required String accountRemoteId,
    String? tagged,
    bool? pinned,
    bool? excludeReplies,
    bool? excludeReblogs,
    List<String>? excludeVisibilities,
    bool? withMuted,
    bool? onlyWithMedia,
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiStatus>> getAccountFavouritedStatuses({
    required String accountRemoteId,
    IPleromaApiPaginationRequest? pagination,
  });

  Future<IPleromaApiAccount> getAccount({
    required String accountRemoteId,
    required bool withRelationship,
  });
}
