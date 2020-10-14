// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_status_database_dao.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$DraftStatusDaoMixin on DatabaseAccessor<AppDatabase> {
  $DbDraftStatusesTable get dbDraftStatuses => attachedDatabase.dbDraftStatuses;
  Selectable<int> countAll() {
    return customSelect('SELECT Count(*) FROM db_draft_statuses;',
            variables: [], readsFrom: {dbDraftStatuses})
        .map((QueryRow row) => row.readInt('Count(*)'));
  }

  Selectable<DbDraftStatus> findById(int id) {
    return customSelect('SELECT * FROM db_draft_statuses WHERE id = :id;',
        variables: [Variable.withInt(id)],
        readsFrom: {dbDraftStatuses}).map(dbDraftStatuses.mapFromRow);
  }

  Selectable<int> countById(int id) {
    return customSelect(
            'SELECT COUNT(*) FROM db_draft_statuses WHERE id = :id;',
            variables: [Variable.withInt(id)],
            readsFrom: {dbDraftStatuses})
        .map((QueryRow row) => row.readInt('COUNT(*)'));
  }

  Future<int> deleteById(int id) {
    return customUpdate(
      'DELETE FROM db_draft_statuses WHERE id = :id;',
      variables: [Variable.withInt(id)],
      updates: {dbDraftStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clear() {
    return customUpdate(
      'DELETE FROM db_draft_statuses',
      variables: [],
      updates: {dbDraftStatuses},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<DbDraftStatus> getAll() {
    return customSelect('SELECT * FROM db_draft_statuses',
        variables: [],
        readsFrom: {dbDraftStatuses}).map(dbDraftStatuses.mapFromRow);
  }
}
