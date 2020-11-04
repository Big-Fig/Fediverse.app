import 'package:fedi/app/chat/pleroma/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatWithLastMessageCachedBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IChatWithLastMessage> {
  static IChatWithLastMessageCachedBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatWithLastMessageCachedBloc>(context, listen: listen);

  Stream<List<IChatWithLastMessage>> watchLocalItemsNewerThanItem(
      IChatWithLastMessage item);
}
