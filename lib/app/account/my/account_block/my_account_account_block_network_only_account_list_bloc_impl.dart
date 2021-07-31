import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountAccountBlockNetworkOnlyAccountListBloc extends DisposableOwner
    implements IMyAccountAccountBlockNetworkOnlyAccountListBloc {
  final IPleromaApiAuthAccountService pleromaAuthAccountService;
  final IPleromaApiMyAccountService pleromaMyAccountService;
  final IAccountRepository accountRepository;

  MyAccountAccountBlockNetworkOnlyAccountListBloc({
    required this.pleromaAuthAccountService,
    required this.pleromaMyAccountService,
    required this.accountRepository,
  });

  @override
  Future removeAccountBlock({
    required IAccount account,
  }) async {
    var accountRelationship = await pleromaAuthAccountService.unBlockAccount(
      accountRemoteId: account.remoteId,
    );

    var remoteAccount = account
        .copyWith(
          pleromaRelationship: accountRelationship,
        )
        .toPleromaApiAccount();

    await accountRepository.upsertInRemoteType(
      remoteAccount,
    );
  }

  @override
  Future addAccountBlock({
    required IAccount account,
  }) async {
    var accountRelationship = await pleromaAuthAccountService.blockAccount(
      accountRemoteId: account.remoteId,
    );

    var remoteAccount = account
        .copyWith(
          pleromaRelationship: accountRelationship,
        )
        .toPleromaApiAccount();

    await accountRepository.upsertInRemoteType(
      remoteAccount,
    );
  }

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage({
    required int pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var remoteAccounts = await pleromaMyAccountService.getAccountBlocks(
      pagination: PleromaApiPaginationRequest(
        sinceId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
    );

    await accountRepository.upsertAllInRemoteType(
      remoteAccounts,
      // dont need batch because we have only one transaction
      batchTransaction: null,
    );

    return remoteAccounts
        .map(
          (remoteAccount) => remoteAccount.toDbAccountWrapper(),
        )
        .toList();
  }

  @override
  IPleromaApi get pleromaApi => pleromaMyAccountService;

  static MyAccountAccountBlockNetworkOnlyAccountListBloc createFromContext(
    BuildContext context,
  ) =>
      MyAccountAccountBlockNetworkOnlyAccountListBloc(
        pleromaMyAccountService: Provider.of<IPleromaApiMyAccountService>(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(
          context,
          listen: false,
        ),
        pleromaAuthAccountService: Provider.of<IPleromaApiAuthAccountService>(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
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
  Uri? get remoteInstanceUriOrNull => null;
}
