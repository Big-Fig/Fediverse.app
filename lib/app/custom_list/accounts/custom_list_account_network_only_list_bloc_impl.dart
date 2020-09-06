import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/custom_list/accounts/custom_list_account_network_only_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:flutter/widgets.dart';

class CustomListAccountNetworkOnlyListBloc extends DisposableOwner
    implements ICustomListAccountNetworkOnlyListBloc {
  final IPleromaListService pleromaListService;
  final ICustomList customList;
  final IStatusRepository statusRepository;

  @override
  IPleromaApi get pleromaApi => pleromaListService;

  CustomListAccountNetworkOnlyListBloc({
    @required this.pleromaListService,
    @required this.customList,
    @required this.statusRepository,
  });

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage(
      {int pageIndex,
      int itemsCountPerPage,
      String minId,
      String maxId}) async {
    var remoteAccounts = await pleromaListService.getListAccounts(
        limit: itemsCountPerPage,
        sinceId: minId,
        maxId: maxId,
        listRemoteId: customList.remoteId);
    return remoteAccounts
        ?.map((remoteAccount) => mapRemoteAccountToLocalAccount(remoteAccount))
        ?.toList();
  }

  @override
  Future addAccounts(List<IAccount> accounts) async {
    await pleromaListService.addAccountsToList(
      listRemoteId: customList.remoteId,
      accountIds: accounts.map((account) => account.remoteId),
    );
  }

  @override
  Future removeAccounts(List<IAccount> accounts) async {

    await pleromaListService.removeAccountsFromList(
      listRemoteId: customList.remoteId,
      accountIds: accounts.map((account) => account.remoteId),
    );

    await statusRepository.clearListStatusesConnection(
        listRemoteId: customList.remoteId);
  }
}
