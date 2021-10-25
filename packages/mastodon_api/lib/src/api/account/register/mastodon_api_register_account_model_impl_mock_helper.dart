import 'mastodon_api_register_account_model_impl.dart';

// ignore_for_file: no-magic-number
abstract class MastodonApiRegisterAccountMockHelper {
  static MastodonApiRegisterAccount generate({
    required String seed,
  }) =>
      MastodonApiRegisterAccount(
        username: seed + 'username',
        email: seed + 'email',
        password: seed + 'password',
        agreement: seed.hashCode % 2 == 0,
        locale: seed + 'locale',
        reason: seed + 'reason',
      );
}
