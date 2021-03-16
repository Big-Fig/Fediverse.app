import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/mastodon/field/mastodon_field_model.dart';

abstract class IMastodonMyAccountEdit {

  /// Whether the account should be shown in the profile directory.
  bool? get discoverable;

  /// Whether the account has a bot flag.
  bool? get bot;

  /// The display name to use for the profile.
  String? get displayName;

  String? get note;

  /// Whether manual approval of follow requests is required.
  bool? get locked;

  IMastodonMyAccountEditSource? get source;

  /// Profile metadata name and value.
  /// (By default, max 4 fields and 255 characters per property/value)
  Map<int, IMastodonField>? get fieldsAttributes;
}

abstract class IMastodonMyAccount implements IMastodonAccount {
  /// Note the extra source property,
  /// which is not visible on accounts other than your own.
  /// Also note that plain-text is used within source and
  /// HTML is used for their corresponding properties such as note and fields.
  IMastodonMyAccountSource? get source;

  bool? get discoverable;
}

abstract class IMastodonMyAccountSource
    implements IMastodonMyAccountEditSource {
  /// Profile bio.
  String? get note;

  /// Metadata about the account.
  List<IMastodonField>? get fields;

  /// The number of pending follow requests.
  int? get followRequestsCount;
}

abstract class IMastodonMyAccountEditSource {
  /// The default post privacy to be used for new statuses.
  String? get privacy;

  /// Whether new statuses should be marked sensitive by default.
  bool? get sensitive;

  /// The default posting language for new statuses.
  String? get language;
}

extension IMastodonMyAccountEditSourceExtension
    on IMastodonMyAccountEditSource {
}
