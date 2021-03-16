import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/pleroma/account/auth/pleroma_auth_account_service.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountAccountMuteNetworkOnlyAccountListBloc extends DisposableOwner
    implements IMyAccountAccountMuteNetworkOnlyAccountListBloc {
  final IPleromaAuthAccountService pleromaAuthAccountService;
  final IPleromaMyAccountService pleromaMyAccountService;
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
        .toPleromaAccount();

    await accountRepository.upsertRemoteAccount(
      pleromaAccount,
      conversationRemoteId: null,
      chatRemoteId: null,
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
        .toPleromaAccount();

    await accountRepository.upsertRemoteAccount(
      pleromaAccount,
      conversationRemoteId: null,
      chatRemoteId: null,
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
      pagination: PleromaPaginationRequest(
        sinceId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
    );

    await accountRepository.upsertRemoteAccounts(
      remoteAccounts,
      conversationRemoteId: null,
      chatRemoteId: null,
    );
    return remoteAccounts.toDbAccountWrappers();
  }

  @override
  IPleromaApi get pleromaApi => pleromaMyAccountService;

  static MyAccountAccountMuteNetworkOnlyAccountListBloc createFromContext(
          BuildContext context) =>
      MyAccountAccountMuteNetworkOnlyAccountListBloc(
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
        ) as IPleromaAuthAccountService,
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
        .toPleromaAccount();

    await accountRepository.upsertRemoteAccount(
      pleromaAccount,
      conversationRemoteId: null,
      chatRemoteId: null,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
