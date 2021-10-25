import '../mastodon_api_account_model.dart';
import 'source/mastodon_api_my_account_source_model.dart';

abstract class IMastodonApiMyAccount implements IMastodonApiAccount {
  /// Note the extra source property,
  /// which is not visible on accounts other than your own.
  /// Also note that plain-text is used within source and
  /// HTML is used for their corresponding properties such as note and fields.
  IMastodonApiMyAccountSource? get source;

  bool? get discoverable;
}
