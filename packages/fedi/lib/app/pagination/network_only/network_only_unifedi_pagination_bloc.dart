import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';

abstract class INetworkOnlyUnifediPaginationBloc<TItem>
    implements INetworkOnlyPaginationBloc<PaginationPage<TItem>, TItem> {}
