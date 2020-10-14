import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountDomainBlockPaginationListBloc
    implements IPaginationListBloc<PaginationPage<DomainBlock>, DomainBlock> {
  static IMyAccountDomainBlockPaginationListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMyAccountDomainBlockPaginationListBloc>(context,
          listen: listen);
}
