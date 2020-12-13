// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$FilterDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbFiltersTable get dbFilters => attachedDatabase.dbFilters;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_filters;',
        variables: [],
        readsFrom: {dbFilters}).map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_filters WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbFilters},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<int> countById(int id) {
    return customSelect('SELECT COUNT(*) FROM db_filters WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbFilters}).map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_filters',
      variables: [],
      updates: {dbFilters},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbFilter> getAll() {
    return customSelect('SELECT * FROM db_filters',
        variables: [], readsFrom: {dbFilters}).map(dbFilters.mapFromRow);
  }

  Selectable<int> findLocalIdByRemoteId(String remoteId) {
    return customSelect(
        'SELECT id FROM db_filters WHERE remote_id = :remoteId;',
        variables: [Variable.withString(remoteId)],
        readsFrom: {dbFilters}).map((QueryRow row) => row.readInt('id'));
  }
}
