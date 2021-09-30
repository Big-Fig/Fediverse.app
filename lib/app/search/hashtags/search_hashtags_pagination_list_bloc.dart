import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchHashtagsPaginationListBloc
    extends PaginationListBloc<PaginationPage<IHashtag>, IHashtag> {
  final ISearchInputBloc searchInputBloc;

  SearchHashtagsPaginationListBloc({
    required this.searchInputBloc,
    required IPaginationBloc<PaginationPage<IHashtag>, IHashtag> paginationBloc,
  }) : super(paginationBloc: paginationBloc) {
    searchInputBloc.confirmedSearchTermStream.listen(
      (newText) {
        refreshWithController();
      },
    ).disposeWith(this);
  }

  static SearchHashtagsPaginationListBloc createFromContext(
    BuildContext context,
  ) =>
      SearchHashtagsPaginationListBloc(
        paginationBloc:
            Provider.of<IPaginationBloc<PaginationPage<IHashtag>, IHashtag>>(
          context,
          listen: false,
        ),
        searchInputBloc: ISearchInputBloc.of(context, listen: false),
      );
}
