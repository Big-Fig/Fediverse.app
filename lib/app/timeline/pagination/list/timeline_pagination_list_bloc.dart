import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelinePaginationListBloc
    implements IPaginationListBloc<CachedNetworkPaginationPage<IStatus>, IStatus> {
  static ITimelinePaginationListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelinePaginationListBloc>(context, listen: listen);

}
