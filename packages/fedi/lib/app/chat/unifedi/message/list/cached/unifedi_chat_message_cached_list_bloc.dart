import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatMessageCachedListBloc
    implements IDisposable, ICachedListBloc<IUnifediChatMessage> {
  static IUnifediChatMessageCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatMessageCachedListBloc>(
        context,
        listen: listen,
      );

  Stream<List<IUnifediChatMessage>> watchLocalItemsNewerThanItem(
    IUnifediChatMessage? item,
  );
}
