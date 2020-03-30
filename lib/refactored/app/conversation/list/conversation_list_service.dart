import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationListService extends DisposableOwner {
  static IConversationListService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IConversationListService>(context, listen: listen);

  IPleromaApi get pleromaApi;

  Future<List<IConversation>> loadLocalItems(
      {@required int limit,
        @required IConversation newerThanConversation,
        @required IConversation olderThanConversation});

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
        @required IConversation newerThanConversation,
        @required IConversation olderThanConversation});
}
