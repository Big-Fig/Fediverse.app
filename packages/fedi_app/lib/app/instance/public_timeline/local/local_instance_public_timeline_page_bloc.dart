import 'package:fedi_app/app/instance/public_timeline/instance_public_timeline_page_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalInstancePublicTimelinePageBloc
    implements IInstancePublicTimelinePageBloc {
  static ILocalInstancePublicTimelinePageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ILocalInstancePublicTimelinePageBloc>(
        context,
        listen: listen,
      );

  IStatusCachedListBloc get statusCachedListBloc;

  IStatusCachedPaginationBloc get statusCachedPaginationBloc;

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      get statusCachedPaginationListWithNewItemsBloc;
}
