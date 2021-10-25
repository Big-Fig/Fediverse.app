import 'dart:io';

import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/feature/unifedi_api_feature_model.dart';
import '../../../../api/media/attachment/focus/unifedi_api_media_attachment_focus_model.dart';
import '../../../../api/media/attachment/service/unifedi_api_media_attachment_service.dart';
import '../../../../api/media/attachment/unifedi_api_media_attachment_model.dart';
import '../../../../api/rest/unifedi_api_rest_service.dart';
import '../../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../../service/unifedi_api_service_mastodon_adapter.dart';
import '../focus/unifedi_api_media_attachment_focus_model_mastodon_adapter.dart';
import '../unifedi_api_media_attachment_model_mastodon_adapter.dart';

class UnifediApiMediaAttachmentServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiMediaAttachmentService {
  final IMastodonApiMediaAttachmentUserAccessService
      mastodonApiMediaAttachmentUserAccessService;

  UnifediApiMediaAttachmentServiceMastodonAdapter({
    required this.mastodonApiMediaAttachmentUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiMediaAttachmentUserAccessService.restService,
      );

  @override
  Future<IUnifediApiMediaAttachment> getMedia({
    required String id,
  }) =>
      mastodonApiMediaAttachmentUserAccessService
          .getMedia(
            id: id,
          )
          .then(
            (value) => value.toUnifediApiMediaAttachmentMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get getMediaFeature =>
      mastodonApiMediaAttachmentUserAccessService.getMediaFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiMediaAttachment> updateMedia({
    required String id,
    required File? file,
    required File? thumbnail,
    required String? description,
    required IUnifediApiMediaAttachmentFocus? focus,
  }) =>
      mastodonApiMediaAttachmentUserAccessService
          .updateMedia(
            id: id,
            file: file,
            thumbnail: thumbnail,
            description: description,
            focus: focus?.toMastodonApiMediaAttachmentFocus(),
          )
          .then(
            (value) => value.toUnifediApiMediaAttachmentMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get updateMediaFeature =>
      mastodonApiMediaAttachmentUserAccessService.updateMediaFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get updateMediaFocusFeature =>
      mastodonApiMediaAttachmentUserAccessService.updateMediaFocusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get updateMediaThumbnailFeature =>
      mastodonApiMediaAttachmentUserAccessService.updateMediaThumbnailFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiMediaAttachment> uploadMedia({
    required File file,
    required File? thumbnail,
    required String? description,
    required IUnifediApiMediaAttachmentFocus? focus,
    required bool? processInBackground,
  }) =>
      mastodonApiMediaAttachmentUserAccessService
          .uploadMedia(
            file: file,
            thumbnail: thumbnail,
            description: description,
            focus: focus?.toMastodonApiMediaAttachmentFocus(),
            processInBackground: processInBackground,
          )
          .then(
            (value) => value.toUnifediApiMediaAttachmentMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get uploadMediaFeature =>
      mastodonApiMediaAttachmentUserAccessService.uploadMediaFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get uploadMediaFocusFeature =>
      mastodonApiMediaAttachmentUserAccessService.uploadMediaFocusFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get uploadMediaProcessInBackgroundFeature =>
      mastodonApiMediaAttachmentUserAccessService
          .uploadMediaProcessInBackgroundFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get uploadMediaThumbnailFeature =>
      mastodonApiMediaAttachmentUserAccessService.uploadMediaThumbnailFeature
          .toUnifediApiFeatureMastodonAdapter();
}
