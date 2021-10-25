import 'dart:io';

import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../../feature/mastodon_api_feature_model.dart';
import '../../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../../rest/mastodon_api_rest_service.dart';
import '../../../../../service/mastodon_api_service_impl.dart';
import '../../../focus/mastodon_api_media_attachment_focus_model.dart';
import '../../../mastodon_api_media_attachment_model.dart';
import '../../../mastodon_api_media_attachment_model_impl.dart';
import 'mastodon_api_media_attachment_user_access_service.dart';

class MastodonApiMediaAttachmentUserAccessService extends MastodonApiService
    implements IMastodonApiMediaAttachmentUserAccessService {
  MastodonApiMediaAttachmentUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(restService: restService);

  @override
  Future<MastodonApiMediaAttachment> uploadMedia({
    required File file,
    required File? thumbnail,
    required String? description,
    required IMastodonApiMediaAttachmentFocus? focus,
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
        request: createUploadMediaRequest(
          file: file,
          thumbnail: thumbnail,
          description: description,
          focus: focus,
          processInBackground: processInBackground,
        ),
        jsonParser: (json) => MastodonApiMediaAttachment.fromJson(json),
      );

  RestRequest createUploadMediaRequest({
    required File file,
    required File? thumbnail,
    required String? description,
    required IMastodonApiMediaAttachmentFocus? focus,
    required bool? processInBackground,
  }) =>
      RestRequest.post(
        relativePath:
            processInBackground == true ? '/api/v2/media' : '/api/v1/media',
        files: {
          'file': file,
          if (thumbnail != null) 'thumbnail': thumbnail,
        },
        bodyJson: <String, dynamic>{
          if (focus != null) 'focus': focus.toJson(),
          if (description != null) 'description': description,
        },
      );

  RestRequest createUpdateMediaRequest({
    required String id,
    required File? file,
    required File? thumbnail,
    required String? description,
    required IMastodonApiMediaAttachmentFocus? focus,
  }) =>
      RestRequest.put(
        relativePath: UrlPathHelper.join(
          [
            '/api/v1/media',
            id,
          ],
        ),
        files: {
          if (thumbnail != null) 'thumbnail': thumbnail,
          if (file != null) 'file': file,
        },
        bodyJson: <String, dynamic>{
          if (focus != null) 'focus': focus.toJson(),
          if (description != null) 'description': description,
        },
      );

  @override
  Future<IMastodonApiMediaAttachment> updateMedia({
    required String id,
    required File? file,
    required File? thumbnail,
    required String? description,
    required IMastodonApiMediaAttachmentFocus? focus,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: uploadMediaFeature,
        fieldFeatures: [
          if (focus != null) uploadMediaFocusFeature,
          if (thumbnail != null) uploadMediaThumbnailFeature,
        ],
        request: createUpdateMediaRequest(
          id: id,
          file: file,
          thumbnail: thumbnail,
          description: description,
          focus: focus,
        ),
        jsonParser: (json) => MastodonApiMediaAttachment.fromJson(json),
      );

  @override
  Future<IMastodonApiMediaAttachment> getMedia({
    required String id,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getMediaFeature,
        fieldFeatures: null,
        request: createGetMediaRequest(id: id),
        jsonParser: (json) => MastodonApiMediaAttachment.fromJson(json),
      );

  RestRequest createGetMediaRequest({
    required String id,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            '/api/v1/media',
            id,
          ],
        ),
      );

  @override
  MastodonApiFeature get getMediaFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeMedia,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_3,
      );

  @override
  MastodonApiFeature get updateMediaFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeMedia,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_3,
      );

  @override
  IMastodonApiFeature get updateMediaFocusFeature => updateMediaFeature;

  @override
  IMastodonApiFeature get updateMediaThumbnailFeature =>
      updateMediaFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_2_0,
      );

  @override
  MastodonApiFeature get uploadMediaFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement: MastodonApiAccessScopesRequirement.writeMedia,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get uploadMediaFocusFeature =>
      uploadMediaFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_3_0,
      );

  @override
  IMastodonApiFeature get uploadMediaProcessInBackgroundFeature =>
      uploadMediaFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_3,
      );

  @override
  IMastodonApiFeature get uploadMediaThumbnailFeature =>
      uploadMediaFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_2_0,
      );
}
