import 'package:fedi/enum/enum_values.dart';

enum FilesCacheSizeLimitCountType {
  notSet,
  size50,
  size100,
  size200,
  size500,
  size1000,
}

EnumValues<FilesCacheSizeLimitCountType>
    FilesCacheSizeLimitCountTypeEnumValues = EnumValues({
  "notSet": FilesCacheSizeLimitCountType.notSet,
  "size50": FilesCacheSizeLimitCountType.size50,
  "size100": FilesCacheSizeLimitCountType.size100,
  "size200": FilesCacheSizeLimitCountType.size200,
  "size500": FilesCacheSizeLimitCountType.size500,
  "size10000": FilesCacheSizeLimitCountType.size1000,
});

extension FilesCacheSizeLimitCountTypeExtension
    on FilesCacheSizeLimitCountType {
  String toJsonValue() {
    var type = FilesCacheSizeLimitCountTypeEnumValues.enumToValueMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }

  int toCount() {
    int count;

    switch (this) {
      case FilesCacheSizeLimitCountType.notSet:
        count = null;
        break;
      case FilesCacheSizeLimitCountType.size50:
        count = 50;
        break;
      case FilesCacheSizeLimitCountType.size100:
        count = 100;
        break;
      case FilesCacheSizeLimitCountType.size200:
        count = 200;
        break;
      case FilesCacheSizeLimitCountType.size500:
        count = 500;
        break;
      case FilesCacheSizeLimitCountType.size1000:
        count = 1000;
        break;
    }

    return count;
  }
}

extension FilesCacheSizeLimitCountTypeStringExtension on String {
  FilesCacheSizeLimitCountType toFilesCacheSizeLimitCountType() =>
      FilesCacheSizeLimitCountTypeEnumValues.valueToEnumMap[this];
}

enum FilesCacheAgeLimitType {
  notSet,
  days7,
  days30,
  days90,
  days180,
  days365,
}

EnumValues<FilesCacheAgeLimitType> FilesCacheAgeLimitTypeEnumValues =
    EnumValues({
  "notSet": FilesCacheAgeLimitType.notSet,
  "days7": FilesCacheAgeLimitType.days7,
  "days30": FilesCacheAgeLimitType.days30,
  "days90": FilesCacheAgeLimitType.days90,
  "days180": FilesCacheAgeLimitType.days180,
  "days365": FilesCacheAgeLimitType.days365,
});

extension FilesCacheAgeLimitTypeExtension on FilesCacheAgeLimitType {
  String toJsonValue() {
    var type = FilesCacheAgeLimitTypeEnumValues.enumToValueMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }

  Duration toDuration() {
    Duration duration;

    switch (this) {
      case FilesCacheAgeLimitType.notSet:
        duration = null;
        break;
      case FilesCacheAgeLimitType.days7:
        duration = Duration(days: 7);
        break;
      case FilesCacheAgeLimitType.days30:
        duration = Duration(days: 30);
        break;
      case FilesCacheAgeLimitType.days90:
        duration = Duration(days: 90);
        break;
      case FilesCacheAgeLimitType.days180:
        duration = Duration(days: 180);
        break;
      case FilesCacheAgeLimitType.days365:
        duration = Duration(days: 365);
        break;
    }

    return duration;
  }
}

extension FilesCacheAgeLimitTypeStringExtension on String {
  FilesCacheAgeLimitType toFilesCacheAgeLimitType() =>
      FilesCacheAgeLimitTypeEnumValues.valueToEnumMap[this];
}
