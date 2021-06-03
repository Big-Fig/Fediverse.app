import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/my/follow_request/my_account_follow_request_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountFollowRequestNetworkOnlyAccountListBloc extends DisposableOwner
    implements IMyAccountFollowRequestNetworkOnlyAccountListBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaApiMyAccountService pleromaMyAccountService;
  final IAccountRepository accountRepository;
  final INotificationRepository notificationRepository;

  MyAccountFollowRequestNetworkOnlyAccountListBloc({
    required this.myAccountBloc,
    required this.pleromaMyAccountService,
    required this.accountRepository,
    required this.notificationRepository,
  });

  @override
  Future acceptFollowRequest({
    required IAccount account,
  }) async {
    var accountRelationship = await pleromaMyAccountService.acceptFollowRequest(
      accountRemoteId: account.remoteId,
    );

    await _processFollowRequestAction(
      account,
      accountRelationship,
    );
  }

  Future _processFollowRequestAction(
    IAccount account,
    IPleromaApiAccountRelationship accountRelationship,
  ) async {
    var pleromaAccount = account
        .copyWith(
          pleromaRelationship: accountRelationship,
        )
        .toPleromaApiAccount();

    await notificationRepository.batch((batch) {
      notificationRepository.dismissFollowRequestNotificationsFromAccount(
        account: account,
        batchTransaction: batch,
      );
      accountRepository.upsertInRemoteTypeBatch(
        pleromaAccount,
        batchTransaction: batch,
      );
    });

    await myAccountBloc.decreaseFollowingRequestCount();
  }

  @override
  Future rejectFollowRequest({
    required IAccount account,
  }) async {
    var accountRelationship = await pleromaMyAccountService.rejectFollowRequest(
      accountRemoteId: account.remoteId,
    );

    await _processFollowRequestAction(
      account,
      accountRelationship,
    );
  }

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage({
    required int pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var remoteAccounts = await pleromaMyAccountService.getFollowRequests(
      pagination: PleromaApiPaginationRequest(
        sinceId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
    );

    await accountRepository.upsertAllInRemoteType(
      remoteAccounts,
      batchTransaction: null,
    );
    return remoteAccounts
        .map(
          (pleromaAccount) => pleromaAccount.toDbAccountWrapper(),
        )
        .toList();
  }

  @override
  IPleromaApi get pleromaApi => pleromaMyAccountService;

  static MyAccountFollowRequestNetworkOnlyAccountListBloc createFromContext(
    BuildContext context,
  ) =>
      MyAccountFollowRequestNetworkOnlyAccountListBloc(
        pleromaMyAccountService: IPleromaApiMyAccountService.of(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(
          context,
          listen: false,
        ),
        myAccountBloc: IMyAccountBloc.of(
          context,
          listen: false,
        ),
        notificationRepository: INotificationRepository.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<
        IMyAccountFollowRequestNetworkOnlyAccountListBloc>(
      create: (context) =>
          MyAccountFollowRequestNetworkOnlyAccountListBloc.createFromContext(
        context,
      ),
      child: ProxyProvider<IMyAccountFollowRequestNetworkOnlyAccountListBloc,
          IAccountNetworkOnlyListBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IMyAccountFollowRequestNetworkOnlyAccountListBloc,
            INetworkOnlyListBloc<IAccount>>(
          update: (context, value, previous) => value,
          child: AccountNetworkOnlyListBlocProxyProvider(
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
