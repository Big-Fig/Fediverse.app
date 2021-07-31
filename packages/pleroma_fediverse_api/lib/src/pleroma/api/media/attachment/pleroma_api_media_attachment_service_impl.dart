import 'dart:io';

import 'package:pleroma_fediverse_api/src/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';

class PleromaApiMediaAttachmentService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiMediaAttachmentService {
  @override
  final IPleromaApiAuthRestService restApiAuthService;

  PleromaApiMediaAttachmentService({
    required this.restApiAuthService,
  }) : super(restService: restApiAuthService);

  @override
  Future<PleromaApiMediaAttachment> uploadMedia({
    required File file,
  }) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
      UploadMultipartRestRequest.post(
        relativePath: '/api/v1/media',
        files: {
          'file': file,
        },
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiMediaAttachment.fromJson,
    );
  }
}
