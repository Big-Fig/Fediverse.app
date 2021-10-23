import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountDomainBlockNetworkOnlyDomainListBloc extends DisposableOwner
    implements IMyAccountDomainBlockNetworkOnlyListBloc {
  final IUnifediApiAccountService pleromaAuthAccountService;
  final IUnifediApiMyAccountService unifediApiMyAccountService;

  MyAccountDomainBlockNetworkOnlyDomainListBloc({
    required this.pleromaAuthAccountService,
    required this.unifediApiMyAccountService,
  });

  @override
  Future<void> removeDomainBlock({required String domain}) async {
    await pleromaAuthAccountService.unBlockDomain(domain: domain);
  }

  @override
  Future<List<DomainBlock>> loadItemsFromRemoteForPage({
    required int pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var remoteDomains = await unifediApiMyAccountService.getMyDomainBlocks(
      pagination: UnifediApiPagination(
        minId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
    );

    return remoteDomains
        .map((remoteDomain) => DomainBlock(remoteDomain))
        .toList();
  }

  @override
  IUnifediApiService get unifediApi => unifediApiMyAccountService;

  static MyAccountDomainBlockNetworkOnlyDomainListBloc createFromContext(
    BuildContext context,
  ) =>
      MyAccountDomainBlockNetworkOnlyDomainListBloc(
        unifediApiMyAccountService: Provider.of<IUnifediApiMyAccountService>(
          context,
          listen: false,
        ),
        pleromaAuthAccountService: Provider.of<IUnifediApiAccountService>(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IMyAccountDomainBlockNetworkOnlyListBloc>(
        create: MyAccountDomainBlockNetworkOnlyDomainListBloc.createFromContext,
        child: ProxyProvider<IMyAccountDomainBlockNetworkOnlyListBloc,
            INetworkOnlyListBloc<DomainBlock>>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
