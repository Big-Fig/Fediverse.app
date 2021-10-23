import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IFilterCachedListBloc extends DisposableOwner
    implements ICachedListBloc<IFilter> {
  static IFilterCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFilterCachedListBloc>(
        context,
        listen: listen,
      );

  @override
  IUnifediApiService get unifediApi;

  @override
  Future<List<IFilter>> loadLocalItems({
    required int? limit,
    required IFilter? newerThan,
    required IFilter? olderThan,
  });

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IFilter? newerThan,
    required IFilter? olderThan,
  });
}
