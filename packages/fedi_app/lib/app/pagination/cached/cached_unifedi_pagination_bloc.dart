import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';

abstract class ICachedUnifediPaginationBloc<TItem>
    implements ICachedPaginationBloc<CachedPaginationPage<TItem>, TItem> {}
