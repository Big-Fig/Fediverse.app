enum FilesCacheAgeLimitType {
  notSet,
  days7,
  days30,
  days90,
  days180,
  days365,
}

const defaultFilesCacheAgeLimitType = FilesCacheAgeLimitType.notSet;

const _notSetFilesCacheAgeLimitTypeJsonValue = "notSet";
const _days7FilesCacheAgeLimitTypeJsonValue = "days7";
const _days30FilesCacheAgeLimitTypeJsonValue = "days30";
const _days90FilesCacheAgeLimitTypeJsonValue = "days90";
const _days180FilesCacheAgeLimitTypeJsonValue = "days180";
const _days365FilesCacheAgeLimitTypeJsonValue = "days365";

extension FilesCacheAgeLimitTypeExtension on FilesCacheAgeLimitType {
  String toJsonValue() {
    String result;

    switch (this) {
      case FilesCacheAgeLimitType.notSet:
        result = _notSetFilesCacheAgeLimitTypeJsonValue;
        break;
      case FilesCacheAgeLimitType.days7:
        result = _days7FilesCacheAgeLimitTypeJsonValue;
        break;
      case FilesCacheAgeLimitType.days30:
        result = _days30FilesCacheAgeLimitTypeJsonValue;
        break;
      case FilesCacheAgeLimitType.days90:
        result = _days90FilesCacheAgeLimitTypeJsonValue;
        break;
      case FilesCacheAgeLimitType.days180:
        result = _days180FilesCacheAgeLimitTypeJsonValue;
        break;
      case FilesCacheAgeLimitType.days365:
        result = _days365FilesCacheAgeLimitTypeJsonValue;
        break;
    }

    return result;
  }

  Duration? toDurationOrNull() {
    Duration? duration;

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
  FilesCacheAgeLimitType toFilesCacheAgeLimitType() {
    FilesCacheAgeLimitType result;

    switch (this) {
      case _notSetFilesCacheAgeLimitTypeJsonValue:
        result = FilesCacheAgeLimitType.notSet;
        break;
      case _days7FilesCacheAgeLimitTypeJsonValue:
        result = FilesCacheAgeLimitType.days7;
        break;
      case _days30FilesCacheAgeLimitTypeJsonValue:
        result = FilesCacheAgeLimitType.days30;
        break;
      case _days90FilesCacheAgeLimitTypeJsonValue:
        result = FilesCacheAgeLimitType.days90;
        break;
      case _days180FilesCacheAgeLimitTypeJsonValue:
        result = FilesCacheAgeLimitType.days180;
        break;
      case _days365FilesCacheAgeLimitTypeJsonValue:
        result = FilesCacheAgeLimitType.days365;
        break;
      // can't parse, default value
      default:
        result = defaultFilesCacheAgeLimitType;
        break;
    }

    return result;
  }
}
