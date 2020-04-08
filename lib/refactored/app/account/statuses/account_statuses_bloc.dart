import 'package:fedi/refactored/app/status/list/cached/status_cached_list_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountStatusesBloc implements IStatusCachedListBloc {
  static IAccountStatusesBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountStatusesBloc>(context, listen: listen);
}
