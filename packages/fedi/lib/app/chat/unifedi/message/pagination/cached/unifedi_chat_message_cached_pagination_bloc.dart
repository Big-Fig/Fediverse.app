import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/pagination/cached/cached_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatMessageCachedPaginationBloc
    implements ICachedUnifediPaginationBloc<IUnifediChatMessage> {
  static IUnifediChatMessageCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatMessageCachedPaginationBloc>(
        context,
        listen: listen,
      );
}
