import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<IPleromaChat> {
  static IPleromaChatCachedPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaChatCachedPaginationBloc>(context, listen: listen);
}
