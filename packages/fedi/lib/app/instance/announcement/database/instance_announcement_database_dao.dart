import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/instance/announcement/database/instance_announcement_database_model.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_model.dart';
import 'package:fedi/date/date_utils.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

part 'instance_announcement_database_dao.g.dart';

@UseDao(
  tables: [
    DbInstanceAnnouncements,
  ],
)
class InstanceAnnouncementDao extends PopulatedAppRemoteDatabaseDao<
    DbInstanceAnnouncement,
    DbInstanceAnnouncementPopulated,
    int,
    String,
    $DbInstanceAnnouncementsTable,
    $DbInstanceAnnouncementsTable,
    InstanceAnnouncementRepositoryFilters,
    InstanceAnnouncementOrderingTermData> with _$InstanceAnnouncementDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  InstanceAnnouncementDao(this.db) : super(db);

  void addNotExpiredWhere(
    SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
        query,
  ) {
    var now = DateTime.now();
    var startOfCurrentDay = CustomDateUtils.dayStartOf(now);

    query.where(
      (instanceAnnouncement) =>
          instanceAnnouncement.endsAt.isNull() |
          (instanceAnnouncement.allDay.equals(false) &
              instanceAnnouncement.endsAt.isBiggerThanValue(
                now,
              )) |
          (instanceAnnouncement.allDay.equals(true) &
              instanceAnnouncement.endsAt.isBiggerThanValue(
                startOfCurrentDay,
              )),
    );
  }

  void addAlreadyStartedYetWhere(
    SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
        query,
  ) {
    var now = DateTime.now();
    var startOfCurrentDay = CustomDateUtils.dayStartOf(now);
    var startOfNextDay = startOfCurrentDay.add(const Duration(days: 1));

    query.where(
      (instanceAnnouncement) =>
          instanceAnnouncement.startsAt.isNull() |
          (instanceAnnouncement.allDay.equals(false) &
              instanceAnnouncement.startsAt.isSmallerThanValue(
                now,
              )) |
          (instanceAnnouncement.allDay.equals(true) &
              instanceAnnouncement.startsAt.isSmallerThanValue(
                startOfNextDay,
              )),
    );
  }

  void addNotDismissedWhere(
    SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
        query,
  ) =>
      query.where(
        (instanceAnnouncement) =>
            instanceAnnouncement.read.isNull() |
            instanceAnnouncement.read.equals(false),
      );

  void orderBy(
    SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
        query,
    List<InstanceAnnouncementOrderingTermData> orderTerms,
  ) =>
      query.orderBy(
        orderTerms
            .map(
              (orderTerm) => ($DbInstanceAnnouncementsTable item) {
                Expression expression;
                switch (orderTerm.orderType) {
                  case InstanceAnnouncementOrderType.remoteId:
                    expression = item.remoteId;
                    break;
                  case InstanceAnnouncementOrderType.updatedAt:
                    expression = item.updatedAt;
                    break;
                }

                return OrderingTerm(
                  expression: expression,
                  mode: orderTerm.orderingMode,
                );
              },
            )
            .toList(),
      );

  List<Join<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>>
      populateInstanceAnnouncementJoin() => [];

  @override
  $DbInstanceAnnouncementsTable get table => dbInstanceAnnouncements;

  @override
  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<$DbInstanceAnnouncementsTable,
            DbInstanceAnnouncement>
        query,
    required RepositoryPagination<DbInstanceAnnouncement>? pagination,
    required List<InstanceAnnouncementOrderingTermData>? orderingTerms,
  }) {
    if (pagination?.olderThanItem != null ||
        pagination?.newerThanItem != null) {
      assert(orderingTerms?.length == 1, 'only single term supported');
      var orderingTermData = orderingTerms!.first;
      assert(
        orderingTermData.orderType == InstanceAnnouncementOrderType.remoteId ||
            orderingTermData.orderType ==
                InstanceAnnouncementOrderType.updatedAt,
        'only updatedAt || remoteId supported',
      );

      switch (orderingTermData.orderType) {
        case InstanceAnnouncementOrderType.remoteId:
          addRemoteIdBoundsWhere(
            query,
            maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
            minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
          );
          break;
        case InstanceAnnouncementOrderType.updatedAt:
          addDateTimeBoundsWhere(
            query,
            column: dbInstanceAnnouncements.updatedAt,
            maximumDateTimeExcluding: pagination?.olderThanItem?.updatedAt,
            minimumDateTimeExcluding: pagination?.newerThanItem?.updatedAt,
          );
          break;
      }
    }
  }

  @override
  void addOrderingToQuery({
    required SimpleSelectStatement<$DbInstanceAnnouncementsTable,
            DbInstanceAnnouncement>
        query,
    required List<InstanceAnnouncementOrderingTermData>? orderingTerms,
  }) {
    if (orderingTerms != null) {
      orderBy(
        query,
        orderingTerms,
      );
    }
  }

  @override
  JoinedSelectStatement convertSimpleSelectStatementToJoinedSelectStatement({
    required SimpleSelectStatement<$DbInstanceAnnouncementsTable,
            DbInstanceAnnouncement>
        query,
    required InstanceAnnouncementRepositoryFilters? filters,
  }) =>
      query.join(populateInstanceAnnouncementJoin());

  @override
  DbInstanceAnnouncementPopulated mapTypedResultToDbPopulatedItem(
    TypedResult typedResult,
  ) =>
      typedResult.toDbInstanceAnnouncementPopulated(dao: this);

  @override
  void addFiltersToQuery({
    required SimpleSelectStatement<$DbInstanceAnnouncementsTable,
            DbInstanceAnnouncement>
        query,
    required InstanceAnnouncementRepositoryFilters? filters,
  }) {
    if (filters?.withDismissed != true) {
      addNotDismissedWhere(query);
    }

    if (filters?.withExpired != true) {
      addNotExpiredWhere(query);
    }

    if (filters?.withNotStartedYet != true) {
      addAlreadyStartedYetWhere(query);
    }
  }
}

extension DbInstanceAnnouncementPopulatedTypedResultListExtension
    on List<TypedResult> {
  List<DbInstanceAnnouncementPopulated> toDbInstanceAnnouncementPopulatedList({
    required InstanceAnnouncementDao dao,
  }) =>
      map(
        (item) => item.toDbInstanceAnnouncementPopulated(dao: dao),
      ).toList();
}

extension DbInstanceAnnouncementPopulatedTypedResultExtension on TypedResult {
  DbInstanceAnnouncementPopulated toDbInstanceAnnouncementPopulated({
    required InstanceAnnouncementDao dao,
  }) =>
      DbInstanceAnnouncementPopulated(
        dbInstanceAnnouncement: readTable(dao.db.dbInstanceAnnouncements),
      );
}
