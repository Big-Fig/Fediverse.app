import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatMessageCachedListBloc
    implements IDisposable, ICachedListBloc<IPleromaChatMessage> {
  static IPleromaChatMessageCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatMessageCachedListBloc>(
        context,
        listen: listen,
      );

  Stream<List<IPleromaChatMessage>> watchLocalItemsNewerThanItem(
    IPleromaChatMessage? item,
  );
}
