import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_model.dart';
import 'history/item/pleroma_api_tag_history_item_model.dart';

abstract class IPleromaApiTag implements IMastodonApiTag, IPleromaApiResponse {
  @override
  List<IPleromaApiTagHistoryItem>? get history;
}
