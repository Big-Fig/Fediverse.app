import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilterCachedListBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IFilter> {
  static IFilterCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFilterCachedListBloc>(
        context,
        listen: listen,
      );

  @override
  IPleromaApi get pleromaApi;

  @override
  Future<List<IFilter>> loadLocalItems({
    required int? limit,
    required IFilter? newerThan,
    required IFilter? olderThan,
  });

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IFilter? newerThan,
    required IFilter? olderThan,
  });
}
