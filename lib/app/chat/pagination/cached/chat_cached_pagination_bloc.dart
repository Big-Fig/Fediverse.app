import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<IChat> {
  static IChatCachedPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatCachedPaginationBloc>(context, listen: listen);
}
