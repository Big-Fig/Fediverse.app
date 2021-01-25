import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAccountService implements IPleromaApi {
  static IPleromaAccountService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaAccountService>(context, listen: listen);

  Future<List<IPleromaAccount>> getAccountFollowings({
    @required String accountRemoteId,
    IPleromaPaginationRequest pagination,
  });

  Future<List<IPleromaAccount>> getAccountFollowers({
    @required String accountRemoteId,
    IPleromaPaginationRequest pagination,
  });

  Future<List<IPleromaStatus>> getAccountStatuses({
    @required String accountRemoteId,
    String tagged,
    bool pinned,
    bool excludeReplies,
    bool excludeReblogs,
    List<String> excludeVisibilities,
    bool withMuted,
    bool onlyWithMedia,
    IPleromaPaginationRequest pagination,
  });

  Future<List<IPleromaStatus>> getAccountFavouritedStatuses({
    @required String accountRemoteId,
    IPleromaPaginationRequest pagination,
  });

  Future<IPleromaAccount> getAccount({
    @required String accountRemoteId,
  });
}
