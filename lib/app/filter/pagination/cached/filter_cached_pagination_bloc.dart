import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilterCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<IFilter> {
  static IFilterCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFilterCachedPaginationBloc>(context, listen: listen);
}
