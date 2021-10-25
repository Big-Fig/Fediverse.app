// ignore_for_file: no-magic-number
import '../account/unifedi_api_account_model_impl_mock_helper.dart';
import '../status/unifedi_api_status_model_impl_mock_helper.dart';
import 'unifedi_api_conversation_model_impl.dart';

abstract class UnifediApiConversationMockHelper {
  static UnifediApiConversation generate({
    required String seed,
  }) =>
      UnifediApiConversation(
        unread: seed.hashCode % 2 == 0,
        lastStatus: UnifediApiStatusMockHelper.generate(
          seed: seed,
        ),
        id: seed + 'id',
        accounts: [
          UnifediApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        recipients: [
          UnifediApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
