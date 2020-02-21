import 'dart:io';

import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_exception.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/Pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';

class PleromaMediaAttachmentService implements IPleromaMediaAttachmentService {
  final IPleromaAuthRestService restService;

  PleromaMediaAttachmentService({@required this.restService});

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isPleromaApiReadyStream =>
      restService.isPleromaApiReadyStream;
  @override
  bool get isPleromaApiReady => restService.isPleromaApiReady;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  @override
  Future<PleromaMediaAttachment> uploadMedia({@required File file}) async {
    var httpResponse = await restService.uploadFileMultipartRequest(
        UploadMultipartRestRequest.post(
            relativePath: "/api/v1/media", files: {"file": file}));

    if (httpResponse.statusCode == 200) {
      return PleromaMediaAttachment.fromJsonString(httpResponse.body);
    } else {
      throw PleromaMediaAttachmentUploadException(
          file: file,
          statusCode: httpResponse.statusCode,
          body: httpResponse.body);
    }
  }
}
