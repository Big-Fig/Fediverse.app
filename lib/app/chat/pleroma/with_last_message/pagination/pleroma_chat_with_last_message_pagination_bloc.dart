import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatWithLastMessagePaginationBloc
    implements ICachedPleromaPaginationBloc<IPleromaChatWithLastMessage> {
  static IPleromaChatWithLastMessagePaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatWithLastMessagePaginationBloc>(
        context,
        listen: listen,
      );
}
