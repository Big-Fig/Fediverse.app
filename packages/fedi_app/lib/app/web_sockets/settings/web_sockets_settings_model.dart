import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_sockets_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'web_sockets_settings_model.g.dart';

@freezed
@HiveType(typeId: -32 + 89)
class WebSocketsSettings
    with _$WebSocketsSettings
    implements ISettings<WebSocketsSettings> {
  const WebSocketsSettings._();

  const factory WebSocketsSettings({
    @HiveField(0)
    @JsonKey(name: 'type_string')
        required String handlingTypeString,
  }) = _WebSocketsSettings;

  WebSocketsMode get handlingType =>
      WebSocketsMode.fromStringValue(handlingTypeString);

  static WebSocketsSettings fromEnum({
    required WebSocketsMode handlingType,
  }) =>
      WebSocketsSettings(
        handlingTypeString: handlingType.stringValue,
      );

  WebSocketsMode get type => WebSocketsMode.fromStringValue(handlingTypeString);

  factory WebSocketsSettings.fromJson(Map<String, dynamic> json) =>
      _$WebSocketsSettingsFromJson(json);
}
