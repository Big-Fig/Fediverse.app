import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilterCachedListBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IFilter> {
  static IFilterCachedListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFilterCachedListBloc>(context, listen: listen);

  @override
  IPleromaApi get pleromaApi;

  @override
  Future<List<IFilter>> loadLocalItems(
      {@required int limit,
      @required IFilter newerThan,
      @required IFilter olderThan});

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IFilter newerThan,
      @required IFilter olderThan});
}
