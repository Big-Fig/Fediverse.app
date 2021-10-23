import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchStatusesPaginationListBloc
    extends PaginationListBloc<PaginationPage<IStatus>, IStatus> {
  final ISearchInputBloc searchInputBloc;

  SearchStatusesPaginationListBloc({
    required this.searchInputBloc,
    required IPaginationBloc<PaginationPage<IStatus>, IStatus> paginationBloc,
  }) : super(paginationBloc: paginationBloc) {
    searchInputBloc.confirmedSearchTermStream.listen(
      (newText) {
        refreshWithController();
      },
    ).disposeWith(this);
  }

  static SearchStatusesPaginationListBloc createFromContext(
    BuildContext context,
  ) =>
      SearchStatusesPaginationListBloc(
        paginationBloc:
            Provider.of<IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
          context,
          listen: false,
        ),
        searchInputBloc: ISearchInputBloc.of(context, listen: false),
      );
}
