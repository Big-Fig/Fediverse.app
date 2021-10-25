//
// 'id': '627',
// 'name': 'nowplaying',
// 'statuses_count': 36,
// 'last_status_at': '2019-11-15T07:14:43.524Z'

import '../mastodon_api_model.dart';

abstract class IMastodonApiFeaturedTag implements IMastodonApiResponse {
  String get id;

  DateTime? get lastStatusAt;

  int get statusesCount;

  String get name;
}
