import 'dart:convert';

import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/enum/enum_values.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_sockets_settings_model.g.dart';

enum WebSocketsSettingsType {
  disabled,
  onlyForCurrentScreen,
  currentScreenAndAllIndicators
}

extension WebSocketsSettingsTypeJsonValueExtension on WebSocketsSettingsType {
  String toJsonValue() => _webSocketsSettingsTypeEnumValues.enumToValueMap[this];
}

extension WebSocketsSettingsTypeStringExtension on String {
  WebSocketsSettingsType toPleromaVisibility() {
    var type = _webSocketsSettingsTypeEnumValues.valueToEnumMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }
}

EnumValues<WebSocketsSettingsType> _webSocketsSettingsTypeEnumValues =
    EnumValues({
  "disabled": WebSocketsSettingsType.disabled,
  "onlyForCurrentScreen": WebSocketsSettingsType.onlyForCurrentScreen,
  "currentScreenAndAllIndicators":
      WebSocketsSettingsType.currentScreenAndAllIndicators,
});

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 86)
class WebSocketsSettings implements ISettings<WebSocketsSettings> {
  @HiveField(0)
  @JsonKey(name: "type_string")
  final String typeString;

  WebSocketsSettings({
    @required this.typeString,
  });

  WebSocketsSettingsType get type =>
      _webSocketsSettingsTypeEnumValues.valueToEnumMap[typeString];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebSocketsSettings &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;

  factory WebSocketsSettings.fromJson(Map<String, dynamic> json) =>
      _$WebSocketsSettingsFromJson(json);

  factory WebSocketsSettings.fromJsonString(String jsonString) =>
      _$WebSocketsSettingsFromJson(jsonDecode(jsonString));

  static List<WebSocketsSettings> listFromJsonString(String str) =>
      List<WebSocketsSettings>.from(
          json.decode(str).map((x) => WebSocketsSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$WebSocketsSettingsToJson(this);

  String toJsonString() => jsonEncode(_$WebSocketsSettingsToJson(this));

  @override
  WebSocketsSettings clone() => copyWith();

  WebSocketsSettings copyWith({
    String typeString,
  }) =>
      WebSocketsSettings(
        typeString: typeString ?? this.typeString,
      );
}
