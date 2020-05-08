import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatMessageCachedListBloc
    implements Disposable, IPleromaCachedListBloc<IChatMessage> {
  static IChatMessageCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatMessageCachedListBloc>(context, listen: listen);

  Stream<List<IChatMessage>> watchLocalItemsNewerThanItem(IChatMessage item);
}
