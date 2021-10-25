import 'package:mastodon_api/mastodon_api.dart';

import '../../media/attachment/pleroma_api_media_attachment_model.dart';
import '../../pleroma_api_model.dart';
import 'params/pleroma_api_scheduled_status_params_model.dart';

abstract class IPleromaApiScheduledStatus
    implements IMastodonApiScheduledStatus, IPleromaApiResponse {
  @override
  IPleromaApiScheduledStatusParams get params;

  @override
  List<IPleromaApiMediaAttachment>? get mediaAttachments;
}
