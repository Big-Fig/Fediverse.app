import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'push_model.g.dart';

typedef PushMessageListener = dynamic Function(PushMessage message);

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 67)
@JsonSerializable(explicitToJson: true)
class PushMessage implements IJsonObject {
  PushMessageType get type => typeString.toPushMessageType();

  @HiveField(1)
  final PushNotification? notification;
  @HiveField(2)
  final Map<String, dynamic>? data;

  @HiveField(3)
  final String typeString;

  bool get isLaunch => type == PushMessageType.launch;
  bool get isAction => type == PushMessageType.action;

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

  static PushMessage fromJson(Map<String, dynamic> json) =>
      _$PushMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PushMessageToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushMessage &&
          runtimeType == other.runtimeType &&
          notification == other.notification &&
          mapEquals(data, other.data) &&
          typeString == other.typeString;

  @override
  int get hashCode =>
      notification.hashCode ^ mapHash(data) ^ typeString.hashCode;
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 73)
@JsonSerializable(explicitToJson: true)
class PushNotification implements IJsonObject {
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

  @override
  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);

  static PushNotification fromJson(Map<String, dynamic> json) =>
      _$PushNotificationFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushNotification &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          body == other.body;

  @override
  int get hashCode => title.hashCode ^ body.hashCode;
}

enum PushMessageType {
  foreground,
  background,
  action,
  launch,
}

const _backgroundPushMessageTypeJsonValue = 'background';
const _foregroundPushMessageTypeJsonValue = 'foreground';
const _launchPushMessageTypeJsonValue = 'launch';
const _actionPushMessageTypeJsonValue = 'action';

extension PushMessageTypeExtension on PushMessageType {
  String toJsonValue() {
    String result;

    switch (this) {
      case PushMessageType.background:
        result = _backgroundPushMessageTypeJsonValue;
        break;
      case PushMessageType.foreground:
        result = _foregroundPushMessageTypeJsonValue;
        break;
      case PushMessageType.launch:
        result = _launchPushMessageTypeJsonValue;
        break;
      case PushMessageType.action:
        result = _actionPushMessageTypeJsonValue;
        break;
    }

    return result;
  }
}

extension PushMessageTypeStringExtension on String {
  PushMessageType toPushMessageType() {
    PushMessageType result;

    switch (this) {
      case _backgroundPushMessageTypeJsonValue:
        result = PushMessageType.background;
        break;
      case _foregroundPushMessageTypeJsonValue:
        result = PushMessageType.foreground;
        break;
      case _launchPushMessageTypeJsonValue:
        result = PushMessageType.launch;
        break;
      case _actionPushMessageTypeJsonValue:
        result = PushMessageType.action;
        break;
      default:
        throw 'Invalid PushMessageType $this';
    }

    return result;
  }
}
