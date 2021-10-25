import '../mastodon_api_status_model_impl_mock_helper.dart';
import 'mastodon_api_status_context_model_impl.dart';

// ignore_for_file: no-magic-number
class MastodonApiStatusContextMockHelper {
  static MastodonApiStatusContext generate({
    required String seed,
  }) =>
      MastodonApiStatusContext(
        ancestors: [
          MastodonApiStatusMockHelper.generate(
            seed: seed + '1',
          ),
          MastodonApiStatusMockHelper.generate(
            seed: seed + '2',
          ),
        ],
        descendants: [
          MastodonApiStatusMockHelper.generate(
            seed: seed + '3',
          ),
          MastodonApiStatusMockHelper.generate(
            seed: seed + '4',
          ),
        ],
      );
}
