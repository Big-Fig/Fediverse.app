import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/pleroma_api_account_model_impl.dart';
import '../account/report/pleroma_api_account_report_model_impl.dart';
import '../chat/message/pleroma_api_chat_message_model_impl.dart';
import '../status/pleroma_api_status_model_impl.dart';
import 'pleroma_api_notification_model.dart';

part 'pleroma_api_notification_model_impl.freezed.dart';

part 'pleroma_api_notification_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiNotificationPleromaPart
    with _$PleromaApiNotificationPleromaPart
    implements IPleromaApiNotificationPleromaPart {
  const factory PleromaApiNotificationPleromaPart({
    @HiveField(0) @JsonKey(name: 'is_seen') required bool? isSeen,
    @HiveField(1) @JsonKey(name: 'is_muted') required bool? isMuted,
  }) = _PleromaApiNotificationPleromaPart;

  factory PleromaApiNotificationPleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiNotificationPleromaPartFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiNotification
    with _$PleromaApiNotification
    implements IPleromaApiNotification {
  const factory PleromaApiNotification({
    @HiveField(0) required PleromaApiAccount? account,
    @HiveField(1) required PleromaApiAccount? target,
    @HiveField(2) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(3) required String id,
    @HiveField(4) required String type,
    @HiveField(5) required PleromaApiStatus? status,
    @HiveField(6) required String? emoji,
    @HiveField(7) required PleromaApiNotificationPleromaPart? pleroma,
    @HiveField(8)
    @JsonKey(name: 'chat_message')
        required PleromaApiChatMessage? chatMessage,
    @HiveField(9) required PleromaApiAccountReport? report,
  }) = _PleromaApiNotification;

  factory PleromaApiNotification.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiNotificationFromJson(json);
}

extension PleromaApiNotificationInterfaceExtension on IPleromaApiNotification {
  PleromaApiNotification toPleromaApiNotification({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiNotification(
          account: account?.toPleromaApiAccount(
            forceNewObject: forceNewObject,
          ),
          target: target?.toPleromaApiAccount(
            forceNewObject: forceNewObject,
          ),
          createdAt: createdAt,
          id: id,
          type: type,
          status: status?.toPleromaApiStatus(
            forceNewObject: forceNewObject,
          ),
          emoji: emoji,
          pleroma: pleroma?.toPleromaApiNotificationPleromaPart(
            forceNewObject: forceNewObject,
          ),
          chatMessage: chatMessage?.toPleromaApiChatMessage(
            forceNewObject: forceNewObject,
          ),
          report: report?.toPleromaApiAccountReport(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiNotificationInterfaceListExtension
    on List<IPleromaApiNotification> {
  List<PleromaApiNotification> toPleromaApiNotificationList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiNotification item) => item.toPleromaApiNotification(),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiNotificationPleromaPartInterfaceExtension
    on IPleromaApiNotificationPleromaPart {
  PleromaApiNotificationPleromaPart toPleromaApiNotificationPleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiNotificationPleromaPart(
          isSeen: isSeen,
          isMuted: isMuted,
        ),
        forceNewObject: forceNewObject,
      );
}
