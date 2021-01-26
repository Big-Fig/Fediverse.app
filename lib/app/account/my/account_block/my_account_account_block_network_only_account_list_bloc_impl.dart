import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/auth/pleroma_auth_account_service.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountAccountBlockNetworkOnlyAccountListBloc extends DisposableOwner
    implements IMyAccountAccountBlockNetworkOnlyAccountListBloc {
  final IPleromaAuthAccountService pleromaAuthAccountService;
  final IPleromaMyAccountService pleromaMyAccountService;
  final IAccountRepository accountRepository;

  MyAccountAccountBlockNetworkOnlyAccountListBloc({
    @required this.pleromaAuthAccountService,
    @required this.pleromaMyAccountService,
    @required this.accountRepository,
  });

  @override
  Future removeAccountBlock({@required IAccount account}) async {
    var accountRelationship = await pleromaAuthAccountService.unBlockAccount(
        accountRemoteId: account.remoteId);

    var remoteAccount = mapLocalAccountToRemoteAccount(
      account.copyWith(pleromaRelationship: accountRelationship),
    );

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: null, chatRemoteId: null);
  }

  @override
  Future addAccountBlock({@required IAccount account}) async {
    var accountRelationship = await pleromaAuthAccountService.blockAccount(
        accountRemoteId: account.remoteId);

    var remoteAccount = mapLocalAccountToRemoteAccount(
      account.copyWith(pleromaRelationship: accountRelationship),
    );

    await accountRepository.upsertRemoteAccount(remoteAccount,
        conversationRemoteId: null, chatRemoteId: null);
  }

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage({
    @required int pageIndex,
    int itemsCountPerPage,
    String minId,
    String maxId,
  }) async {
    var remoteAccounts = await pleromaMyAccountService.getAccountBlocks(
      pagination: PleromaPaginationRequest(
        sinceId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
    );

    await accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: null, chatRemoteId: null);
    return remoteAccounts
        .map((remoteAccount) => mapRemoteAccountToLocalAccount(remoteAccount))
        .toList();
  }

  @override
  IPleromaApi get pleromaApi => pleromaMyAccountService;

  static MyAccountAccountBlockNetworkOnlyAccountListBloc createFromContext(
          BuildContext context) =>
      MyAccountAccountBlockNetworkOnlyAccountListBloc(
        pleromaMyAccountService: IPleromaMyAccountService.of(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(
          context,
          listen: false,
        ),
        pleromaAuthAccountService: IPleromaAccountService.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
  }) {
    return DisposableProvider<IMyAccountAccountBlockNetworkOnlyAccountListBloc>(
      create: (context) =>
          MyAccountAccountBlockNetworkOnlyAccountListBloc.createFromContext(
        context,
      ),
      child: ProxyProvider<IMyAccountAccountBlockNetworkOnlyAccountListBloc,
          IAccountNetworkOnlyListBloc>(
        update: (context, value, previous) => value,
        child: AccountNetworkOnlyListBlocProxyProvider(
          child: ProxyProvider<IMyAccountAccountBlockNetworkOnlyAccountListBloc,
              INetworkOnlyListBloc<IAccount>>(
            update: (context, value, previous) => value,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri get remoteInstanceUriOrNull => null;
}
