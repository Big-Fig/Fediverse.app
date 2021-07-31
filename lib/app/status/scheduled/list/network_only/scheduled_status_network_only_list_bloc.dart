import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IScheduledStatus> {
  static IScheduledStatusNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IScheduledStatusNetworkOnlyListBloc>(context, listen: listen);

  @override
  IPleromaApi get pleromaApi;
}
