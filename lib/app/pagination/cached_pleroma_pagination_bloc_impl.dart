import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/app/pagination/cached_pleroma_pagination_bloc.dart';
import 'package:fedi/pagination/network/cached_network_pagination_bloc_impl.dart';

class CachedPleromaPaginationBloc extends CachedNetworkPaginationBloc
    implements ICachedPleromaPaginationBloc {

//  final IPleromaApi pleromaApi;

  CachedNetworkPaginationBloc cachedNetworkPaginationBloc;

  CachedPleromaPaginationBloc.cachePages() : super.cachePages();
}