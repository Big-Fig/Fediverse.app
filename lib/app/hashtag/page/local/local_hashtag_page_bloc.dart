import 'package:fedi/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalHashtagPageBloc implements IHashtagPageBloc {
  static ILocalHashtagPageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ILocalHashtagPageBloc>(context, listen: listen);

  IStatusCachedListBloc get statusCachedListBloc;

  IStatusCachedPaginationBloc get statusCachedPaginationBloc;

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      get statusCachedPaginationListWithNewItemsBloc;
}
