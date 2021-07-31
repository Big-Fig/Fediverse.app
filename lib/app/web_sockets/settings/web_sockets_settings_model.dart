import 'package:fedi/app/settings/settings_model.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'web_sockets_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 89)
class WebSocketsSettings implements ISettings<WebSocketsSettings> {
  @HiveField(0)
  @JsonKey(name: 'type_string')
  final String handlingTypeString;

  WebSocketsHandlingType get handlingType =>
      handlingTypeString.toWebSocketsHandlingType();

  WebSocketsSettings({
    required this.handlingTypeString,
  });

  WebSocketsSettings.fromEnum({
    required WebSocketsHandlingType handlingType,
  }) : this(
          handlingTypeString: handlingType.toJsonValue(),
        );

  WebSocketsHandlingType get type =>
      handlingTypeString.toWebSocketsHandlingType();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebSocketsSettings &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;

  static WebSocketsSettings fromJson(Map<String, dynamic> json) =>
      _$WebSocketsSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WebSocketsSettingsToJson(this);

  @override
  WebSocketsSettings clone() => copyWith();

  WebSocketsSettings copyWith({
    WebSocketsHandlingType? handlingType,
  }) =>
      WebSocketsSettings.fromEnum(
        handlingType: handlingType ?? this.handlingType,
      );

  @override
  String toString() {
    return 'WebSocketsSettings{handlingTypeString: $handlingTypeString}';
  }
}
