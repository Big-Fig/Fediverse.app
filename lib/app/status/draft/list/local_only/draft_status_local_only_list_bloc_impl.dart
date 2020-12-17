import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/list/local_only/draft_status_local_only_list_bloc.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';

class DraftStatusLocalOnlyListBloc extends IDraftStatusLocalOnlyListBloc {
  final IDraftStatusRepository draftStatusRepository;

  DraftStatusLocalOnlyListBloc({@required this.draftStatusRepository})
      : super();

  static DraftStatusLocalOnlyListBloc createFromContext(BuildContext context) =>
      DraftStatusLocalOnlyListBloc(
        draftStatusRepository:
            IDraftStatusRepository.of(context, listen: false),
      );

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<IDraftStatusLocalOnlyListBloc>(
      create: (context) =>
          DraftStatusLocalOnlyListBloc.createFromContext(context),
      child: child,
    );
  }

  @override
  Future<List<IDraftStatus>> loadItemsFromLocalForPage({
    int pageIndex,
    int itemsCountPerPage,
    IDraftStatus olderThan,
    IDraftStatus newerThan,
  }) async {
    var statuses = await draftStatusRepository.getDraftStatuses(
      olderThan: olderThan,
      newerThan: newerThan,
      limit: itemsCountPerPage,
      offset: null,
      orderingTermData: DraftStatusOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: DraftStatusRepositoryOrderType.updatedAt),
    );

    return statuses;
  }
}
