// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../account/unifedi_api_account_model_impl_mock_helper.dart';
import 'message/unifedi_api_chat_message_model_impl_mock_helper.dart';
import 'unifedi_api_chat_model_impl.dart';

class UnifediApiChatMockHelper {
  static UnifediApiChat generate({
    required String seed,
  }) =>
      UnifediApiChat(
        id: seed + 'id',
        unread: seed.hashCode % 10,
        account: UnifediApiAccountMockHelper.generate(seed: seed),
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
        lastMessage: UnifediApiChatMessageMockHelper.generate(
          seed: seed,
        ),
      );
}
