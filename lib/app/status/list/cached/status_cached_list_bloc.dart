import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusCachedListBloc
    implements
        DisposableOwner,
        IPleromaCachedListBloc<IStatus>,
        IAsyncInitLoadingBloc {
  static IStatusCachedListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusCachedListBloc>(context, listen: listen);

  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item);

  Stream<bool> get settingsChangedStream;
}
