import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/report/unifedi_api_account_report_model_impl.dart';
import '../account/unifedi_api_account_model_impl.dart';
import '../chat/message/unifedi_api_chat_message_model_impl.dart';
import '../status/unifedi_api_status_model_impl.dart';
import 'unifedi_api_notification_model.dart';

part 'unifedi_api_notification_model_impl.freezed.dart';

part 'unifedi_api_notification_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiNotification
    with _$UnifediApiNotification
    implements IUnifediApiNotification {
  const factory UnifediApiNotification({
    @HiveField(0) required UnifediApiAccount? account,
    @HiveField(1) required UnifediApiAccount? target,
    @HiveField(2) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(3) required String id,
    @HiveField(4) required String type,
    @HiveField(5) required UnifediApiStatus? status,
    @HiveField(6) required String? emoji,
    @HiveField(8)
    @JsonKey(name: 'chat_message')
        required UnifediApiChatMessage? chatMessage,
    @HiveField(9) required UnifediApiAccountReport? report,
    @HiveField(10 + 0) @JsonKey(name: 'is_seen') required bool? isSeen,
    @HiveField(11 + 1) @JsonKey(name: 'is_muted') required bool? isMuted,
  }) = _UnifediApiNotification;

  factory UnifediApiNotification.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiNotificationFromJson(json);
}

extension UnifediApiNotificationInterfaceExtension on IUnifediApiNotification {
  UnifediApiNotification toUnifediApiNotification({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiNotification(
          account: account?.toUnifediApiAccount(
            forceNewObject: forceNewObject,
          ),
          target: target?.toUnifediApiAccount(
            forceNewObject: forceNewObject,
          ),
          createdAt: createdAt,
          id: id,
          type: type,
          status: status?.toUnifediApiStatus(
            forceNewObject: forceNewObject,
          ),
          emoji: emoji,
          chatMessage: chatMessage?.toUnifediApiChatMessage(
            forceNewObject: forceNewObject,
          ),
          report: report?.toUnifediApiAccountReport(
            forceNewObject: forceNewObject,
          ),
          isSeen: isSeen,
          isMuted: isMuted,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiNotificationInterfaceListExtension
    on List<IUnifediApiNotification> {
  List<UnifediApiNotification> toUnifediApiNotificationList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiNotification item) => item.toUnifediApiNotification(),
        forceNewObject: forceNewObject,
      );
}
