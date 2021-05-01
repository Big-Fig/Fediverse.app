// ignore_for_file: no-magic-number
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_model.dart';

import '../account/pleroma_api_account_test_helper.dart';
import '../status/pleroma_api_status_test_helper.dart';

class PleromaApiConversationTestHelper {
  static PleromaApiConversation createTestPleromaApiConversation({
    required String seed,
  }) =>
      PleromaApiConversation(
        unread: seed.hashCode % 2 == 0,
        lastStatus: PleromaApiStatusTestHelper.createTestPleromaApiStatus(
          seed: seed,
        ),
        id: seed + "id",
        accounts: [
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
            seed: seed + "1",
          ),
          PleromaApiAccountTestHelper.createTestPleromaApiAccount(
            seed: seed + "1",
          ),
        ],
        pleroma: createTestPleromaApiConversationPleromaPart(seed: seed),
      );

  static PleromaApiConversationPleromaPart
      createTestPleromaApiConversationPleromaPart({
    required String seed,
  }) =>
          PleromaApiConversationPleromaPart(
            recipients: [
              PleromaApiAccountTestHelper.createTestPleromaApiAccount(
                seed: seed + "1",
              ),
              PleromaApiAccountTestHelper.createTestPleromaApiAccount(
                seed: seed + "2",
              ),
            ],
          );
}
