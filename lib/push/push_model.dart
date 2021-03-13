import 'dart:convert';

import 'package:fedi/enum/enum_values.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_model.g.dart';

typedef dynamic PushMessageListener(PushMessage message);

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 67)
@JsonSerializable(explicitToJson: true)
class PushMessage {
  PushMessageType get type =>
      _pushMessageTypeEnumValues.valueToEnumMap[typeString];

  @HiveField(1)
  final PushNotification notification;
  @HiveField(2)
  final Map<String, dynamic> data;

  @HiveField(3)
  final String typeString;

  bool get isLaunch =>
      type == PushMessageType.launch;

  PushMessage({
    @required this.typeString,
    @required this.notification,
    @required this.data,
  });

  @override
  String toString() {
    return 'PushMessage{type: $type,'
        ' notification: $notification,'
        ' data: $data}';
  }

  PushMessage copyWith({
    PushNotification notification,
    Map<String, dynamic> data,
    String typeString,
  }) =>
      PushMessage(
        notification: notification ?? this.notification,
        data: data ?? this.data,
        typeString: typeString ?? this.typeString,
      );

  factory PushMessage.fromJson(Map<String, dynamic> json) =>
      _$PushMessageFromJson(json);

  factory PushMessage.fromJsonString(String jsonString) =>
      _$PushMessageFromJson(jsonDecode(jsonString));

  static List<PushMessage> listFromJsonString(String str) =>
      List<PushMessage>.from(
          json.decode(str).map((x) => PushMessage.fromJson(x)));

  Map<String, dynamic> toJson() => _$PushMessageToJson(this);

  String toJsonString() => jsonEncode(_$PushMessageToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushMessage &&
          runtimeType == other.runtimeType &&
          notification == other.notification &&
          data == other.data &&
          typeString == other.typeString;

  @override
  int get hashCode =>
      notification.hashCode ^ data.hashCode ^ typeString.hashCode;
}

enum PushMessageType {
  foreground,
  launch,
}

extension PushMessageTypeJsonValueExtension on PushMessageType {
  String toJsonValue() => _pushMessageTypeEnumValues.enumToValueMap[this];
}

extension PushMessageTypeStringExtension on String {
  PushMessageType toPushMessageType() {
    var visibility = _pushMessageTypeEnumValues.valueToEnumMap[this];
    assert(visibility != null, "invalid visibility $this");
    return visibility;
  }
}

EnumValues<PushMessageType> _pushMessageTypeEnumValues = EnumValues({
  "foreground": PushMessageType.foreground,
  "launch": PushMessageType.launch,
});

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 73)
@JsonSerializable(explicitToJson: true)
class PushNotification {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String body;

  PushNotification({
    @required this.title,
    @required this.body,
  });

  @override
  String toString() {
    return 'PushNotification{title: $title, body: $body}';
  }

  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);

  factory PushNotification.fromJson(Map<dynamic, dynamic> json) =>
      _$PushNotificationFromJson(json);
}
