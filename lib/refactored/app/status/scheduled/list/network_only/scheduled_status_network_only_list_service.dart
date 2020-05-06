import 'package:fedi/refactored/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusNetworkOnlyListService extends DisposableOwner
    implements IPleromaNetworkOnlyListService<IScheduledStatus> {
  static IScheduledStatusNetworkOnlyListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScheduledStatusNetworkOnlyListService>(context,
          listen: listen);

  @override
  IPleromaApi get pleromaApi;
}
