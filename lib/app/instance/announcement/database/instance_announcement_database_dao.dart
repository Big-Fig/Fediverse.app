import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/database/dao/remote/populated_app_remote_database_dao.dart';
import 'package:fedi/app/instance/announcement/database/instance_announcement_database_model.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_model.dart';
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

  // SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
  //     addContextTypesWhere(
  //   SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
  //       query,
  //   List<MastodonApiInstanceAnnouncementContextType> contextTypes,
  // ) {
  //   assert(contextTypes.isNotEmpty);
  //
  //   var contextTypesStrings = contextTypes
  //       .map(
  //         (visibility) => '${visibility.toJsonValue()}',
  //       )
  //       .toList();
  //
  //   return query
  //     ..where(
  //       (instanceAnnouncement) => CustomExpression<bool>(
  //         contextTypesStrings
  //             .map((type) => "db_instanceAnnouncements.context LIKE '%$type%'")
  //             .join(' OR '),
  //       ),
  //     );
  // }
  //
  // SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
  //     addNotExpiredWhere(
  //   SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
  //       query,
  // ) =>
  //         query
  //           ..where(
  //             (instanceAnnouncement) =>
  //                 instanceAnnouncement.expiresAt.isNull() |
  //                 instanceAnnouncement.expiresAt.isBiggerThanValue(
  //                   DateTime.now(),
  //                 ),
  //           );

  SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
      orderBy(
    SimpleSelectStatement<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement>
        query,
    List<InstanceAnnouncementOrderingTermData> orderTerms,
  ) =>
          query
            ..orderBy(orderTerms
                .map((orderTerm) => (item) {
                      var expression;
                      switch (orderTerm.orderType) {
                        case InstanceAnnouncementOrderType.remoteId:
                          expression = item.remoteId;
                          break;
                      }

                      return OrderingTerm(
                        expression: expression,
                        mode: orderTerm.orderingMode,
                      );
                    })
                .toList());

  List<Join<Table, DataClass>> populateInstanceAnnouncementJoin() {
    return [];
  }

  @override
  $DbInstanceAnnouncementsTable get table => dbInstanceAnnouncements;

  // @override
  // void addInstanceAnnouncementsToQuery({
  //   required SimpleSelectStatement<$DbInstanceAnnouncementsTable,
  //           DbInstanceAnnouncement>
  //       query,
  //   required InstanceAnnouncementRepositoryFilters? instanceAnnouncements,
  // }) {
  //   if (instanceAnnouncements?.onlyWithContextTypes?.isNotEmpty == true) {
  //     addContextTypesWhere(
  //       query,
  //       instanceAnnouncements!.onlyWithContextTypes!,
  //     );
  //   }
  //
  //   if (instanceAnnouncements?.notExpired == true) {
  //     addNotExpiredWhere(query);
  //   }
  // }

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
      assert(orderingTerms?.length == 1);
      var orderingTermData = orderingTerms!.first;
      assert(
        orderingTermData.orderType == InstanceAnnouncementOrderType.remoteId,
      );
      addRemoteIdBoundsWhere(
        query,
        maximumRemoteIdExcluding: pagination?.olderThanItem?.remoteId,
        minimumRemoteIdExcluding: pagination?.newerThanItem?.remoteId,
      );
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
  JoinedSelectStatement<Table, DataClass>
      convertSimpleSelectStatementToJoinedSelectStatement({
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
    // TODO: implement addFiltersToQuery
  }
}

extension DbInstanceAnnouncementPopulatedTypedResultListExtension
    on List<TypedResult> {
  List<DbInstanceAnnouncementPopulated> toDbInstanceAnnouncementPopulatedList({
    required InstanceAnnouncementDao dao,
  }) {
    return map(
      (item) => item.toDbInstanceAnnouncementPopulated(dao: dao),
    ).toList();
  }
}

extension DbInstanceAnnouncementPopulatedTypedResultExtension on TypedResult {
  DbInstanceAnnouncementPopulated toDbInstanceAnnouncementPopulated({
    required InstanceAnnouncementDao dao,
  }) {
    return DbInstanceAnnouncementPopulated(
      dbInstanceAnnouncement: readTable(dao.db.dbInstanceAnnouncements),
    );
  }
}
