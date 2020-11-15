import 'dart:convert';

import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toast_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 86)
class ToastSettings implements IJsonObject, ISettings<ToastSettings> {
  @HiveField(0)
  @JsonKey(name: "notification_for_mention")
  final bool notificationForMention;
  @HiveField(1)
  @JsonKey(name: "notification_for_chat_and_dm")
  final bool notificationForChatAndDm;

  ToastSettings({
    @required this.notificationForMention,
    @required this.notificationForChatAndDm,
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
    bool notificationForMention,
    bool notificationForChatAndDm,
  }) =>
      ToastSettings(
        notificationForMention:
            notificationForMention ?? this.notificationForMention,
        notificationForChatAndDm:
            notificationForChatAndDm ?? this.notificationForChatAndDm,
      );
}
