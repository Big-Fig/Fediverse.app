import '../../account/unifedi_api_account_model_impl_mock_helper.dart';
import 'unifedi_api_emoji_reaction_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments
class UnifediApiEmojiReactionMockHelper {
  static UnifediApiEmojiReaction generate({
    required String seed,
  }) =>
      UnifediApiEmojiReaction(
        url: seed + 'url',
        staticUrl: seed + 'staticUrl',
        name: seed + 'name',
        count: seed.hashCode % 5,
        me: seed.hashCode % 2 == 0,
        accounts: [
          UnifediApiAccountMockHelper.generate(
            seed: seed + '1',
          ),
          UnifediApiAccountMockHelper.generate(
            seed: seed + '2',
          ),
        ],
      );
}
