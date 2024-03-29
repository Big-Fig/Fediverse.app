import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/status/draft/draft_status_model.dart';
import 'package:fedi_app/app/status/draft/list/local_only/draft_status_local_only_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DraftStatusPaginationListBloc<TPage extends PaginationPage<IDraftStatus>>
    extends PaginationListBloc<TPage, IDraftStatus> {
  final IDraftStatusLocalOnlyListBloc draftStatusLocalListService;

  DraftStatusPaginationListBloc({
    required this.draftStatusLocalListService,
    required IPaginationBloc<TPage, IDraftStatus> paginationBloc,
  }) : super(paginationBloc: paginationBloc);

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<
          IPaginationListBloc<PaginationPage<IDraftStatus>, IDraftStatus>>(
        create: (context) => DraftStatusPaginationListBloc(
          draftStatusLocalListService:
              IDraftStatusLocalOnlyListBloc.of(context, listen: false),
          paginationBloc: Provider.of<
              IPaginationBloc<PaginationPage<IDraftStatus>, IDraftStatus>>(
            context,
            listen: false,
          ),
        ),
        child: child,
      );
}
