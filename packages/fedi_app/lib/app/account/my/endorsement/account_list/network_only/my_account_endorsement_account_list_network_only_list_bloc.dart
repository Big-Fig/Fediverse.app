import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/account_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountEndorsementAccountListNetworkOnlyListBloc
    extends INetworkOnlyListBloc<IAccount> implements IAccountListBloc {
  static IMyAccountEndorsementAccountListNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountEndorsementAccountListNetworkOnlyListBloc>(
        context,
        listen: listen,
      );
}
