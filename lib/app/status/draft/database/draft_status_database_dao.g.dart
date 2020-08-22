// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_status_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$DraftStatusDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbDraftStatusesTable get dbDraftStatuses => db.dbDraftStatuses;
  Selectable<int> countAllQuery() {
    return customSelectQuery('SELECT Count(*) FROM db_draft_statuses;',
            variables: [], readsFrom: {dbDraftStatuses})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Future<List<int>> countAll() {
    return countAllQuery().get();
  }

  Stream<List<int>> watchCountAll() {
    return countAllQuery().watch();
  }

  DbDraftStatus _rowToDbDraftStatus(QueryRow row) {
    return DbDraftStatus(
      id: row.readInt('id'),
      updatedAt: row.readDateTime('updated_at'),
      data: $DbDraftStatusesTable.$converter0.mapToDart(row.readString('data')),
    );
  }

  Selectable<DbDraftStatus> findByIdQuery(int id) {
    return customSelectQuery('SELECT * FROM db_draft_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbDraftStatuses}).map(_rowToDbDraftStatus);
  }

  Future<List<DbDraftStatus>> findById(int id) {
    return findByIdQuery(id).get();
  }

  Stream<List<DbDraftStatus>> watchFindById(int id) {
    return findByIdQuery(id).watch();
  }

  Selectable<int> countByIdQuery(int id) {
    return customSelectQuery(
            'SELECT COUNT(*) FROM db_draft_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbDraftStatuses})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<List<int>> countById(int id) {
    return countByIdQuery(id).get();
  }

  Stream<List<int>> watchCountById(int id) {
    return countByIdQuery(id).watch();
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_draft_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbDraftStatuses},
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_draft_statuses',
      variables: [],
      updates: {dbDraftStatuses},
    );
  }

  Selectable<DbDraftStatus> getAllQuery() {
    return customSelectQuery('SELECT * FROM db_draft_statuses',
        variables: [], readsFrom: {dbDraftStatuses}).map(_rowToDbDraftStatus);
  }

  Future<List<DbDraftStatus>> getAll() {
    return getAllQuery().get();
  }

  Stream<List<DbDraftStatus>> watchGetAll() {
    return getAllQuery().watch();
  }
}
