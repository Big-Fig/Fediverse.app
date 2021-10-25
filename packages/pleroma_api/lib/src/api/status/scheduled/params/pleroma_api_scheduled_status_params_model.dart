import 'package:mastodon_api/mastodon_api.dart';

import '../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../post/poll/pleroma_api_post_status_poll_model.dart';

abstract class IPleromaApiScheduledStatusParams
    extends IMastodonApiScheduledStatusParams {
  List<String>? get to;

  String? get inReplyToConversationId;

  int? get expiresInSeconds;

  @override
  IPleromaApiPostStatusPoll? get poll;
}

extension IPleromaApiScheduledStatusParamsVisibilityExtension
    on IPleromaApiScheduledStatusParams {
  PleromaApiVisibility get visibilityAsPleromaApi =>
      visibility.toPleromaApiVisibility();
}
