import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'push_handler_unhandled_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 55)
@JsonSerializable(explicitToJson: true)
class PushHandlerUnhandledList implements IJsonObject {
  @HiveField(0)
  final List<PushHandlerMessage> messages;

  const PushHandlerUnhandledList({
    required this.messages,
  });

  @override
  String toString() {
    return 'PushHandlerUnhandledList{pleromaPushMessage: $messages}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushHandlerUnhandledList &&
          runtimeType == other.runtimeType &&
          listEquals(messages, other.messages);

  @override
  int get hashCode => listHash(messages);

  static PushHandlerUnhandledList fromJson(Map<String, dynamic> json) =>
      _$PushHandlerUnhandledListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PushHandlerUnhandledListToJson(this);
}
