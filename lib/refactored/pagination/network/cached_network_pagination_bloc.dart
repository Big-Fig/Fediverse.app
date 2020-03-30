import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';

abstract class ICachedNetworkPaginationBloc<
    TPage extends CachedNetworkPaginationPage<TItem>,
    TItem> implements IPaginationBloc<TPage, TItem> {
}
