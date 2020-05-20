import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatNetworkOnlyListService extends DisposableOwner
    implements IPleromaNetworkOnlyListService<IChat> {
  static IChatNetworkOnlyListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatNetworkOnlyListService>(context, listen: listen);
}
