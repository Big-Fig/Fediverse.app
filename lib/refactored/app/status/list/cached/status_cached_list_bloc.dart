import 'package:fedi/refactored/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusCachedListBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IStatus> {
  static IStatusCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IStatusCachedListBloc>(context, listen: listen);

  Future preRefreshAllAction();

  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item);
}
