import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatPaginationBloc
    implements ICachedPleromaPaginationBloc<IConversationChat> {
  static IConversationChatPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatPaginationBloc>(context, listen: listen);
}
