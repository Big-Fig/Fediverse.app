import 'package:fedi/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:fedi/mastodon/api/field/mastodon_api_field_model.dart';

abstract class IMastodonApiMyAccountEdit {
  /// Whether the account should be shown in the profile directory.
  bool? get discoverable;

  /// Whether the account has a bot flag.
  bool? get bot;

  /// The display name to use for the profile.
  String? get displayName;

  String? get note;

  /// Whether manual approval of follow requests is required.
  bool? get locked;

  IMastodonApiMyAccountEditSource? get source;

  /// Profile metadata name and value.
  /// (By default, max 4 fields and 255 characters per property/value)
  Map<int, IMastodonApiField>? get fieldsAttributes;
}

abstract class IMastodonApiMyAccount implements IMastodonApiAccount {
  /// Note the extra source property,
  /// which is not visible on accounts other than your own.
  /// Also note that plain-text is used within source and
  /// HTML is used for their corresponding properties such as note and fields.
  IMastodonApiMyAccountSource? get source;

  bool? get discoverable;
}

abstract class IMastodonApiMyAccountSource
    implements IMastodonApiMyAccountEditSource {
  /// Profile bio.
  String? get note;

  /// Metadata about the account.
  List<IMastodonApiField>? get fields;

  /// The number of pending follow requests.
  int? get followRequestsCount;
}

abstract class IMastodonApiMyAccountEditSource {
  /// The default post privacy to be used for new statuses.
  String? get privacy;

  /// Whether new statuses should be marked sensitive by default.
  bool? get sensitive;

  /// The default posting language for new statuses.
  String? get language;
}
