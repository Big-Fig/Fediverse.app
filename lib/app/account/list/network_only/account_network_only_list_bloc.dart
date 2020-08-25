import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IAccount> {
  static IAccountNetworkOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAccountNetworkOnlyListBloc>(context, listen: listen);

  @override
  IPleromaApi get pleromaApi;
}
