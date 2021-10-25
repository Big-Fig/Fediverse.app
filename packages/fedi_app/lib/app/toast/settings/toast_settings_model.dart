import 'package:fedi_app/app/push/settings/push_settings_model.dart';
import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fedi_app/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toast_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'toast_settings_model.g.dart';

@freezed
@HiveType(typeId: -32 + 86)
class ToastSettings
    with _$ToastSettings
    implements IJsonObj, ISettings<ToastSettings> {
  const ToastSettings._();

  const factory ToastSettings({
    @HiveField(3)
    @JsonKey(name: 'push_settings')
        required PushSettings pushSettings,
    @HiveField(4)
    @JsonKey(name: 'handling_type_string')
        required String handlingTypeString,
  }) = _ToastSettings;

  ToastHandlingType get handlingType =>
      handlingTypeString.toToastHandlingType();

  static ToastSettings fromEnum({
    required PushSettings pushSettings,
    required ToastHandlingType handlingType,
  }) =>
      ToastSettings(
        pushSettings: pushSettings,
        handlingTypeString: handlingType.toJsonValue(),
      );

  factory ToastSettings.fromJson(Map<String, dynamic> json) =>
      _$ToastSettingsFromJson(json);
}
