import 'package:fedi/enum/enum_values.dart';

enum ToastHandlingType {
  onlyWhenInstanceSelected,
  onlyWhenInstanceNotSelected,
  always,
}

extension ToastHandlingTypeJsonValueExtension on ToastHandlingType {
  String toJsonValue() => _ToastHandlingTypeEnumValues.enumToValueMap[this];
}

extension ToastHandlingTypeStringExtension on String {
  ToastHandlingType toToastHandlingType() {
    var type = _ToastHandlingTypeEnumValues.valueToEnumMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }
}

EnumValues<ToastHandlingType> _ToastHandlingTypeEnumValues = EnumValues(
  {
    "onlyWhenInstanceSelected": ToastHandlingType.onlyWhenInstanceSelected,
    "onlyWhenInstanceNotSelected":
        ToastHandlingType.onlyWhenInstanceNotSelected,
    "always": ToastHandlingType.always,
  },
);

extension ToastHandlingTypeExtension on ToastHandlingType {
  bool get isEnabledWhenInstanceSelected =>
      this == ToastHandlingType.always ||
      this == ToastHandlingType.onlyWhenInstanceSelected;

  bool get isEnabledWhenInstanceNotSelected =>
      this == ToastHandlingType.always ||
      this == ToastHandlingType.onlyWhenInstanceNotSelected;
}
