import 'package:fedi_app/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountDomainBlockNetworkOnlyPaginationBloc
    implements INetworkOnlyUnifediPaginationBloc<DomainBlock> {
  static IMyAccountDomainBlockNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountDomainBlockNetworkOnlyPaginationBloc>(
        context,
        listen: listen,
      );
}
