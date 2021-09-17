import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<INotification> {
  static INotificationNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<INotificationNetworkOnlyListBloc>(context, listen: listen);

  @override
  IUnifediApiService get unifediApi;
}
