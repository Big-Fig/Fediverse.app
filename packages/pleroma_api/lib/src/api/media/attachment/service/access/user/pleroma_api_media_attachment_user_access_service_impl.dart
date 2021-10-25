import 'dart:io';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../../feature/pleroma_api_feature_model.dart';
import '../../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../../rest/pleroma_api_rest_service.dart';
import '../../../../../service/pleroma_api_service_impl.dart';
import '../../../focus/pleroma_api_media_attachment_focus_model.dart';
import '../../../pleroma_api_media_attachment_model.dart';
import '../../../pleroma_api_media_attachment_model_impl.dart';
import 'pleroma_api_media_attachment_user_access_service.dart';

class PleromaApiMediaAttachmentUserAccessService extends PleromaApiService
    implements IPleromaApiMediaAttachmentUserAccessService {
  final MastodonApiMediaAttachmentUserAccessService
      mastodonApiMediaAttachmentUserAccessService;

  PleromaApiMediaAttachmentUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiMediaAttachmentUserAccessService =
            MastodonApiMediaAttachmentUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(restService: restService) {
    mastodonApiMediaAttachmentUserAccessService.disposeWith(this);
  }

  @override
  Future<PleromaApiMediaAttachment> uploadMedia({
    required File file,
    required File? thumbnail,
    required String? description,
    required IPleromaApiMediaAttachmentFocus? focus,
    required bool? processInBackground,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: uploadMediaFeature,
        fieldFeatures: [
          if (processInBackground != null)
            uploadMediaProcessInBackgroundFeature,
          if (focus != null) uploadMediaFocusFeature,
          if (thumbnail != null) uploadMediaThumbnailFeature,
        ],
        request: mastodonApiMediaAttachmentUserAccessService
            .createUploadMediaRequest(
          file: file,
          thumbnail: thumbnail,
          description: description,
          focus: focus,
          processInBackground: processInBackground,
        ),
        jsonParser: (json) => PleromaApiMediaAttachment.fromJson(json),
      );

  @override
  Future<IPleromaApiMediaAttachment> getMedia({
    required String id,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getMediaFeature,
        fieldFeatures: null,
        request:
            mastodonApiMediaAttachmentUserAccessService.createGetMediaRequest(
          id: id,
        ),
        jsonParser: (json) => PleromaApiMediaAttachment.fromJson(json),
      );

  @override
  IPleromaApiFeature get getMediaFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMediaAttachmentUserAccessService.getMediaFeature,
      );

  @override
  Future<IPleromaApiMediaAttachment> updateMedia({
    required String id,
    required File? file,
    required File? thumbnail,
    required String? description,
    required IPleromaApiMediaAttachmentFocus? focus,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: updateMediaFeature,
        fieldFeatures: [
          if (focus != null) uploadMediaFocusFeature,
          if (thumbnail != null) uploadMediaThumbnailFeature,
        ],
        request: mastodonApiMediaAttachmentUserAccessService
            .createUpdateMediaRequest(
          id: id,
          file: file,
          thumbnail: thumbnail,
          description: description,
          focus: focus,
        ),
        jsonParser: (json) => PleromaApiMediaAttachment.fromJson(json),
      );

  @override
  IPleromaApiFeature get updateMediaFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMediaAttachmentUserAccessService.updateMediaFeature,
      );

  @override
  IPleromaApiFeature get updateMediaFocusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMediaAttachmentUserAccessService.updateMediaFocusFeature,
      );

  @override
  IPleromaApiFeature get updateMediaThumbnailFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMediaAttachmentUserAccessService.updateMediaThumbnailFeature,
      );

  @override
  IPleromaApiFeature get uploadMediaFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMediaAttachmentUserAccessService.uploadMediaFeature,
      );

  @override
  IPleromaApiFeature get uploadMediaFocusFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMediaAttachmentUserAccessService.uploadMediaFocusFeature,
      );

  @override
  IPleromaApiFeature get uploadMediaProcessInBackgroundFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMediaAttachmentUserAccessService
            .uploadMediaProcessInBackgroundFeature,
      );

  @override
  IPleromaApiFeature get uploadMediaThumbnailFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiMediaAttachmentUserAccessService.uploadMediaThumbnailFeature,
      );
}
