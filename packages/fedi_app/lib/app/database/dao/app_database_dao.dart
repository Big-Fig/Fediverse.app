import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/database/dao/database_dao.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:moor/moor.dart';

abstract class AppDatabaseDao<
        DbItem extends DataClass,
        DbId,
        TableDsl extends Table,
        TableInfoDsl extends TableInfo<TableDsl, DbItem>,
        Filters,
        OrderingTerm extends RepositoryOrderingTerm>
    extends DatabaseDao<DbItem, DbId, TableDsl, TableInfoDsl> {
  AppDatabaseDao(AppDatabase db) : super(db);

  void addNewerOlderDbItemPagination({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required RepositoryPagination<DbItem>? pagination,
    required List<OrderingTerm>? orderingTerms,
  });

  void addFiltersToQuery({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required Filters? filters,
  });

  void addOrderingToQuery({
    required SimpleSelectStatement<TableDsl, DbItem> query,
    required List<OrderingTerm>? orderingTerms,
  });
}
