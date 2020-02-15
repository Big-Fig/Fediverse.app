import 'dart:io';

import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_exception.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';

class PleromaMediaAttachmentService implements IPleromaMediaAttachmentService {
  final IPleromaRestService restService;

  PleromaMediaAttachmentService({@required this.restService});

  @override
  Future<MediaAttachment> uploadMedia({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.post(
            relativePath: "/api/v1/media", files: {"file": file}));

    if (httpResponse.statusCode == 200) {
      return MediaAttachment.fromJsonString(httpResponse.body);
    } else {
      throw PleromaMediaAttachmentUploadException(
          file: file,
          statusCode: httpResponse.statusCode,
          body: httpResponse.body);
    }
  }
}
