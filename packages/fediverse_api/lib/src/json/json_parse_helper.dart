import 'package:logging/logging.dart';

final _logger = Logger('json_parse_helper.dart');

abstract class JsonParseHelper {
  static int? intFromJsonOrNullOnError(dynamic json) => fromJsonOrNullOnError(
        json,
        (dynamic json) => json as int?,
      );

  static T? fromJsonOrNullOnError<T>(
    dynamic json,
    T? Function(dynamic json) parser,
  ) {
    T? result;
    if (json == null) {
      result = null;
    } else {
      // hack because backend sometimes returns object in invalid format
      try {
        result = parser(json);
      } on Exception catch (e, stackTrace) {
        _logger.warning(
          () => 'fromJsonOrNullOnError $json',
          e,
          stackTrace,
        );

        result = null;
      }
    }

    return result;
  }

  static String toUTCIsoString(DateTime dateTime) =>
      dateTime.toUtc().toIso8601String();

  static DateTime fromUTCIsoString(String dateTime) =>
      DateTime.parse(dateTime).toLocal();

  static int fromStringToInt(String value) => int.parse(value);

  static String toStringFromInt(int value) => value.toString();
  static String toStringFromAny(dynamic value) => value.toString();
  static String? toStringFromAnyNullable(dynamic value) => value?.toString();
}
