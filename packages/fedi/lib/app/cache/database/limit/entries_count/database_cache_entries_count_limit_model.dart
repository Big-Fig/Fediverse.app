// ignore_for_file: no-magic-number
enum DatabaseCacheEntriesCountByTypeLimitType {
  notSet,
  limit1000,
  limit5000,
  limit10000,
  limit100000,
}

const defaultDatabaseCacheEntriesCountByTypeLimitType =
    DatabaseCacheEntriesCountByTypeLimitType.notSet;

const _notSetDatabaseCacheEntriesCountByTypeLimitTypeJsonValue = 'notSet';
const _limit1000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue = 'limit1000';
const _limit5000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue = 'limit5000';
const _limit10000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue =
    'limit10000';
const _limit100000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue =
    'limit100000';

extension DatabaseCacheEntriesCountByTypeLimitTypeExtension
    on DatabaseCacheEntriesCountByTypeLimitType {
  String toJsonValue() {
    String result;

    switch (this) {
      case DatabaseCacheEntriesCountByTypeLimitType.notSet:
        result = _notSetDatabaseCacheEntriesCountByTypeLimitTypeJsonValue;
        break;
      case DatabaseCacheEntriesCountByTypeLimitType.limit1000:
        result = _limit1000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue;
        break;
      case DatabaseCacheEntriesCountByTypeLimitType.limit5000:
        result = _limit5000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue;
        break;
      case DatabaseCacheEntriesCountByTypeLimitType.limit10000:
        result = _limit10000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue;
        break;
      case DatabaseCacheEntriesCountByTypeLimitType.limit100000:
        result = _limit100000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue;
        break;
    }

    return result;
  }

  int? toCountOrNull() {
    int? count;

    switch (this) {
      case DatabaseCacheEntriesCountByTypeLimitType.notSet:
        count = null;
        break;
      case DatabaseCacheEntriesCountByTypeLimitType.limit1000:
        count = 1000;
        break;
      case DatabaseCacheEntriesCountByTypeLimitType.limit5000:
        count = 5000;
        break;
      case DatabaseCacheEntriesCountByTypeLimitType.limit10000:
        count = 10000;
        break;
      case DatabaseCacheEntriesCountByTypeLimitType.limit100000:
        count = 100000;
        break;
    }

    return count;
  }
}

extension DatabaseCacheEntriesCountByTypeLimitTypeStringExtension on String {
  DatabaseCacheEntriesCountByTypeLimitType
      toDatabaseCacheEntriesCountByTypeLimitType() {
    DatabaseCacheEntriesCountByTypeLimitType result;

    switch (this) {
      case _notSetDatabaseCacheEntriesCountByTypeLimitTypeJsonValue:
        result = DatabaseCacheEntriesCountByTypeLimitType.notSet;
        break;
      case _limit1000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue:
        result = DatabaseCacheEntriesCountByTypeLimitType.limit1000;
        break;
      case _limit5000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue:
        result = DatabaseCacheEntriesCountByTypeLimitType.limit5000;
        break;
      case _limit10000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue:
        result = DatabaseCacheEntriesCountByTypeLimitType.limit10000;
        break;
      case _limit100000DatabaseCacheEntriesCountByTypeLimitTypeJsonValue:
        result = DatabaseCacheEntriesCountByTypeLimitType.limit100000;
        break;
      // cant parse, default value
      default:
        result = defaultDatabaseCacheEntriesCountByTypeLimitType;
        break;
    }

    return result;
  }
}
