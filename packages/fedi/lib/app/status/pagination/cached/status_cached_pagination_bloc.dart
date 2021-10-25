import 'package:fedi/app/pagination/cached/cached_unifedi_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusCachedPaginationBloc
    implements ICachedUnifediPaginationBloc<IStatus> {
  static IStatusCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusCachedPaginationBloc>(
        context,
        listen: listen,
      );
}
