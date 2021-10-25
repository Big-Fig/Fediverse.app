// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../account/pleroma_api_account_model_impl_mock_helper.dart';
import '../account/report/pleroma_api_account_report_model_impl_mock_helper.dart';
import '../chat/message/pleroma_api_chat_message_model_impl_mock_helper.dart';
import '../status/pleroma_api_status_model_impl_mock_helper.dart';
import 'pleroma_api_notification_model_impl.dart';
import 'type/pleroma_api_notification_type_sealed_mock_helper.dart';

class PleromaApiNotificationMockHelper {
  static PleromaApiNotification generate({
    required String seed,
  }) =>
      PleromaApiNotification(
        account: PleromaApiAccountMockHelper.generate(
          seed: seed + 'account',
        ),
        createdAt: DateTimeMockHelper.generate(seed: seed + 'createdAt'),
        id: seed + 'id',
        type: PleromaApiNotificationTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        status: PleromaApiStatusMockHelper.generate(seed: seed),
        chatMessage: PleromaApiChatMessageMockHelper.generate(
          seed: seed + 'chatMessage',
        ),
        emoji: seed + 'emoji',
        pleroma: PleromaApiNotificationPleromaPartMockHelper.generate(
          seed: seed,
        ),
        report: PleromaApiAccountReportMockHelper.generate(
          seed: seed,
        ),
        target: PleromaApiAccountMockHelper.generate(
          seed: seed + 'target',
        ),
      );
}

class PleromaApiNotificationPleromaPartMockHelper {
  static PleromaApiNotificationPleromaPart generate({
    required String seed,
  }) =>
      PleromaApiNotificationPleromaPart(
        isSeen: seed.hashCode % 2 == 0,
        isMuted: seed.hashCode % 2 == 1,
      );
}
