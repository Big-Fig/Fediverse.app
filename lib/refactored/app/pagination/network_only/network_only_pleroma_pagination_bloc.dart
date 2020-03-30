import 'package:fedi/refactored/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';

abstract class INetworkOnlyPleromaPaginationBloc<TItem>
    implements INetworkOnlyPaginationBloc<PaginationPage<TItem>, TItem> {}
