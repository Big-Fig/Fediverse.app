// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../account/report/unifedi_api_account_report_model_impl_mock_helper.dart';
import '../account/unifedi_api_account_model_impl_mock_helper.dart';
import '../chat/message/unifedi_api_chat_message_model_impl_mock_helper.dart';
import '../status/unifedi_api_status_model_impl_mock_helper.dart';
import 'type/unifedi_api_notification_type_sealed_mock_helper.dart';
import 'unifedi_api_notification_model_impl.dart';

class UnifediApiNotificationMockHelper {
  static UnifediApiNotification generate({
    required String seed,
  }) =>
      UnifediApiNotification(
        account: UnifediApiAccountMockHelper.generate(
          seed: seed + 'account',
        ),
        createdAt: DateTimeMockHelper.generate(seed: seed + 'createdAt'),
        id: seed + 'id',
        type: UnifediApiNotificationTypeMockHelper.generate(
          seed: seed + 'type',
        ).stringValue,
        status: UnifediApiStatusMockHelper.generate(seed: seed),
        chatMessage: UnifediApiChatMessageMockHelper.generate(
          seed: seed + 'chatMessage',
        ),
        emoji: seed + 'emoji',
        report: UnifediApiAccountReportMockHelper.generate(
          seed: seed,
        ),
        target: UnifediApiAccountMockHelper.generate(
          seed: seed + 'target',
        ),
        isSeen: seed.hashCode % 2 == 0,
        isMuted: seed.hashCode % 2 == 1,
      );
}
