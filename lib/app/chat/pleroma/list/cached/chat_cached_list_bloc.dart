import 'package:fedi/app/chat/pleroma/chat_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatCachedListBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IChat> {
  static IChatCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatCachedListBloc>(context, listen: listen);

  Stream<List<IChat>> watchLocalItemsNewerThanItem(IChat item);
}
