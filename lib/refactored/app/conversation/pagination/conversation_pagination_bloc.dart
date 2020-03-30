import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationPaginationBloc
    implements ICachedPleromaPaginationBloc<IConversation> {
  static IConversationPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationPaginationBloc>(context, listen: listen);
}
