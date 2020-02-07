import 'dart:io';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_error.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';

class PleromaMediaAttachmentService implements IPleromaMediaAttachmentService {
  final IPleromaRestService restService;

  PleromaMediaAttachmentService({@required this.restService});

  @override
  Future<MediaAttachment> uploadMedia({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        httpMethod: HTTPMethod.POST,
        file: file,
        fileParamKey: "file",
        relativeUrlPath: "/api/v1/media");

    if (httpResponse.statusCode == 200) {
      return MediaAttachment.fromJsonString(httpResponse.body);
    } else {
      throw new PleromaMediaAttachmentUploadError(
          file: file,
          statusCode: httpResponse.statusCode,
          body: httpResponse.body);
    }
  }
}
