import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiAccountService extends IPleromaApi {
  static IPleromaApiAccountService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiAccountService>(context, listen: listen);

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
