import '../../mastodon_api_model.dart';

import '../../visibility/mastodon_api_visibility_sealed.dart';
import 'poll/mastodon_api_post_status_poll_model.dart';

abstract class IMastodonApiBasePostStatus implements IMastodonApiObject {
  String? get status;

  List<String>? get mediaIds;

  IMastodonApiPostStatusPoll? get poll;

  bool get sensitive;

  String? get spoilerText;

  String get visibility;

  String? get language;

  String? get inReplyToId;
}

extension IMastodonApiPostStatusBaseRequestVisibility
    on IMastodonApiBasePostStatus {
  MastodonApiVisibility get visibilityAsMastodonApi =>
      visibility.toMastodonApiVisibility();
}

abstract class IMastodonApiPostStatus implements IMastodonApiBasePostStatus {}
