import 'package:fedi/enum/enum_values.dart';

enum DatabaseCacheAgeLimitType {
  notSet,
  days7,
  days30,
  days90,
  days180,
  days365,
}

EnumValues<DatabaseCacheAgeLimitType> DatabaseCacheAgeLimitTypeEnumValues =
    EnumValues({
  "notSet": DatabaseCacheAgeLimitType.notSet,
  "days7": DatabaseCacheAgeLimitType.days7,
  "days30": DatabaseCacheAgeLimitType.days30,
  "days90": DatabaseCacheAgeLimitType.days90,
  "days180": DatabaseCacheAgeLimitType.days180,
  "days365": DatabaseCacheAgeLimitType.days365,
});

extension DatabaseCacheAgeLimitTypeExtension on DatabaseCacheAgeLimitType {
  String toJsonValue() {
    var type = DatabaseCacheAgeLimitTypeEnumValues.enumToValueMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }

  Duration toDuration() {
    Duration duration;

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
  DatabaseCacheAgeLimitType toDatabaseCacheAgeLimitType() =>
      DatabaseCacheAgeLimitTypeEnumValues.valueToEnumMap[this];
}

enum DatabaseCacheEntriesCountByTypeLimitType {
  notSet,
  limit1000,
  limit5000,
  limit10000,
  limit100000,
}

EnumValues<DatabaseCacheEntriesCountByTypeLimitType>
    DatabaseCacheEntriesCountByTypeLimitTypeEnumValues = EnumValues({
  "notSet": DatabaseCacheEntriesCountByTypeLimitType.notSet,
  "limit1000": DatabaseCacheEntriesCountByTypeLimitType.limit1000,
  "limit5000": DatabaseCacheEntriesCountByTypeLimitType.limit5000,
  "limit10000": DatabaseCacheEntriesCountByTypeLimitType.limit10000,
  "limit100000": DatabaseCacheEntriesCountByTypeLimitType.limit100000,
});

extension DatabaseCacheEntriesCountByTypeLimitTypeExtension
    on DatabaseCacheEntriesCountByTypeLimitType {
  String toJsonValue() {
    var type =
        DatabaseCacheEntriesCountByTypeLimitTypeEnumValues.enumToValueMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }

  int toCount() {
    int count;

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
      toDatabaseCacheEntriesCountByTypeLimitType() =>
          DatabaseCacheEntriesCountByTypeLimitTypeEnumValues
              .valueToEnumMap[this];
}
