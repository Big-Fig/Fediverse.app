import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_network_only_list_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class AccountStatusesWithRepliesNetworkOnlyListBloc
    extends AccountStatusesNetworkOnlyListBloc {
  AccountStatusesWithRepliesNetworkOnlyListBloc({
    required IAccount? account,
    required IUnifediApiAccountService unifediApiAccountService,
  }) : super(
            account: account,
            unifediApiAccountService: unifediApiAccountService);

  @override
  IUnifediApiService get unifediApi => unifediApiAccountService;

  @override
  Future<List<IStatus>> loadItemsFromRemoteForPage({
    int? pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var unifediApiStatuses = await unifediApiAccountService.getAccountStatuses(
      accountId: account!.remoteId,
      pagination: UnifediApiPagination(
        limit: itemsCountPerPage,
        minId: minId,
        maxId: maxId,
      ),
      tagged: null,
      pinned: null,
      excludeReplies: null,
      excludeReblogs: null,
      excludeVisibilities: null,
      withMuted: null,
      onlyWithMedia: null,
    );

    return unifediApiStatuses
        .map(
            (unifediApiStatus) => unifediApiStatus.toDbStatusPopulatedWrapper())
        .toList();
  }
}
