import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';

abstract class INetworkOnlyPaginationBloc<TPage extends PaginationPage<TItem>,
    TItem> implements IPaginationBloc<TPage, TItem> {}
