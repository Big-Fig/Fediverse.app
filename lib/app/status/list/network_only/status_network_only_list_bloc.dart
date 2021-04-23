import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IStatus>, IStatusListBloc {
  static IStatusNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusNetworkOnlyListBloc>(context, listen: listen);

  @override
  IPleromaApi get pleromaApi;
}
