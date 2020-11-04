
import 'package:fedi/app/chat/pleroma/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatWithLastMessagePaginationBloc
    implements ICachedPleromaPaginationBloc<IChatWithLastMessage> {
  static IChatWithLastMessagePaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatWithLastMessagePaginationBloc>(context, listen: listen);
}
