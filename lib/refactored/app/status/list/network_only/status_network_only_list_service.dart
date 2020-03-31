import 'package:fedi/refactored/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusNetworkOnlyListService extends DisposableOwner
    implements IPleromaNetworkOnlyListService<IStatus> {
  static IStatusNetworkOnlyListService of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<IStatusNetworkOnlyListService>(context, listen: listen);

  IPleromaApi get pleromaApi;


}
