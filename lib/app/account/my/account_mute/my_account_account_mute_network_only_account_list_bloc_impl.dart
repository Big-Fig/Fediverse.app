import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountAccountMuteNetworkOnlyAccountListBloc extends DisposableOwner
    implements IMyAccountAccountMuteNetworkOnlyAccountListBloc {
  final IPleromaApiAuthAccountService pleromaAuthAccountService;
  final IPleromaApiMyAccountService pleromaMyAccountService;
  final IAccountRepository accountRepository;

  MyAccountAccountMuteNetworkOnlyAccountListBloc({
    required this.pleromaAuthAccountService,
    required this.pleromaMyAccountService,
    required this.accountRepository,
  });

  @override
  Future removeAccountMute({required IAccount? account}) async {
    var accountRelationship = await pleromaAuthAccountService.unMuteAccount(
      accountRemoteId: account!.remoteId,
    );

    var pleromaAccount = account
        .copyWith(
          pleromaRelationship: accountRelationship,
        )
        .toPleromaApiAccount();

    await accountRepository.upsertInRemoteType(
      pleromaAccount,
    );
  }

  @override
  Future addAccountMute({required IAccount account}) async {
    var accountRelationship = await pleromaAuthAccountService.muteAccount(
      accountRemoteId: account.remoteId,
      notifications: false,
      expireDurationInSeconds: null,
    );

    var pleromaAccount = account
        .copyWith(
          pleromaRelationship: accountRelationship,
        )
        .toPleromaApiAccount();

    await accountRepository.upsertInRemoteType(
      pleromaAccount,
    );
  }

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage({
    required int pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var remoteAccounts = await pleromaMyAccountService.getAccountMutes(
      pagination: PleromaApiPaginationRequest(
        sinceId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
      withRelationship: false,
    );

    await accountRepository.upsertAllInRemoteType(
      remoteAccounts,
      // dont need batch because we have only one transaction
      batchTransaction: null,
    );

    return remoteAccounts.toDbAccountPopulatedWrappers();
  }

  @override
  IPleromaApi get pleromaApi => pleromaMyAccountService;

  static MyAccountAccountMuteNetworkOnlyAccountListBloc createFromContext(
    BuildContext context,
  ) =>
      MyAccountAccountMuteNetworkOnlyAccountListBloc(
        pleromaMyAccountService: IPleromaApiMyAccountService.of(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(
          context,
          listen: false,
        ),
        pleromaAuthAccountService: IPleromaApiAuthAccountService.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IMyAccountAccountMuteNetworkOnlyAccountListBloc>(
      create: (context) =>
          MyAccountAccountMuteNetworkOnlyAccountListBloc.createFromContext(
        context,
      ),
      child: ProxyProvider<IMyAccountAccountMuteNetworkOnlyAccountListBloc,
          IAccountNetworkOnlyListBloc>(
        update: (context, value, previous) => value,
        child: AccountNetworkOnlyListBlocProxyProvider(
          child: ProxyProvider<IMyAccountAccountMuteNetworkOnlyAccountListBloc,
              INetworkOnlyListBloc<IAccount>>(
            update: (context, value, previous) => value,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Future changeAccountMute({
    required IAccount? account,
    required bool notifications,
    required Duration? duration,
  }) async {
    await pleromaAuthAccountService.unMuteAccount(
      accountRemoteId: account!.remoteId,
    );

    var accountRelationship = await pleromaAuthAccountService.muteAccount(
      accountRemoteId: account.remoteId,
      notifications: notifications,
      expireDurationInSeconds: duration?.totalSeconds,
    );

    var pleromaAccount = account
        .copyWith(
          pleromaRelationship: accountRelationship,
        )
        .toPleromaApiAccount();

    await accountRepository.upsertInRemoteType(
      pleromaAccount,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
