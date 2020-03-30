import 'package:fedi/refactored/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';

abstract class ICachedPleromaPaginationBloc<TItem>
    implements
        ICachedPaginationBloc<CachedPaginationPage<TItem>,
            TItem> {}
