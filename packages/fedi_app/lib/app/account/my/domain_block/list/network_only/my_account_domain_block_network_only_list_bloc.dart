import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountDomainBlockNetworkOnlyListBloc
    implements IDisposable, INetworkOnlyListBloc<DomainBlock> {
  static IMyAccountDomainBlockNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountDomainBlockNetworkOnlyListBloc>(
        context,
        listen: listen,
      );

  Future<void> removeDomainBlock({required String domain});
}
