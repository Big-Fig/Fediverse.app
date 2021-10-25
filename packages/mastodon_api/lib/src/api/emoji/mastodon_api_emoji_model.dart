import '../mastodon_api_model.dart';

abstract class IMastodonApiEmoji implements IMastodonApiResponse {
  String get shortcode;

  String? get url;

  String? get staticUrl;

  bool? get visibleInPicker;

  String? get category;
}
