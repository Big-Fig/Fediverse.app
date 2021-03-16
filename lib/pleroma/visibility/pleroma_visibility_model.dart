import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

enum PleromaVisibility {
  public,
  unlisted,
  direct,
  list,
  private,
  local,
}

const defaultPleromaVisibility = PleromaVisibility.public;

const _publicPleromaVisibilityJsonValue = "public";
const _localPleromaVisibilityJsonValue = "local";
const _unlistedPleromaVisibilityJsonValue = "unlisted";
const _directPleromaVisibilityJsonValue = "direct";
const _listPleromaVisibilityJsonValue = "list";
const _privatePleromaVisibilityJsonValue = "private";

extension PleromaVisibilityListExtension on List<PleromaVisibility> {
  List<String> toPleromaVisibilityStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension PleromaVisibilityExtension on PleromaVisibility {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaVisibility.public:
        result = _publicPleromaVisibilityJsonValue;
        break;
      case PleromaVisibility.local:
        result = _localPleromaVisibilityJsonValue;
        break;
      case PleromaVisibility.unlisted:
        result = _unlistedPleromaVisibilityJsonValue;
        break;
      case PleromaVisibility.direct:
        result = _directPleromaVisibilityJsonValue;
        break;
      case PleromaVisibility.list:
        result = _listPleromaVisibilityJsonValue;
        break;
      case PleromaVisibility.private:
        result = _privatePleromaVisibilityJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaVisibilityStringExtension on String {
  PleromaVisibility toPleromaVisibility() {
    PleromaVisibility result;

    switch (this) {
      case _publicPleromaVisibilityJsonValue:
        result = PleromaVisibility.public;
        break;
      case _privatePleromaVisibilityJsonValue:
        result = PleromaVisibility.private;
        break;
      case _localPleromaVisibilityJsonValue:
        result = PleromaVisibility.local;
        break;
      case _listPleromaVisibilityJsonValue:
        result = PleromaVisibility.list;
        break;
      case _directPleromaVisibilityJsonValue:
        result = PleromaVisibility.direct;
        break;
      case _unlistedPleromaVisibilityJsonValue:
        result = PleromaVisibility.unlisted;
        break;
      // can't parse, default value
      default:
        result = defaultPleromaVisibility;
        break;
    }

    return result;
  }
}

extension PleromaVisibilityStringListExtension on List<String> {
  List<PleromaVisibility> toPleromaVisibilities() => map(
        (visibilityString) => visibilityString.toPleromaVisibility(),
      ).toList();
}

class PleromaVisibilityTypeConverter
    implements
        JsonConverter<PleromaVisibility, String?>,
        TypeConverter<PleromaVisibility, String?> {
  const PleromaVisibilityTypeConverter();

  @override
  PleromaVisibility fromJson(String? value) =>
      value?.toPleromaVisibility() ?? defaultPleromaVisibility;

  @override
  String? toJson(PleromaVisibility? value) => value?.toJsonValue();

  @override
  PleromaVisibility? mapToDart(String? fromDb) => fromJson(fromDb);

  @override
  String? mapToSql(PleromaVisibility? value) => toJson(value);
}
