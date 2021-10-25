// ignore_for_file: no-magic-number
import '../account/mastodon_api_account_model_impl_mock_helper.dart';
import '../status/mastodon_api_status_model_impl_mock_helper.dart';
import 'mastodon_api_conversation_model_impl.dart';

abstract class MastodonApiConversationMockHelper {
  static MastodonApiConversation generate({
    required String seed,
  }) =>
      MastodonApiConversation(
        unread: seed.hashCode % 2 == 0,
        lastStatus: MastodonApiStatusMockHelper.generate(
          seed: seed,
        ),
        id: seed + 'id',
        accounts: [
          MastodonApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          MastodonApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
