import 'dart:convert';

import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_sockets_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 89)
class WebSocketsSettings implements ISettings<WebSocketsSettings> {
  @HiveField(0)
  @JsonKey(name: "type_string")
  final String? typeString;

  WebSocketsSettings({
    required this.typeString,
  });

  WebSocketsHandlingType? get type => typeString?.toWebSocketsHandlingType();

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
        json.decode(str).map((x) => WebSocketsSettings.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$WebSocketsSettingsToJson(this);

  String toJsonString() => jsonEncode(_$WebSocketsSettingsToJson(this));

  @override
  WebSocketsSettings clone() => copyWith();

  WebSocketsSettings copyWith({
    String? typeString,
  }) =>
      WebSocketsSettings(
        typeString: typeString ?? this.typeString,
      );
}
