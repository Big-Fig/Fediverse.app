import 'dart:io';

import '../../../feature/unifedi_api_feature_model.dart';
import '../../../unifedi_api_service.dart';
import '../focus/unifedi_api_media_attachment_focus_model.dart';
import '../unifedi_api_media_attachment_model.dart';

abstract class IUnifediApiMediaAttachmentService implements IUnifediApiService {
  IUnifediApiFeature get uploadMediaFeature;

  IUnifediApiFeature get uploadMediaProcessInBackgroundFeature;

  IUnifediApiFeature get uploadMediaFocusFeature;

  IUnifediApiFeature get uploadMediaThumbnailFeature;

  IUnifediApiFeature get updateMediaFeature;

  IUnifediApiFeature get updateMediaFocusFeature;

  IUnifediApiFeature get updateMediaThumbnailFeature;

  IUnifediApiFeature get getMediaFeature;

  Future<IUnifediApiMediaAttachment> getMedia({
    required String id,
  });

  Future<IUnifediApiMediaAttachment> uploadMedia({
    required File file,
    required File? thumbnail,
    required String? description,
    required IUnifediApiMediaAttachmentFocus? focus,
    required bool? processInBackground,
  });

  Future<IUnifediApiMediaAttachment> updateMedia({
    required String id,
    required File? file,
    required File? thumbnail,
    required String? description,
    required IUnifediApiMediaAttachmentFocus? focus,
  });
}
