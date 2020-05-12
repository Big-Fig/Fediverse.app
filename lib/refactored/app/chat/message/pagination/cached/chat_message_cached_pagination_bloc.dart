import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatMessageCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<IChatMessage> {
  static IChatMessageCachedPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatMessageCachedPaginationBloc>(context, listen: listen);
}
