import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger =
    Logger('instance_directory_account_list_network_only_list_bloc_impl.dart');

class InstanceDirectoryAccountListNetworkOnlyListBloc extends DisposableOwner
    implements IInstanceDirectoryAccountListNetworkOnlyListBloc {
  final IUnifediApiInstanceService unifediApiInstanceService;

  @override
  IUnifediApiService get unifediApi => unifediApiInstanceService;

  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  InstanceDirectoryAccountListNetworkOnlyListBloc({
    required this.unifediApiInstanceService,
    required this.instanceLocation,
    required this.remoteInstanceUriOrNull,
  });

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  }) async {
    var unifediApiAccounts =
        await unifediApiInstanceService.getDirectoryAccounts(
      pagination: UnifediApiPagination(
        limit: itemsCountPerPage,
        minId: minId,
        maxId: maxId,
      ),
      onlyLocal: true,
    );
    List<IAccount> result = unifediApiAccounts
        .map(
          (unifediApiAccount) => unifediApiAccount.toDbAccountWrapper(),
        )
        .toList();

    _logger.finest(
      () => 'loadItemsFromRemoteForPage \n'
          'result ${result.length} ',
    );

    return result;
  }
}
