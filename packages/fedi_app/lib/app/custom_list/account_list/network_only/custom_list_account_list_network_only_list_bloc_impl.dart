import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/custom_list/account_list/network_only/custom_list_account_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/custom_list/custom_list_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger =
    Logger('custom_list_account_list_network_only_list_bloc_impl.dart');

class CustomListAccountListNetworkOnlyListBloc extends DisposableOwner
    implements ICustomListAccountListNetworkOnlyListBloc {
  final ICustomList? customList;
  final IUnifediApiListService unifediListService;

  @override
  IUnifediApiService get unifediApi => unifediListService;

  CustomListAccountListNetworkOnlyListBloc({
    required this.customList,
    required this.unifediListService,
  });

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  }) async {
    List<IAccount> result;
    if (customList == null) {
      result = [];
    } else {
      var unifediApiAccounts = await unifediListService.getListAccounts(
        pagination: UnifediApiPagination(
          limit: itemsCountPerPage,
          minId: minId,
          maxId: maxId,
        ),
        listId: customList!.remoteId,
      );
      result = unifediApiAccounts
          .map(
            (unifediApiAccount) => unifediApiAccount.toDbAccountWrapper(),
          )
          .toList();
    }
    _logger.finest(
      () => 'loadItemsFromRemoteForPage \n'
          'customList ${customList?.remoteId} \n'
          'result ${result.length} ',
    );

    return result;
  }
}
