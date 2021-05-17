// ignore_for_file: no-magic-number
enum DatabaseCacheAgeLimitType {
  notSet,
  days7,
  days30,
  days90,
  days180,
  days365,
}


const defaultDatabaseCacheAgeLimitType =
    DatabaseCacheAgeLimitType.notSet;

const _notSetDatabaseCacheAgeLimitTypeJsonValue = 'notSet';
const _days7DatabaseCacheAgeLimitTypeJsonValue = 'days7';
const _days30DatabaseCacheAgeLimitTypeJsonValue = 'days30';
const _days90DatabaseCacheAgeLimitTypeJsonValue = 'days90';
const _days180DatabaseCacheAgeLimitTypeJsonValue = 'days180';
const _days365DatabaseCacheAgeLimitTypeJsonValue = 'days365';

extension DatabaseCacheAgeLimitTypeExtension on DatabaseCacheAgeLimitType {
  String toJsonValue() {
    String result;

    switch (this) {
      case DatabaseCacheAgeLimitType.notSet:
        result = _notSetDatabaseCacheAgeLimitTypeJsonValue;
        break;
      case DatabaseCacheAgeLimitType.days7:
        result = _days7DatabaseCacheAgeLimitTypeJsonValue;
        break;
      case DatabaseCacheAgeLimitType.days30:
        result = _days30DatabaseCacheAgeLimitTypeJsonValue;
        break;
      case DatabaseCacheAgeLimitType.days90:
        result = _days90DatabaseCacheAgeLimitTypeJsonValue;
        break;
      case DatabaseCacheAgeLimitType.days180:
        result = _days180DatabaseCacheAgeLimitTypeJsonValue;
        break;
      case DatabaseCacheAgeLimitType.days365:
        result = _days365DatabaseCacheAgeLimitTypeJsonValue;
        break;
    }

    return result;
  }

  Duration? toDurationOrNull() {
    Duration? duration;

    switch (this) {
      case DatabaseCacheAgeLimitType.notSet:
        duration = null;
        break;
      case DatabaseCacheAgeLimitType.days7:
        duration = Duration(days: 7);
        break;
      case DatabaseCacheAgeLimitType.days30:
        duration = Duration(days: 30);
        break;
      case DatabaseCacheAgeLimitType.days90:
        duration = Duration(days: 90);
        break;
      case DatabaseCacheAgeLimitType.days180:
        duration = Duration(days: 180);
        break;
      case DatabaseCacheAgeLimitType.days365:
        duration = Duration(days: 365);
        break;
    }

    return duration;
  }
}

extension DatabaseCacheAgeLimitTypeStringExtension on String {
  DatabaseCacheAgeLimitType toDatabaseCacheAgeLimitType() {
    DatabaseCacheAgeLimitType result;

    switch (this) {
      case _notSetDatabaseCacheAgeLimitTypeJsonValue:
        result = DatabaseCacheAgeLimitType.notSet;
        break;
      case _days7DatabaseCacheAgeLimitTypeJsonValue:
        result = DatabaseCacheAgeLimitType.days7;
        break;
      case _days30DatabaseCacheAgeLimitTypeJsonValue:
        result = DatabaseCacheAgeLimitType.days30;
        break;
      case _days90DatabaseCacheAgeLimitTypeJsonValue:
        result = DatabaseCacheAgeLimitType.days90;
        break;
      case _days180DatabaseCacheAgeLimitTypeJsonValue:
        result = DatabaseCacheAgeLimitType.days180;
        break;
      case _days365DatabaseCacheAgeLimitTypeJsonValue:
        result = DatabaseCacheAgeLimitType.days365;
        break;
      // cant parse, default value
      default:
        result = defaultDatabaseCacheAgeLimitType;
        break;
    }

    return result;
  }
}
