import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/account_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAccountNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IAccount>, IAccountListBloc {
  static IAccountNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountNetworkOnlyListBloc>(context, listen: listen);

  @override
  IUnifediApiService get unifediApi;
}
