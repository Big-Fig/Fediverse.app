import 'package:fedi/refactored/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationNetworkOnlyListService extends DisposableOwner
    implements IPleromaNetworkOnlyListService<INotification> {
  static INotificationNetworkOnlyListService of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<INotificationNetworkOnlyListService>(context, listen: listen);

  IPleromaApi get pleromaApi;


}
