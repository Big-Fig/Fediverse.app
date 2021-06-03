import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/list/local_only/draft_status_local_only_list_bloc.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DraftStatusLocalOnlyListBloc extends IDraftStatusLocalOnlyListBloc {
  final IDraftStatusRepository draftStatusRepository;

  DraftStatusLocalOnlyListBloc({
    required this.draftStatusRepository,
  }) : super();

  static DraftStatusLocalOnlyListBloc createFromContext(BuildContext context) =>
      DraftStatusLocalOnlyListBloc(
        draftStatusRepository:
            IDraftStatusRepository.of(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IDraftStatusLocalOnlyListBloc>(
      create: (context) =>
          DraftStatusLocalOnlyListBloc.createFromContext(context),
      child: ProxyProvider<IDraftStatusLocalOnlyListBloc, IStatusListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }

  @override
  Future<List<IDraftStatus>> loadItemsFromLocalForPage({
    int? pageIndex,
    int? itemsCountPerPage,
    IDraftStatus? olderThan,
    IDraftStatus? newerThan,
  }) async {
    var statuses = await draftStatusRepository.findAllInAppType(
      filters: null,
      pagination: RepositoryPagination(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: itemsCountPerPage,
      ),
      orderingTerms: [
        DraftStatusRepositoryOrderingTermData.updatedAtDesc,
      ],
    );

    return statuses;
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
