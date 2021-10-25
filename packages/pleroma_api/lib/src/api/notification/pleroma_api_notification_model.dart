import 'package:mastodon_api/mastodon_api.dart';

import '../account/pleroma_api_account_model.dart';
import '../account/report/pleroma_api_account_report_model.dart';
import '../chat/message/pleroma_api_chat_message_model.dart';
import '../pleroma_api_model.dart';
import '../status/pleroma_api_status_model.dart';
import 'type/pleroma_api_notification_type_sealed.dart';

abstract class IPleromaApiNotification
    implements IMastodonApiNotification, IPleromaApiResponse {
  @override
  IPleromaApiAccount? get account;

  IPleromaApiAccount? get target;

  @override
  IPleromaApiStatus? get status;

  IPleromaApiChatMessage? get chatMessage;

  String? get emoji;

  IPleromaApiNotificationPleromaPart? get pleroma;

  IPleromaApiAccountReport? get report;
}

abstract class IPleromaApiNotificationPleromaPart
    implements IPleromaApiResponse {
  bool? get isSeen;

  bool? get isMuted;
}

extension IPleromaApiNotificationTypeExtension on IPleromaApiNotification {
  PleromaApiNotificationType get typeAsPleromaApi =>
      type.toPleromaApiNotificationType();
}
