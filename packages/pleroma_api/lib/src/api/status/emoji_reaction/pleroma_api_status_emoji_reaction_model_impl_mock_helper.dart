import './pleroma_api_status_emoji_reaction_model_impl.dart';
import '../../account/pleroma_api_account_model_impl_mock_helper.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class PleromaApiStatusEmojiReactionMockHelper {
  static PleromaApiStatusEmojiReaction generate({
    required String seed,
  }) =>
      PleromaApiStatusEmojiReaction(
        url: seed + 'url',
        staticUrl: seed + 'staticUrl',
        name: seed + 'name',
        count: seed.hashCode % 5,
        me: seed.hashCode % 2 == 0,
        accounts: [
          PleromaApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          PleromaApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
