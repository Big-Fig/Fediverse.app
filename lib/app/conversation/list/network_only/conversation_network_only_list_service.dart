import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationNetworkOnlyListService extends DisposableOwner
    implements IPleromaNetworkOnlyListService<IConversation> {
  static IConversationNetworkOnlyListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationNetworkOnlyListService>(context, listen: listen);
}
