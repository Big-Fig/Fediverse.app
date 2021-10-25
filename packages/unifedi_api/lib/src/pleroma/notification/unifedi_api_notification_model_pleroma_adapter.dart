import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/account/report/unifedi_api_account_report_model.dart';
import '../../api/account/unifedi_api_account_model.dart';
import '../../api/chat/message/unifedi_api_chat_message_model.dart';
import '../../api/notification/unifedi_api_notification_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../account/report/unifedi_api_account_report_model_pleroma_adapter.dart';
import '../account/unifedi_api_account_model_pleroma_adapter.dart';
import '../chat/message/unifedi_api_chat_message_model_pleroma_adapter.dart';
import '../status/unifedi_api_status_model_pleroma_adapter.dart';
import 'type/unifedi_api_notification_type_sealed_pleroma_converter.dart';

part 'unifedi_api_notification_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_notification_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiNotificationPleromaAdapter
    with _$UnifediApiNotificationPleromaAdapter
    implements IUnifediApiNotification {
  const UnifediApiNotificationPleromaAdapter._();

  const factory UnifediApiNotificationPleromaAdapter(
    @HiveField(0) PleromaApiNotification value,
  ) = _UnifediApiNotificationPleromaAdapter;

  @override
  IUnifediApiAccount? get account =>
      value.account?.toUnifediApiAccountPleromaAdapter();

  @override
  IUnifediApiChatMessage? get chatMessage =>
      value.chatMessage?.toUnifediApiChatMessagePleromaAdapter();

  @override
  DateTime get createdAt => value.createdAt;

  @override
  String? get emoji => value.emoji;

  @override
  String get id => value.id;

  @override
  bool? get isMuted => value.pleroma?.isMuted;

  @override
  bool? get isSeen => value.pleroma?.isSeen;

  @override
  IUnifediApiAccountReport? get report =>
      value.report?.toUnifediApiAccountReportPleromaAdapter();

  @override
  IUnifediApiStatus? get status =>
      value.status?.toUnifediApiStatusPleromaAdapter();

  @override
  IUnifediApiAccount? get target =>
      value.target?.toUnifediApiAccountPleromaAdapter();

  @override
  String get type =>
      value.typeAsPleromaApi.toUnifediApiNotificationType().stringValue;

  factory UnifediApiNotificationPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiNotificationPleromaAdapterFromJson(json);
}

extension PleromaApiNotificationUnifediExtension on IPleromaApiNotification {
  UnifediApiNotificationPleromaAdapter
      toUnifediApiNotificationPleromaAdapter() =>
          UnifediApiNotificationPleromaAdapter(
            toPleromaApiNotification(),
          );
}

extension PleromaApiNotificationUnifediListExtension
    on List<IPleromaApiNotification> {
  List<UnifediApiNotificationPleromaAdapter>
      toUnifediApiNotificationPleromaAdapterList() => map(
            (item) => item.toUnifediApiNotificationPleromaAdapter(),
          ).toList();
}
