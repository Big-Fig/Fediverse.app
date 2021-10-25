import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/my/domain_block/list/pagination/my_account_domain_block_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/my/domain_block/list/pagination/my_account_domain_block_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountDomainBlockPaginationListBloc
    extends PaginationListBloc<PaginationPage<DomainBlock>, DomainBlock>
    implements IMyAccountDomainBlockPaginationListBloc {
  MyAccountDomainBlockPaginationListBloc({
    required IPaginationBloc<PaginationPage<DomainBlock>, DomainBlock>
        paginationBloc,
    bool loadFromCacheDuringInit = true,
  }) : super(
          paginationBloc: paginationBloc,
          loadFromCacheDuringInit: loadFromCacheDuringInit,
        );

  static MyAccountDomainBlockPaginationListBloc createFromContext(
    BuildContext context, {
    bool loadFromCacheDuringInit = true,
  }) =>
      MyAccountDomainBlockPaginationListBloc(
        paginationBloc: Provider.of<
            IPaginationBloc<PaginationPage<DomainBlock>, DomainBlock>>(
          context,
          listen: false,
        ),
        loadFromCacheDuringInit: loadFromCacheDuringInit,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    bool loadFromCacheDuringInit = true,
  }) =>
      DisposableProvider<IMyAccountDomainBlockPaginationListBloc>(
        create: (context) =>
            MyAccountDomainBlockPaginationListBloc.createFromContext(
          context,
          loadFromCacheDuringInit: loadFromCacheDuringInit,
        ),
        child:
            MyAccountDomainBlockPaginationListBlocProxyProvider(child: child),
      );
}
