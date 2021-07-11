import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/pleroma/api/directory/pleroma_api_directory_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:logging/logging.dart';

final _logger =
    Logger('instance_directory_account_list_network_only_list_bloc_impl.dart');

class InstanceDirectoryAccountListNetworkOnlyListBloc extends DisposableOwner
    implements IInstanceDirectoryAccountListNetworkOnlyListBloc {
  final IPleromaApiDirectoryService pleromaApiDirectoryService;

  @override
  IPleromaApi get pleromaApi => pleromaApiDirectoryService;

  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  InstanceDirectoryAccountListNetworkOnlyListBloc({
    required this.pleromaApiDirectoryService,
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
    var pleromaAccounts = await pleromaApiDirectoryService.getDirectoryAccounts(
      pagination: PleromaApiPaginationRequest(
        limit: itemsCountPerPage,
        sinceId: minId,
        maxId: maxId,
      ),
      onlyLocal: true,
    );
    List<IAccount> result = pleromaAccounts
        .map(
          (pleromaAccount) => pleromaAccount.toDbAccountWrapper(),
        )
        .toList();

    _logger.finest(() => 'loadItemsFromRemoteForPage \n'
        'result ${result.length} ');

    return result;
  }
}
