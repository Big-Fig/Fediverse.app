import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatMessageCachedListBloc
    implements IDisposable, IPleromaCachedListBloc<IChatMessage> {
  static IChatMessageCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatMessageCachedListBloc>(context, listen: listen);

  Stream<List<IChatMessage>> watchLocalItemsNewerThanItem(IChatMessage item);
}
