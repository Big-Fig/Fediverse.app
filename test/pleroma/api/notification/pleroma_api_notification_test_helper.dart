// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';

import '../../../date_time/date_time_test_helper.dart';
import '../../../enum/enum_test_helper.dart';
import '../account/pleroma_api_account_test_helper.dart';
import '../chat/message/pleroma_api_chat_message_test_helper.dart';
import '../status/pleroma_api_status_test_helper.dart';

class PleromaApiNotificationTestHelper {
  static PleromaApiNotificationPleromaPart
      createTestPleromaApiNotificationPleromaPart({
    required String seed,
  }) =>
          PleromaApiNotificationPleromaPart(
            isSeen: seed.hashCode % 2 == 0,
            isMuted: seed.hashCode % 2 == 1,
          );

  static PleromaApiNotification createTestPleromaApiNotification({
    required String seed,
  }) =>
      PleromaApiNotification(
        account:
            PleromaApiAccountTestHelper.createTestPleromaApiAccount(seed: seed),
        createdAt:
            DateTimeTestHelper.createTestDateTime(seed: seed + 'createdAt'),
        id: seed + 'id',
        type: EnumTestHelper.createTestEnum(
          seed: seed,
          values: PleromaApiNotificationType.values,
        ).toJsonValue(),
        status:
            PleromaApiStatusTestHelper.createTestPleromaApiStatus(seed: seed),
        chatMessage:
            PleromaApiChatMessageTestHelper.createTestPleromaApiChatMessage(
          seed: seed,
        ),
        emoji: seed + 'emoji',
        pleroma: createTestPleromaApiNotificationPleromaPart(
          seed: seed,
        ),
        report: PleromaApiAccountTestHelper.createTestPleromaApiAccountReport(
          seed: seed,
        ),
        target: PleromaApiAccountTestHelper.createTestPleromaApiAccount(
          seed: seed + 'report',
        ),
      );
}
