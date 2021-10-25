import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/status_list_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IStatusNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IStatus>, IStatusListBloc {
  static IStatusNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusNetworkOnlyListBloc>(context, listen: listen);

  @override
  IUnifediApiService get unifediApi;
}
