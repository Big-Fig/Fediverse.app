import 'dart:io';

import '../../../../../feature/mastodon_api_feature_model.dart';
import '../../../../../service/mastodon_api_service.dart';
import '../../../focus/mastodon_api_media_attachment_focus_model.dart';
import '../../../mastodon_api_media_attachment_model.dart';

abstract class IMastodonApiMediaAttachmentUserAccessService
    implements IMastodonApiService {
  IMastodonApiFeature get uploadMediaFeature;

  IMastodonApiFeature get uploadMediaProcessInBackgroundFeature;

  IMastodonApiFeature get uploadMediaFocusFeature;

  IMastodonApiFeature get uploadMediaThumbnailFeature;

  IMastodonApiFeature get updateMediaFeature;

  IMastodonApiFeature get updateMediaFocusFeature;

  IMastodonApiFeature get updateMediaThumbnailFeature;

  IMastodonApiFeature get getMediaFeature;

  Future<IMastodonApiMediaAttachment> getMedia({
    required String id,
  });

  Future<IMastodonApiMediaAttachment> uploadMedia({
    required File file,
    required File? thumbnail,
    required String? description,
    required IMastodonApiMediaAttachmentFocus? focus,
    required bool? processInBackground,
  });

  Future<IMastodonApiMediaAttachment> updateMedia({
    required String id,
    required File? file,
    required File? thumbnail,
    required String? description,
    required IMastodonApiMediaAttachmentFocus? focus,
  });
}
