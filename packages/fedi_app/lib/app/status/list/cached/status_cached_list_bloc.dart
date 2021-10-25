import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/status_list_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusCachedListBloc
    implements
        DisposableOwner,
        ICachedListBloc<IStatus>,
        IAsyncInitLoadingBloc,
        IStatusListBloc {
  static IStatusCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusCachedListBloc>(
        context,
        listen: listen,
      );

  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus? item);

  Stream get settingsChangedStream;
}
