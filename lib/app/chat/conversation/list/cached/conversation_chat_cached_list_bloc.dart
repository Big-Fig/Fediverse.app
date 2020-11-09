import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatCachedListBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IConversationChat> {
  static IConversationChatCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatCachedListBloc>(context, listen: listen);

  Stream<List<IConversationChat>> watchLocalItemsNewerThanItem(IConversationChat item);
}
