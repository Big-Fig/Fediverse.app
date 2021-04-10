import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/repository/remote/populated_app_remote_database_dao_repository.dart';
import 'package:fedi/app/filter/database/filter_database_dao.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("filter_repository_impl.dart");

class FilterRepository extends PopulatedAppRemoteDatabaseDaoRepository<
    DbFilter,
    DbFilterPopulated,
    IFilter,
    IPleromaFilter,
    int,
    String,
    $DbFiltersTable,
    $DbFiltersTable,
    FilterRepositoryFilters,
    FilterOrderingTermData> implements IFilterRepository {
  @override
  final FilterDao dao;

  FilterRepository({
    required AppDatabase appDatabase,
  }) : dao = appDatabase.filterDao;

  JoinedSelectStatement createQuery({
    required FilterRepositoryFilters? filters,
    required RepositoryPagination<IFilter>? pagination,
    required FilterOrderingTermData? orderingTermData,
  }) {
    _logger.fine(() => "createQuery \n"
        "\t filters=$filters\n"
        "\t pagination=$pagination\n"
        "\t orderingTermData=$orderingTermData");

    var query = dao.startSelectQuery();

    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      dao.addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
    }

    if (filters?.onlyWithContextTypes?.isNotEmpty == true) {
      dao.addContextTypesWhere(
        query,
        filters!.onlyWithContextTypes!,
      );
    }

    if (filters?.notExpired == true) {
      dao.addNotExpiredWhere(query);
    }

    if (orderingTermData != null) {
      dao.orderBy(
        query,
        [orderingTermData],
      );
    }
    var joinQuery = query.join(
      dao.populateFilterJoin(),
    );

    var finalQuery = joinQuery;

    var limit = pagination?.limit;
    if (limit != null) {
      finalQuery.limit(
        limit,
        offset: pagination?.offset,
      );
    }
    return finalQuery;
  }

  //
  // @override
  // Future updateLocalFilterByRemoteFilter({
  //   required IFilter oldLocalFilter,
  //   required IPleromaFilter newRemoteFilter,
  // }) async {
  //   _logger.finer(() => "updateLocalFilterByRemoteFilter \n"
  //       "\t old: $oldLocalFilter \n"
  //       "\t newRemoteFilter: $newRemoteFilter");
  //
  //   await updateByDbIdInDbType(
  //     dbId: oldLocalFilter.localId!,
  //     dbItem: newRemoteFilter.toDbFilter(), batchTransaction: null,
  //   );
  // }
  @override
  DbFilter mapAppItemToDbItem(IFilter appItem) => appItem.toDbFilter();

  @override
  IPleromaFilter mapAppItemToRemoteItem(IFilter appItem) =>
      appItem.toPleromaFilter();

  @override
  DbFilterPopulated mapAppItemToDbPopulatedItem(IFilter appItem) =>
      appItem.toDbFilterPopulated();

  @override
  IFilter mapDbPopulatedItemToAppItem(DbFilterPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbFilterPopulatedWrapper();

  @override
  IPleromaFilter mapDbPopulatedItemToRemoteItem(
          DbFilterPopulated dbPopulatedItem) =>
      dbPopulatedItem.toDbFilterPopulatedWrapper().toPleromaFilter();

  @override
  IFilter mapRemoteItemToAppItem(IPleromaFilter appItem) =>
      appItem.toDbFilterPopulatedWrapper();

  @override
  FilterRepositoryFilters get emptyFilters => FilterRepositoryFilters.empty;

  @override
  List<FilterOrderingTermData> get defaultOrderingTerms =>
      FilterOrderingTermData.defaultTerms;

}

extension DbFilterPopulatedListExtension on List<DbFilterPopulated> {
  List<DbFilterPopulatedWrapper> toDbFilterPopulatedWrapperList() => map(
        (value) => value.toDbFilterPopulatedWrapper(),
      ).toList();
}

extension DbFilterPopulatedExtension on DbFilterPopulated {
  DbFilterPopulatedWrapper toDbFilterPopulatedWrapper() =>
      DbFilterPopulatedWrapper(
        dbFilterPopulated: this,
      );
}

extension DbFilterPopulatedWrapperExtension on DbFilterPopulatedWrapper {
  DbFilter toDbFilter() => dbFilterPopulated.dbFilter;
}
