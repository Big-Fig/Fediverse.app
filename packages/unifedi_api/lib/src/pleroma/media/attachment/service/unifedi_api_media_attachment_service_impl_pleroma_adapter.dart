import 'dart:io';

import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/feature/unifedi_api_feature_model.dart';
import '../../../../api/media/attachment/focus/unifedi_api_media_attachment_focus_model.dart';
import '../../../../api/media/attachment/service/unifedi_api_media_attachment_service.dart';
import '../../../../api/media/attachment/unifedi_api_media_attachment_model.dart';
import '../../../../api/rest/unifedi_api_rest_service.dart';
import '../../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../../service/unifedi_api_service_pleroma_adapter.dart';
import '../focus/unifedi_api_media_attachment_focus_model_pleroma_adapter.dart';
import '../unifedi_api_media_attachment_model_pleroma_adapter.dart';

class UnifediApiMediaAttachmentServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiMediaAttachmentService {
  final IPleromaApiMediaAttachmentUserAccessService
      pleromaApiMediaAttachmentUserAccessService;

  UnifediApiMediaAttachmentServicePleromaAdapter({
    required this.pleromaApiMediaAttachmentUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService:
            pleromaApiMediaAttachmentUserAccessService.restService,
      );

  @override
  Future<IUnifediApiMediaAttachment> getMedia({
    required String id,
  }) =>
      pleromaApiMediaAttachmentUserAccessService
          .getMedia(
            id: id,
          )
          .then(
            (value) => value.toUnifediApiMediaAttachmentPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getMediaFeature =>
      pleromaApiMediaAttachmentUserAccessService.getMediaFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiMediaAttachment> updateMedia({
    required String id,
    required File? file,
    required File? thumbnail,
    required String? description,
    required IUnifediApiMediaAttachmentFocus? focus,
  }) =>
      pleromaApiMediaAttachmentUserAccessService
          .updateMedia(
            id: id,
            file: file,
            thumbnail: thumbnail,
            description: description,
            focus: focus?.toPleromaApiMediaAttachmentFocus(),
          )
          .then(
            (value) => value.toUnifediApiMediaAttachmentPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get updateMediaFeature =>
      pleromaApiMediaAttachmentUserAccessService.updateMediaFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get updateMediaFocusFeature =>
      pleromaApiMediaAttachmentUserAccessService.updateMediaFocusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get updateMediaThumbnailFeature =>
      pleromaApiMediaAttachmentUserAccessService.updateMediaThumbnailFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiMediaAttachment> uploadMedia({
    required File file,
    required File? thumbnail,
    required String? description,
    required IUnifediApiMediaAttachmentFocus? focus,
    required bool? processInBackground,
  }) =>
      pleromaApiMediaAttachmentUserAccessService
          .uploadMedia(
            file: file,
            thumbnail: thumbnail,
            description: description,
            focus: focus?.toPleromaApiMediaAttachmentFocus(),
            processInBackground: processInBackground,
          )
          .then(
            (value) => value.toUnifediApiMediaAttachmentPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get uploadMediaFeature =>
      pleromaApiMediaAttachmentUserAccessService.uploadMediaFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get uploadMediaFocusFeature =>
      pleromaApiMediaAttachmentUserAccessService.uploadMediaFocusFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get uploadMediaProcessInBackgroundFeature =>
      pleromaApiMediaAttachmentUserAccessService
          .uploadMediaProcessInBackgroundFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get uploadMediaThumbnailFeature =>
      pleromaApiMediaAttachmentUserAccessService.uploadMediaThumbnailFeature
          .toUnifediApiFeaturePleromaAdapter();
}
