import 'package:fedi/app/account/my/domain_block/list/pagination/my_account_domain_block_pagination_list_bloc.dart';
import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountDomainBlockPaginationListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const MyAccountDomainBlockPaginationListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IMyAccountDomainBlockPaginationListBloc,
          IPaginationListBloc<PaginationPage<DomainBlock>, DomainBlock>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IMyAccountDomainBlockPaginationListBloc,
            IPaginationListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
