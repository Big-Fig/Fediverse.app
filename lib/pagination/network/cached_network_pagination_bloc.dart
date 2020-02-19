import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/network/cached_network_pagination_model.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class ICachedNetworkPaginationBloc<T> implements IPaginationBloc<T> {
  @override
  Future<CachedNetworkPaginationPage<T>> getPage({@required pageIndex});
}
