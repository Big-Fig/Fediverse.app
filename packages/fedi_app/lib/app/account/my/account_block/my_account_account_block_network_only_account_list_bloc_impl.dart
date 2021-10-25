import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi_app/app/account/list/network_only/account_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc.dart';
import 'package:fedi_app/app/account/repository/account_repository.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountAccountBlockNetworkOnlyAccountListBloc extends DisposableOwner
    implements IMyAccountAccountBlockNetworkOnlyAccountListBloc {
  final IUnifediApiAccountService unifediAuthAccountService;
  final IUnifediApiMyAccountService unifediApiMyAccountService;
  final IAccountRepository accountRepository;

  MyAccountAccountBlockNetworkOnlyAccountListBloc({
    required this.unifediAuthAccountService,
    required this.unifediApiMyAccountService,
    required this.accountRepository,
  });

  @override
  Future<void> removeAccountBlock({
    required IAccount account,
  }) async {
    var accountRelationship = await unifediAuthAccountService.unBlockAccount(
      accountId: account.remoteId,
    );

    var remoteAccount = account
        .copyWithTemp(
          relationship: accountRelationship,
        )
        .toUnifediApiAccount();

    // ignore: avoid-ignoring-return-values
    await accountRepository.upsertInRemoteType(
      remoteAccount,
    );
  }

  @override
  Future<void> addAccountBlock({
    required IAccount account,
  }) async {
    var accountRelationship = await unifediAuthAccountService.blockAccount(
      accountId: account.remoteId,
    );

    var remoteAccount = account
        .copyWithTemp(
          relationship: accountRelationship,
        )
        .toUnifediApiAccount();

    // ignore: avoid-ignoring-return-values
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
    var remoteAccounts = await unifediApiMyAccountService.getMyAccountBlocks(
      pagination: UnifediApiPagination(
        minId: minId,
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
  IUnifediApiService get unifediApi => unifediApiMyAccountService;

  static MyAccountAccountBlockNetworkOnlyAccountListBloc createFromContext(
    BuildContext context,
  ) =>
      MyAccountAccountBlockNetworkOnlyAccountListBloc(
        unifediApiMyAccountService: Provider.of<IUnifediApiMyAccountService>(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(
          context,
          listen: false,
        ),
        unifediAuthAccountService: Provider.of<IUnifediApiAccountService>(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IMyAccountAccountBlockNetworkOnlyAccountListBloc>(
        create:
            MyAccountAccountBlockNetworkOnlyAccountListBloc.createFromContext,
        child: ProxyProvider<IMyAccountAccountBlockNetworkOnlyAccountListBloc,
            IAccountNetworkOnlyListBloc>(
          update: (context, value, previous) => value,
          child: AccountNetworkOnlyListBlocProxyProvider(
            child: ProxyProvider<
                IMyAccountAccountBlockNetworkOnlyAccountListBloc,
                INetworkOnlyListBloc<IAccount>>(
              update: (context, value, previous) => value,
              child: child,
            ),
          ),
        ),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
