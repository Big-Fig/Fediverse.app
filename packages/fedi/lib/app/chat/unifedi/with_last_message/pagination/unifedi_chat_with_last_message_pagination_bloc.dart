import 'package:fedi/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi/app/pagination/cached/cached_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatWithLastMessagePaginationBloc
    implements ICachedUnifediPaginationBloc<IUnifediChatWithLastMessage> {
  static IUnifediChatWithLastMessagePaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatWithLastMessagePaginationBloc>(
        context,
        listen: listen,
      );
}
