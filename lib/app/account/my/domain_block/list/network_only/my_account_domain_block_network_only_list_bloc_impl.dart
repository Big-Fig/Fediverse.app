import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
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
        pleromaMyAccountService: Provider.of<IPleromaApiMyAccountService>(
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
