import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/endorsement/account_list/network_only/my_account_endorsement_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/endorsements/pleroma_api_endorsements_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:logging/logging.dart';

final _logger =
    Logger('my_account_endorsement_account_list_network_only_list_bloc_impl.dart');

class MyAccountEndorsementAccountListNetworkOnlyListBloc extends DisposableOwner
    implements IMyAccountEndorsementAccountListNetworkOnlyListBloc {
  final IPleromaApiEndorsementsService pleromaApiEndorsementsService;

  @override
  IPleromaApi get pleromaApi => pleromaApiEndorsementsService;

  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  MyAccountEndorsementAccountListNetworkOnlyListBloc({
    required this.pleromaApiEndorsementsService,
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
    var pleromaAccounts = await pleromaApiEndorsementsService.getEndorsements(
      pagination: PleromaApiPaginationRequest(
        limit: itemsCountPerPage,
        sinceId: minId,
        maxId: maxId,
      ),
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
