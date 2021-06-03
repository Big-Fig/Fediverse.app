import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_network_only_list_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';

abstract class AccountStatusesWithRepliesNetworkOnlyListBloc
    extends AccountStatusesNetworkOnlyListBloc {
  AccountStatusesWithRepliesNetworkOnlyListBloc({
    required IAccount? account,
    required IPleromaApiAccountService pleromaAccountService,
  }) : super(account: account, pleromaAccountService: pleromaAccountService);

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  @override
  Future<List<IStatus>> loadItemsFromRemoteForPage({
    int? pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var pleromaStatuses = await pleromaAccountService.getAccountStatuses(
      accountRemoteId: account!.remoteId,
      pagination: PleromaApiPaginationRequest(
        limit: itemsCountPerPage,
        sinceId: minId,
        maxId: maxId,
      ),
    );
    return pleromaStatuses
        .map((pleromaStatus) => pleromaStatus.toDbStatusPopulatedWrapper())
        .toList();
  }
}
