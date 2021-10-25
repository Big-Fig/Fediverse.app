import '../../../visibility/mastodon_api_visibility_sealed.dart';
import '../../post/poll/mastodon_api_post_status_poll_model.dart';

abstract class IMastodonApiScheduledStatusParams {
  String? get text;

  List<String>? get mediaIds;

  bool get sensitive;

  String? get spoilerText;

  String get visibility;

  DateTime get scheduledAt;

  IMastodonApiPostStatusPoll? get poll;

  String? get inReplyToId;

  String? get language;
}

extension IMastodonApiScheduledStatusParamsVisibilityExtension
    on IMastodonApiScheduledStatusParams {
  MastodonApiVisibility get visibilityAsMastodonApi =>
      visibility.toMastodonApiVisibility();
}
