import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatWithLastMessageCachedListBloc extends DisposableOwner
    implements ICachedListBloc<IPleromaChatWithLastMessage> {
  static IPleromaChatWithLastMessageCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatWithLastMessageCachedListBloc>(
        context,
        listen: listen,
      );

  Stream<List<IPleromaChatWithLastMessage>> watchLocalItemsNewerThanItem(
    IPleromaChatWithLastMessage? item,
  );
}
