import '../mastodon_api_post_status_model.dart';

abstract class IMastodonApiSchedulePostStatus
    implements IMastodonApiBasePostStatus {
  DateTime get scheduledAt;
}
