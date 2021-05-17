import 'dart:io';

import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';

class PleromaMediaAttachmentService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaMediaAttachmentService {
  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaMediaAttachmentService({
    required this.restService,
  }) : super(restService: restService);

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
