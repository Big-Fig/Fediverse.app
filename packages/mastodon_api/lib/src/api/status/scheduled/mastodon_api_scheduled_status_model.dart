import '../../mastodon_api_model.dart';

import '../../media/attachment/mastodon_api_media_attachment_model.dart';
import 'params/mastodon_api_scheduled_status_params_model.dart';

abstract class IMastodonApiScheduledStatus implements IMastodonApiResponse {
  String get id;

  DateTime get scheduledAt;

  IMastodonApiScheduledStatusParams get params;

  List<IMastodonApiMediaAttachment>? get mediaAttachments;
}
