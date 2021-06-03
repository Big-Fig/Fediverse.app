import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'toast_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 86)
class ToastSettings implements IJsonObject, ISettings<ToastSettings> {
  @HiveField(3)
  @JsonKey(name: "push_settings")
  final PushSettings pushSettings;

  @HiveField(4)
  @JsonKey(name: "handling_type_string")
  final String handlingTypeString;

  ToastHandlingType get handlingType =>
      handlingTypeString.toToastHandlingType();

  ToastSettings({
    required this.pushSettings,
    required this.handlingTypeString,
  });

  ToastSettings.fromEnum({
    required PushSettings pushSettings,
    required ToastHandlingType handlingType,
  }) : this(
          pushSettings: pushSettings,
          handlingTypeString: handlingType.toJsonValue(),
        );

  static ToastSettings fromJson(Map<String, dynamic> json) =>
      _$ToastSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ToastSettingsToJson(this);

  @override
  ToastSettings clone() => copyWith();

  ToastSettings copyWith({
    PushSettings? pushSettings,
    ToastHandlingType? handlingType,
  }) =>
      ToastSettings.fromEnum(
        pushSettings: pushSettings ?? this.pushSettings,
        handlingType: handlingType ?? this.handlingType,
      );

  @override
  String toString() {
    return 'ToastSettings{'
        'pushSettings: $pushSettings, '
        'handlingType: $handlingType'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToastSettings &&
          runtimeType == other.runtimeType &&
          pushSettings == other.pushSettings &&
          handlingType == other.handlingType;

  @override
  int get hashCode => pushSettings.hashCode ^ handlingType.hashCode;
}
