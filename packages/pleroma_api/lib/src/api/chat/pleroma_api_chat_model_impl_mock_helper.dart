// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../account/pleroma_api_account_model_impl_mock_helper.dart';
import 'message/pleroma_api_chat_message_model_impl_mock_helper.dart';
import 'pleroma_api_chat_model_impl.dart';

class PleromaApiChatMockHelper {
  static PleromaApiChat generate({
    required String seed,
  }) =>
      PleromaApiChat(
        id: seed + 'id',
        unread: seed.hashCode % 10,
        account: PleromaApiAccountMockHelper.generate(seed: seed),
        updatedAt: DateTimeMockHelper.generate(seed: seed + 'updatedAt'),
        lastMessage: PleromaApiChatMessageMockHelper.generate(
          seed: seed,
        ),
      );
}
