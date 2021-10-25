import '../../../field/mastodon_api_field_model.dart';

abstract class IMastodonApiMyAccountSource {
  /// The default post privacy to be used for new statuses.
  String? get privacy;

  /// Whether new statuses should be marked sensitive by default.
  bool? get sensitive;

  /// The default posting language for new statuses.
  String? get language;

  /// Profile bio.
  String? get note;

  /// Metadata about the account.
  List<IMastodonApiField>? get fields;

  /// The number of pending follow requests.
  int? get followRequestsCount;
}
