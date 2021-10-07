import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'push_model.g.dart';

typedef PushMessageListener = dynamic Function(PushMessage message);

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 67)
@freezed
class PushMessage with _$PushMessage implements IJsonObj {
  const PushMessage._();

  PushMessageType get type => typeString.toPushMessageType();

  bool get isLaunch => type == PushMessageType.launch;

  bool get isAction => type == PushMessageType.action;

  const factory PushMessage({
    @HiveField(1) required PushNotification? notification,
    @HiveField(2) required Map<String, dynamic>? data,
    @HiveField(3) required String typeString,
  }) = _PushMessage;

  factory PushMessage.fromJson(Map<String, dynamic> json) =>
      _$PushMessageFromJson(json);
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 73)
@freezed
class PushNotification with _$PushNotification implements IJsonObj {
  const factory PushNotification({
    @HiveField(0) required String? title,
    @HiveField(1) required String? body,
  }) = _PushNotification;

  factory PushNotification.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationFromJson(json);
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
