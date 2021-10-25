import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc.dart';
import 'package:fedi_app/app/search/result/search_result_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISearchResultItemNetworkOnlyPaginationBloc
    implements INetworkOnlyUnifediPaginationBloc<ISearchResultItem> {
  static ISearchResultItemNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISearchResultItemNetworkOnlyPaginationBloc>(
        context,
        listen: listen,
      );
}
