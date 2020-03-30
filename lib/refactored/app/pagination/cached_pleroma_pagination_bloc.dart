import 'package:fedi/refactored/pagination/network/cached_network_pagination_bloc.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';

abstract class ICachedPleromaPaginationBloc<TItem>
    implements
        ICachedNetworkPaginationBloc<CachedNetworkPaginationPage<TItem>,
            TItem> {}
