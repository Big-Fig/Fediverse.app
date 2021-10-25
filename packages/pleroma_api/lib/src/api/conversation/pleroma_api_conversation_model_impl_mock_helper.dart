// ignore_for_file: no-magic-number
import '../account/pleroma_api_account_model_impl_mock_helper.dart';
import '../status/pleroma_api_status_model_impl_mock_helper.dart';
import 'pleroma_api_conversation_model_impl.dart';

abstract class PleromaApiConversationMockHelper {
  static PleromaApiConversation generate({
    required String seed,
  }) =>
      PleromaApiConversation(
        unread: seed.hashCode % 2 == 0,
        lastStatus: PleromaApiStatusMockHelper.generate(
          seed: seed,
        ),
        id: seed + 'id',
        accounts: [
          PleromaApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        pleroma: PleromaApiConversationPleromaPartMockHelper.generate(
          seed: seed,
        ),
      );
}

abstract class PleromaApiConversationPleromaPartMockHelper {
  static PleromaApiConversationPleromaPart generate({
    required String seed,
  }) =>
      PleromaApiConversationPleromaPart(
        recipients: [
          PleromaApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
