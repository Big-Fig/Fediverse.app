import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatWithLastMessageCachedBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IPleromaChatWithLastMessage> {
  static IPleromaChatWithLastMessageCachedBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaChatWithLastMessageCachedBloc>(context, listen: listen);

  Stream<List<IPleromaChatWithLastMessage>> watchLocalItemsNewerThanItem(
      IPleromaChatWithLastMessage item);
}
