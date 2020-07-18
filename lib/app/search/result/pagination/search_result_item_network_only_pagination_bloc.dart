import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISearchResultItemNetworkOnlyPaginationBloc
    implements INetworkOnlyPleromaPaginationBloc<ISearchResultItem> {
  static ISearchResultItemNetworkOnlyPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ISearchResultItemNetworkOnlyPaginationBloc>(context,
          listen: listen);
}
