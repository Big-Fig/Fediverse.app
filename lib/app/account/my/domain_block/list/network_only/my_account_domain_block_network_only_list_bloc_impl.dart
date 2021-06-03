import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountDomainBlockNetworkOnlyDomainListBloc extends DisposableOwner
    implements IMyAccountDomainBlockNetworkOnlyListBloc {
  final IPleromaApiAuthAccountService pleromaAuthAccountService;
  final IPleromaApiMyAccountService pleromaMyAccountService;

  MyAccountDomainBlockNetworkOnlyDomainListBloc({
    required this.pleromaAuthAccountService,
    required this.pleromaMyAccountService,
  });

  @override
  Future removeDomainBlock({required String domain}) async {
    await pleromaAuthAccountService.unBlockDomain(domain: domain);
  }

  @override
  Future<List<DomainBlock>> loadItemsFromRemoteForPage({
    required int pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var remoteDomains = await pleromaMyAccountService.getDomainBlocks(
      pagination: PleromaApiPaginationRequest(
        sinceId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
    );

    return remoteDomains
        .map((remoteDomain) => DomainBlock(remoteDomain))
        .toList();
  }

  @override
  IPleromaApi get pleromaApi => pleromaMyAccountService;

  static MyAccountDomainBlockNetworkOnlyDomainListBloc createFromContext(
    BuildContext context,
  ) =>
      MyAccountDomainBlockNetworkOnlyDomainListBloc(
        pleromaMyAccountService: IPleromaApiMyAccountService.of(
          context,
          listen: false,
        ),
        pleromaAuthAccountService: IPleromaApiAccountService.of(
          context,
          listen: false,
        ) as IPleromaApiAuthAccountService,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IMyAccountDomainBlockNetworkOnlyListBloc>(
      create: (context) =>
          MyAccountDomainBlockNetworkOnlyDomainListBloc.createFromContext(
        context,
      ),
      child: ProxyProvider<IMyAccountDomainBlockNetworkOnlyListBloc,
          INetworkOnlyListBloc<DomainBlock>>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
