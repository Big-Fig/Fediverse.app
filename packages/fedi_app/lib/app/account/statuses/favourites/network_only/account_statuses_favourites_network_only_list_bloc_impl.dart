import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/statuses/account_statuses_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class AccountStatusesFavouritesNetworkOnlyListBloc
    extends AccountStatusesNetworkOnlyListBloc {
  AccountStatusesFavouritesNetworkOnlyListBloc({
    required IAccount? account,
    required IUnifediApiAccountService unifediApiAccountService,
  }) : super(
          account: account,
          unifediApiAccountService: unifediApiAccountService,
        );

  @override
  IUnifediApiService get unifediApi => unifediApiAccountService;

  @override
  Future<List<IStatus>> loadItemsFromRemoteForPage({
    required int pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var unifediApiStatuses =
        await unifediApiAccountService.getAccountFavouritedStatuses(
      accountId: account!.remoteId,
      pagination: UnifediApiPagination(
        limit: itemsCountPerPage,
        minId: minId,
        maxId: maxId,
      ),
    );

    return unifediApiStatuses
        .map(
          (unifediApiStatus) => unifediApiStatus.toDbStatusPopulatedWrapper(),
        )
        .toList();
  }
}
