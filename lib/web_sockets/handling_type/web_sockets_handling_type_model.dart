import 'package:fedi/enum/enum_values.dart';

enum WebSocketsHandlingType {
  disabled,
  onlyForeground,
  foregroundAndBackground
}

extension WebSocketsHandlingTypeJsonValueExtension on WebSocketsHandlingType {
  String toJsonValue() =>
      _WebSocketsHandlingTypeEnumValues.enumToValueMap[this];
}

extension WebSocketsHandlingTypeStringExtension on String {
  WebSocketsHandlingType toWebSocketsHandlingType() {
    var type = _WebSocketsHandlingTypeEnumValues.valueToEnumMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }
}

EnumValues<WebSocketsHandlingType> _WebSocketsHandlingTypeEnumValues =
    EnumValues(
  {
    "disabled": WebSocketsHandlingType.disabled,
    "onlyForeground": WebSocketsHandlingType.onlyForeground,
    "foregroundAndBackground":
        WebSocketsHandlingType.foregroundAndBackground,
  },
);
