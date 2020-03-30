import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';

abstract class ICachedPaginationBloc<
    TPage extends CachedPaginationPage<TItem>,
    TItem> implements IPaginationBloc<TPage, TItem> {}
