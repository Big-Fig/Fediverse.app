import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatMessageCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<IPleromaChatMessage> {
  static IPleromaChatMessageCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatMessageCachedPaginationBloc>(
        context,
        listen: listen,
      );
}
