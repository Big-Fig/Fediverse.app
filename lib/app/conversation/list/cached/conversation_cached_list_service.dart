import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationCachedListService extends DisposableOwner
    implements IPleromaCachedListBloc<IConversation> {
  static IConversationCachedListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationCachedListService>(context, listen: listen);

  Stream<List<IConversation>> watchLocalItemsNewerThanItem(IConversation item);
}
