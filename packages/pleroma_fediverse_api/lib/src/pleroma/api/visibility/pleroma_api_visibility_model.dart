import 'package:json_annotation/json_annotation.dart';

enum PleromaApiVisibility {
  public,
  unlisted,
  direct,
  list,
  private,
  local,
}

const defaultPleromaApiVisibility = PleromaApiVisibility.public;

const _publicPleromaApiVisibilityJsonValue = 'public';
const _localPleromaApiVisibilityJsonValue = 'local';
const _unlistedPleromaApiVisibilityJsonValue = 'unlisted';
const _directPleromaApiVisibilityJsonValue = 'direct';
const _listPleromaApiVisibilityJsonValue = 'list';
const _privatePleromaApiVisibilityJsonValue = 'private';

extension PleromaApiVisibilityListExtension on List<PleromaApiVisibility> {
  List<String> toPleromaApiVisibilityStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension PleromaApiVisibilityExtension on PleromaApiVisibility {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaApiVisibility.public:
        result = _publicPleromaApiVisibilityJsonValue;
        break;
      case PleromaApiVisibility.local:
        result = _localPleromaApiVisibilityJsonValue;
        break;
      case PleromaApiVisibility.unlisted:
        result = _unlistedPleromaApiVisibilityJsonValue;
        break;
      case PleromaApiVisibility.direct:
        result = _directPleromaApiVisibilityJsonValue;
        break;
      case PleromaApiVisibility.list:
        result = _listPleromaApiVisibilityJsonValue;
        break;
      case PleromaApiVisibility.private:
        result = _privatePleromaApiVisibilityJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaApiVisibilityStringExtension on String {
  PleromaApiVisibility toPleromaApiVisibility() {
    PleromaApiVisibility result;

    switch (this) {
      case _publicPleromaApiVisibilityJsonValue:
        result = PleromaApiVisibility.public;
        break;
      case _privatePleromaApiVisibilityJsonValue:
        result = PleromaApiVisibility.private;
        break;
      case _localPleromaApiVisibilityJsonValue:
        result = PleromaApiVisibility.local;
        break;
      case _listPleromaApiVisibilityJsonValue:
        result = PleromaApiVisibility.list;
        break;
      case _directPleromaApiVisibilityJsonValue:
        result = PleromaApiVisibility.direct;
        break;
      case _unlistedPleromaApiVisibilityJsonValue:
        result = PleromaApiVisibility.unlisted;
        break;
      // cant parse, default value
      default:
        result = defaultPleromaApiVisibility;
        break;
    }

    return result;
  }
}

class PleromaApiVisibilityTypeConverter
    implements JsonConverter<PleromaApiVisibility, String> {
  const PleromaApiVisibilityTypeConverter();

  @override
  PleromaApiVisibility fromJson(String? value) =>
      value?.toPleromaApiVisibility() ?? defaultPleromaApiVisibility;

  @override
  String toJson(PleromaApiVisibility? value) =>
      value?.toJsonValue() ?? defaultPleromaApiVisibility.toJsonValue();

  @override
  PleromaApiVisibility? mapToDart(String? fromDb) => fromJson(fromDb);

  @override
  String? mapToSql(PleromaApiVisibility? value) => toJson(value);
}
