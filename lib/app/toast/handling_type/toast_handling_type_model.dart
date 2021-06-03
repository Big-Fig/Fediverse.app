import 'package:json_annotation/json_annotation.dart';

enum ToastHandlingType {
  onlyWhenInstanceSelected,
  onlyWhenInstanceNotSelected,
  always,
  never,
}

extension ToastHandlingTypeExtension on ToastHandlingType {
  bool get isEnabledWhenInstanceSelected =>
      this == ToastHandlingType.always ||
      this == ToastHandlingType.onlyWhenInstanceSelected;

  bool get isEnabledWhenInstanceNotSelected =>
      this == ToastHandlingType.always ||
      this == ToastHandlingType.onlyWhenInstanceNotSelected;

  String toJsonValue() {
    String result;

    switch (this) {
      case ToastHandlingType.onlyWhenInstanceSelected:
        result = _onlyWhenInstanceSelectedToastHandlingTypeJsonValue;
        break;
      case ToastHandlingType.onlyWhenInstanceNotSelected:
        result = _onlyWhenInstanceNotSelectedToastHandlingTypeJsonValue;
        break;
      case ToastHandlingType.always:
        result = _alwaysToastHandlingTypeJsonValue;
        break;
      case ToastHandlingType.never:
        result = _neverToastHandlingTypeJsonValue;
        break;
    }

    return result;
  }
}

const _onlyWhenInstanceSelectedToastHandlingTypeJsonValue =
    "onlyWhenInstanceSelected";
const _onlyWhenInstanceNotSelectedToastHandlingTypeJsonValue =
    "onlyWhenInstanceNotSelected";
const _alwaysToastHandlingTypeJsonValue = "always";
const _neverToastHandlingTypeJsonValue = "never";

extension ToastHandlingTypeListExtension on List<ToastHandlingType> {
  List<String> toToastHandlingTypeStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension ToastHandlingTypeStringExtension on String {
  ToastHandlingType toToastHandlingType() {
    ToastHandlingType result;

    switch (this) {
      case _neverToastHandlingTypeJsonValue:
        result = ToastHandlingType.never;
        break;
      case _alwaysToastHandlingTypeJsonValue:
        result = ToastHandlingType.always;
        break;
      case _onlyWhenInstanceNotSelectedToastHandlingTypeJsonValue:
        result = ToastHandlingType.onlyWhenInstanceNotSelected;
        break;
      case _onlyWhenInstanceSelectedToastHandlingTypeJsonValue:
        result = ToastHandlingType.onlyWhenInstanceSelected;
        break;
      // can't parse, default value
      default:
        throw "Invalid ToastHandlingType string ${this}";
    }

    return result;
  }
}

extension ToastHandlingTypeStringListExtension on List<String> {
  List<ToastHandlingType> toPleromaVisibilities() => map(
        (visibilityString) => visibilityString.toToastHandlingType(),
      ).toList();
}

class ToastHandlingTypeTypeConverter
    implements JsonConverter<ToastHandlingType, String> {
  const ToastHandlingTypeTypeConverter();

  @override
  ToastHandlingType fromJson(String value) => value.toToastHandlingType();

  @override
  String toJson(ToastHandlingType value) => value.toJsonValue();
}
