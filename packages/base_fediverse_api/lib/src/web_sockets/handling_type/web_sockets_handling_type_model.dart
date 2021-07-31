import 'package:json_annotation/json_annotation.dart';

enum WebSocketsHandlingType {
  disabled,
  onlyForeground,
  foregroundAndBackground,
}

const _disabledWebSocketsHandlingTypeJsonValue = 'disabled';
const _onlyForegroundWebSocketsHandlingTypeJsonValue = 'onlyForeground';
const _foregroundAndBackgroundWebSocketsHandlingTypeJsonValue =
    'foregroundAndBackground';

extension WebSocketsHandlingTypeListExtension on List<WebSocketsHandlingType> {
  List<String> toJsonStrings() => map(
        (type) => type.toJsonValue(),
      ).toList();
}

extension WebSocketsHandlingTypeExtension on WebSocketsHandlingType {
  bool get isEnabled => this != WebSocketsHandlingType.disabled;

  String toJsonValue() {
    String result;

    switch (this) {
      case WebSocketsHandlingType.disabled:
        result = _disabledWebSocketsHandlingTypeJsonValue;
        break;
      case WebSocketsHandlingType.onlyForeground:
        result = _onlyForegroundWebSocketsHandlingTypeJsonValue;
        break;
      case WebSocketsHandlingType.foregroundAndBackground:
        result = _foregroundAndBackgroundWebSocketsHandlingTypeJsonValue;
        break;
    }

    return result;
  }
}

extension WebSocketsHandlingTypeStringExtension on String {
  WebSocketsHandlingType toWebSocketsHandlingType() {
    WebSocketsHandlingType result;

    switch (this) {
      case _disabledWebSocketsHandlingTypeJsonValue:
        result = WebSocketsHandlingType.disabled;
        break;
      case _onlyForegroundWebSocketsHandlingTypeJsonValue:
        result = WebSocketsHandlingType.onlyForeground;
        break;
      case _foregroundAndBackgroundWebSocketsHandlingTypeJsonValue:
        result = WebSocketsHandlingType.foregroundAndBackground;
        break;
      default:
        throw 'Invalid WebSocketsHandlingTypeStringExtension $this';
    }

    return result;
  }
}

extension WebSocketsHandlingTypeStringListExtension on List<String> {
  List<WebSocketsHandlingType> toWebSocketsHandlingTypes() => map(
        (visibilityString) => visibilityString.toWebSocketsHandlingType(),
      ).toList();
}

class WebSocketsHandlingTypeTypeConverter
    implements JsonConverter<WebSocketsHandlingType, String> {
  const WebSocketsHandlingTypeTypeConverter();

  @override
  WebSocketsHandlingType fromJson(String value) =>
      value.toWebSocketsHandlingType();

  @override
  String toJson(WebSocketsHandlingType value) => value.toJsonValue();
}
