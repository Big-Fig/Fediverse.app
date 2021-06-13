import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceDirectoryAccountListNetworkOnlyListBloc
    extends INetworkOnlyListBloc<IAccount> implements IAccountListBloc {
  static IInstanceDirectoryAccountListNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceDirectoryAccountListNetworkOnlyListBloc>(
        context,
        listen: listen,
      );
}
