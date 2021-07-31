import 'package:mastodon_fediverse_api/src/mastodon/api/history/mastodon_api_history_model.dart';

abstract class IMastodonApiTag {
  String get name;

  String get url;

  List<IMastodonApiTagHistory>? get history;
}
