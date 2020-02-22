import 'package:fedi/app/pagination/cached_pleroma_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinePaginationBloc
    implements ICachedPleromaPaginationBloc<IStatus> {
  static ITimelinePaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelinePaginationBloc>(context, listen: listen);
}
