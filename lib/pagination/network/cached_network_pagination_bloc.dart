import 'package:fedi/pagination/network/cached_network_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:flutter/widgets.dart';

abstract class ICachedNetworkPaginationBloc<
    TPage extends CachedNetworkPaginationPage<TItem>,
    TItem> implements IPaginationBloc<TPage, TItem> {
  @override
  Future<TPage> requestPage({@required pageIndex});
}
