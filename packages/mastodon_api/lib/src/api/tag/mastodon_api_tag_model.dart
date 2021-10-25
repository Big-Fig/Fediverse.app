import '../mastodon_api_model.dart';
import 'history/item/mastodon_api_tag_history_item_model.dart';

abstract class IMastodonApiTag implements IMastodonApiResponse {
  String get name;

  String get url;

  List<IMastodonApiTagHistoryItem>? get history;
}
