import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatWithLastMessageCachedListBloc extends DisposableOwner
    implements ICachedListBloc<IUnifediChatWithLastMessage> {
  static IUnifediChatWithLastMessageCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatWithLastMessageCachedListBloc>(
        context,
        listen: listen,
      );

  Stream<List<IUnifediChatWithLastMessage>> watchLocalItemsNewerThanItem(
    IUnifediChatWithLastMessage? item,
  );
}
