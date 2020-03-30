
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISearchStatusesTabBloc
    implements INetworkOnlyPaginationBloc<PaginationPage<IStatus>, IStatus> {
  static ISearchStatusesTabBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ISearchStatusesTabBloc>(context, listen: listen);
}
