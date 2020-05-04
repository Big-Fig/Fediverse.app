import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/list/cached/cached_list_service.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationCachedListService extends DisposableOwner
    implements IPleromaCachedListService<IConversation> {
  static IConversationCachedListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationCachedListService>(context, listen: listen);

  Stream<List<IConversation>> watchLocalItemsNewerThanItem(IConversation item);
}
