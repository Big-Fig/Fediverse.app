import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusPaginationBloc
    implements ICachedPleromaPaginationBloc<IStatus> {
  static IStatusPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IStatusPaginationBloc>(context, listen: listen);
}
