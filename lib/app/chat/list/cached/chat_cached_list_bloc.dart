import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatCachedBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IChat> {
  static IChatCachedBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatCachedBloc>(context, listen: listen);

  Stream<List<IChat>> watchLocalItemsNewerThanItem(IChat item);
}
