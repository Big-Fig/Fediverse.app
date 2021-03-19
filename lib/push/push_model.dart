import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'push_model.g.dart';

typedef dynamic PushMessageListener(PushMessage message);

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 67)
@JsonSerializable(explicitToJson: true)
class PushMessage {
  PushMessageType get type => typeString.toPushMessageType();

  @HiveField(1)
  final PushNotification? notification;
  @HiveField(2)
  final Map<String, dynamic>? data;

  @HiveField(3)
  final String typeString;

  bool get isLaunch => type == PushMessageType.launch;

  PushMessage({
    required this.typeString,
    required this.notification,
    required this.data,
  });

  @override
  String toString() {
    return 'PushMessage{'
        'type: $type, '
        'notification: $notification, '
        'data: $data'
        '}';
  }

  PushMessage copyWith({
    PushNotification? notification,
    Map<String, dynamic>? data,
    String? typeString,
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
        json.decode(str).map((x) => PushMessage.fromJson(x)),
      );

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

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 73)
@JsonSerializable(explicitToJson: true)
class PushNotification {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? body;

  PushNotification({
    required this.title,
    required this.body,
  });

  @override
  String toString() {
    return 'PushNotification{title: $title, body: $body}';
  }

  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);

  factory PushNotification.fromJson(Map<dynamic, dynamic> json) =>
      _$PushNotificationFromJson(json as Map<String, dynamic>);
}

enum PushMessageType {
  foreground,
  launch,
}

const _foregroundPushMessageTypeJsonValue = "foreground";
const _launchPushMessageTypeJsonValue = "launch";

extension PushMessageTypeListExtension on List<PushMessageType> {
  List<String> toPushMessageTypeStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension PushMessageTypeExtension on PushMessageType {
  String toJsonValue() {
    String result;

    switch (this) {
      case PushMessageType.foreground:
        result = _foregroundPushMessageTypeJsonValue;
        break;
      case PushMessageType.launch:
        result = _launchPushMessageTypeJsonValue;
        break;
    }

    return result;
  }
}

extension PushMessageTypeStringExtension on String {
  PushMessageType toPushMessageType() {
    PushMessageType result;

    switch (this) {
      case _foregroundPushMessageTypeJsonValue:
        result = PushMessageType.foreground;
        break;
      case _launchPushMessageTypeJsonValue:
        result = PushMessageType.launch;
        break;
      default:
        throw "Invalid PushMessageTypeStringExtension $this";
    }

    return result;
  }
}

extension PushMessageTypeStringListExtension on List<String> {
  List<PushMessageType> toPleromaVisibilities() => map(
        (visibilityString) => visibilityString.toPushMessageType(),
      ).toList();
}

class PushMessageTypeTypeConverter
    implements
        JsonConverter<PushMessageType, String?>,
        moor.TypeConverter<PushMessageType, String?> {
  const PushMessageTypeTypeConverter();

  @override
  PushMessageType fromJson(String? value) => value!.toPushMessageType();

  @override
  String? toJson(PushMessageType? value) => value?.toJsonValue();

  @override
  PushMessageType? mapToDart(String? fromDb) => fromJson(fromDb);

  @override
  String? mapToSql(PushMessageType? value) => toJson(value);
}
