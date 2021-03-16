import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICachedPaginationListBloc<TPage extends CachedPaginationPage<
    TItem?>, TItem>
    implements IPaginationListBloc<TPage, TItem> {
  static ICachedPaginationListBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<ICachedPaginationListBloc>(context, listen: listen);

}
