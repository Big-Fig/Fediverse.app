import 'package:fedi/enum/enum_values.dart';

enum WebSocketsHandlingType {
  disabled,
  onlyForCurrentScreen,
  currentScreenAndAllIndicators
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
    "onlyForCurrentScreen": WebSocketsHandlingType.onlyForCurrentScreen,
    "currentScreenAndAllIndicators":
        WebSocketsHandlingType.currentScreenAndAllIndicators,
  },
);
