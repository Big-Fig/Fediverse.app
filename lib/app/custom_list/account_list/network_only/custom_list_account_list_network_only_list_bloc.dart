import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomListAccountListNetworkOnlyListBloc
    extends INetworkOnlyListBloc<IAccount> {
  static ICustomListAccountListNetworkOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICustomListAccountListNetworkOnlyListBloc>(context,
          listen: listen);
}
