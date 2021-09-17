import 'package:fedi/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

// ignore_for_file: no-magic-number
part 'web_sockets_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 89)
class WebSocketsSettings implements ISettings<WebSocketsSettings> {
  @HiveField(0)
  @JsonKey(name: 'type_string')
  final String handlingTypeString;

  WebSocketsMode get handlingType =>
      handlingTypeString.toWebSocketsMode();

  WebSocketsSettings({
    required this.handlingTypeString,
  });

  WebSocketsSettings.fromEnum({
    required WebSocketsMode handlingType,
  }) : this(
          handlingTypeString: handlingType.toJsonValue(),
        );

  WebSocketsMode get type =>
      handlingTypeString.toWebSocketsMode();

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
    WebSocketsMode? handlingType,
  }) =>
      WebSocketsSettings.fromEnum(
        handlingType: handlingType ?? this.handlingType,
      );

  @override
  String toString() {
    return 'WebSocketsSettings{handlingTypeString: $handlingTypeString}';
  }
}
