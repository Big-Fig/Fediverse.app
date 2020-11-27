import 'dart:convert';

import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toast_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 86)
class ToastSettings implements IJsonObject, ISettings<ToastSettings> {
  @HiveField(3)
  @JsonKey(name: "push_settings")
  final PushSettings pushSettings;

  ToastSettings({
    @required this.pushSettings,
  });

  factory ToastSettings.fromJson(Map<String, dynamic> json) =>
      _$ToastSettingsFromJson(json);

  factory ToastSettings.fromJsonString(String jsonString) =>
      _$ToastSettingsFromJson(jsonDecode(jsonString));

  static List<ToastSettings> listFromJsonString(String str) =>
      List<ToastSettings>.from(
          json.decode(str).map((x) => ToastSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$ToastSettingsToJson(this);

  String toJsonString() => jsonEncode(_$ToastSettingsToJson(this));

  @override
  ToastSettings clone() => copyWith();

  ToastSettings copyWith({
    PushSettings pushSettings,
  }) => ToastSettings(
      pushSettings: pushSettings ?? this.pushSettings,
    );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToastSettings &&
          runtimeType == other.runtimeType &&
          pushSettings == other.pushSettings;

  @override
  int get hashCode => pushSettings.hashCode;

  @override
  String toString() {
    return 'ToastSettings{pushSettings: $pushSettings}';
  }
}
