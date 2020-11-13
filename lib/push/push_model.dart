import 'dart:convert';

import 'package:fedi/enum/enum_values.dart';
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
      pushMessageTypeEnumValues.valueToEnumMap[typeString];

  @HiveField(1)
  final PushNotification notification;
  @HiveField(2)
  final Map<String, dynamic> data;

  @HiveField(3)
  final String typeString;

  bool get isLaunchOrResume =>
      type == PushMessageType.launch || type == PushMessageType.resume;

  PushMessage({this.typeString, this.notification, this.data});

  @override
  String toString() {
    return 'PushMessage{type: $type,'
        ' notification: $notification,'
        ' data: $data}';
  }

  factory PushMessage.fromJson(Map<String, dynamic> json) =>
      _$PushMessageFromJson(json);

  factory PushMessage.fromJsonString(String jsonString) =>
      _$PushMessageFromJson(jsonDecode(jsonString));

  static List<PushMessage> listFromJsonString(String str) =>
      List<PushMessage>.from(
          json.decode(str).map((x) => PushMessage.fromJson(x)));

  Map<String, dynamic> toJson() => _$PushMessageToJson(this);

  String toJsonString() => jsonEncode(_$PushMessageToJson(this));
}

enum PushMessageType {
  foreground,
  launch,
  resume,
}

EnumValues<PushMessageType> pushMessageTypeEnumValues = EnumValues({
  "foreground": PushMessageType.foreground,
  "launch": PushMessageType.launch,
  "resume": PushMessageType.resume,
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

  PushNotification({this.title, this.body});

  @override
  String toString() {
    return 'PushNotification{title: $title, body: $body}';
  }

  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);

  factory PushNotification.fromJson(Map<dynamic, dynamic> json) =>
      _$PushNotificationFromJson(json);
}
