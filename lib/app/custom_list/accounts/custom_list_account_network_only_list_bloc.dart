import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomListAccountNetworkOnlyListBloc
    extends INetworkOnlyListBloc<IAccount> {
  static ICustomListAccountNetworkOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICustomListAccountNetworkOnlyListBloc>(context,
          listen: listen);

  Future addAccounts(List<IAccount> accounts);

  Future removeAccounts(List<IAccount> accounts);
}