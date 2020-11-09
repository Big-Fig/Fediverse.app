import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatCachedListBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IPleromaChat> {
  static IPleromaChatCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaChatCachedListBloc>(context, listen: listen);

  Stream<List<IPleromaChat>> watchLocalItemsNewerThanItem(IPleromaChat item);
}
