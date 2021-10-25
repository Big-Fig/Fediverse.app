import 'package:fedi_app/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'notifications_push_handler_unhandled_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'notifications_push_handler_unhandled_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 55)
@freezed
class NotificationsPushHandlerUnhandledList
    with _$NotificationsPushHandlerUnhandledList
    implements IJsonObj {
  const factory NotificationsPushHandlerUnhandledList({
    @HiveField(0) required List<NotificationsPushHandlerMessage> messages,
  }) = _NotificationsPushHandlerUnhandledList;

  factory NotificationsPushHandlerUnhandledList.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$NotificationsPushHandlerUnhandledListFromJson(json);
}
