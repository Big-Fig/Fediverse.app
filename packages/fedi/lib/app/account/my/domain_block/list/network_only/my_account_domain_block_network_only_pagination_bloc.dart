import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountDomainBlockNetworkOnlyPaginationBloc
    implements INetworkOnlyPleromaPaginationBloc<DomainBlock> {
  static IMyAccountDomainBlockNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountDomainBlockNetworkOnlyPaginationBloc>(
        context,
        listen: listen,
      );
}
