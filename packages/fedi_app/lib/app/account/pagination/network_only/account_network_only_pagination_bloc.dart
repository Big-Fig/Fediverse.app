import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountNetworkOnlyPaginationBloc
    implements INetworkOnlyUnifediPaginationBloc<IAccount> {
  static IAccountNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountNetworkOnlyPaginationBloc>(context, listen: listen);
}
