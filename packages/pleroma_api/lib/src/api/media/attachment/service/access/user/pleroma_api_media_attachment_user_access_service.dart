import 'dart:io';

import '../../../../../feature/pleroma_api_feature_model.dart';
import '../../../../../service/pleroma_api_service.dart';
import '../../../focus/pleroma_api_media_attachment_focus_model.dart';
import '../../../pleroma_api_media_attachment_model.dart';

abstract class IPleromaApiMediaAttachmentUserAccessService
    implements IPleromaApiService {
  IPleromaApiFeature get uploadMediaFeature;

  IPleromaApiFeature get uploadMediaProcessInBackgroundFeature;

  IPleromaApiFeature get uploadMediaFocusFeature;

  IPleromaApiFeature get uploadMediaThumbnailFeature;

  IPleromaApiFeature get updateMediaFeature;

  IPleromaApiFeature get updateMediaFocusFeature;

  IPleromaApiFeature get updateMediaThumbnailFeature;

  IPleromaApiFeature get getMediaFeature;

  Future<IPleromaApiMediaAttachment> getMedia({
    required String id,
  });

  Future<IPleromaApiMediaAttachment> uploadMedia({
    required File file,
    required File? thumbnail,
    required String? description,
    required IPleromaApiMediaAttachmentFocus? focus,
    required bool? processInBackground,
  });

  Future<IPleromaApiMediaAttachment> updateMedia({
    required String id,
    required File? file,
    required File? thumbnail,
    required String? description,
    required IPleromaApiMediaAttachmentFocus? focus,
  });
}
